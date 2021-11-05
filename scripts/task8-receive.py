import paho.mqtt.client as mqtt
import json
import datetime
import xmltodict
from threading import Thread
import time
import schedule
import sqlite3
import traceback


# Connection parameters to the MQTT broker
HOST = "srv1.clusterfly.ru " # Broker's MQTT address and port.
PORT = 9124
KEEPALIVE = 60

USERNAME = "user_2f789eac" # Login and password to connect to the broker
PASSWORD = "pass_7a06bafa"


# Dictionary with topics and parameters collected from them
SUB_TOPICS = {
USERNAME + '/house/motion': 'motion',
USERNAME + '/house/noise': 'noise',
USERNAME + '/house/door_open': 'door_open',
}

# Helper class for working with Sqlite 3 database
class DatabaseController:
def __init__(self, filepath="./database.db"):
self.filepath = filepath
self._connection = None

# Establish a connection to the database and create a table if there is none
def connect(self) -> bool:
try:
self._connection = sqlite3.connect(self.filepath)
self._connection.execute("CREATE TABLE IF NOT EXISTS wb_proj_group5( \
entryId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, \
noise INTEGER, \
motion INTEGER, \
door INTEGER, \
timestamp DATETIME DEFAULT(datetime('now','localtime'))\
)")
return True
except sqlite3.Error:
return False

# Write data to a table
INSERT_QUERY = "INSERT INTO wb_proj_group5(noise, motion, door) VALUES(?, ?, ?)"
def write(self, noise: int, motion: int, door: bool) -> bool:
try:
self._connection.execute(self.INSERT_QUERY, tuple((noise, motion, door)))
self._connection.commit()
return True
except sqlite3.Error:
return False

# Get data from the table
GET_QUERY = "SELECT * FROM wb_proj_group5 WHERE entryId=?"
def get_by_id(self, id):
try:
return self._connection.execute(self.GET_QUERY, (id,)).fetchall()
except sqlite3.Error:
return None

# Get data from the table
GET_ALL_QUERY = "SELECT * FROM wb_proj_group5"
def get_all(self):
try:
return self._connection.execute(self.GET_ALL_QUERY).fetchall()
except sqlite3.Error:
return None

# Count the number of rows in the table
COUNT_QUERY = "SELECT COUNT(*) FROM wb_proj_group5"
def count(self) -> int:
try:
return self._connection.execute(self.COUNT_QUERY).fetchall()[0][0]
except sqlite3.Error:
return 0

# Creating a dictionary for storing data
dataDict = {}
for value in SUB_TOPICS.values():
dataDict[value] = 0


# Connecting to all the topics specified above
def on_connect(client, userdata, flags, rc):
print("Connected with result code " + str(rc))

for topic in SUB_TOPICS.keys():
client.subscribe(topic)

# This function is called when new data is received.
def on_message(client, userdata, msg):
payload = msg.payload.decode()
topic = msg.topic

param_name = SUB_TOPICS[topic]
dataDict[param_name] = payload

# This function is called periodically to save the results to the local database
def job():
now = datetime.datetime.now()
dataDict["timestamp"] = now.strftime("%H:%M %d.%m.%Y");
db.write(int(dataDict["noise"]), int(dataDict["motion"]), bool(dataDict["door_open"]))
print("[" + dataDict["timestamp"] + "] received: " + "motion: " + str(dataDict["motion"]) + ", noise: " + str(dataDict["noise"]) + ", door: " + ("Closed" if int(dataDict["door_open"]) == 0 else "Open"))


def schedulerThread(running):
global db
db = DatabaseController()
db.connect()
schedule.every(2).seconds.do(job)

while running():
schedule.run_pending()
time.sleep(1)


def main():
# Creating and configuring an instance of the Client class to connect to the MQTT broker
client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message
client.username_pw_set(USERNAME, PASSWORD)
client.connect(HOST, PORT, KEEPALIVE)

# Setup save data on a periodic basis
running = True
proc = Thread(target=schedulerThread, args =(lambda : running ))
proc.start()

try:
client.loop_forever() # Infinite internal loop of the client waiting for messages
finally:
running = False
proc.join()


if __name__ == "__main__":
main()
