import paho.mqtt.client as mqtt
import json
import datetime
import xmltodict


# Connection parameters to the MQTT broker
HOST = "192.168.1.12" # Suitcase IP
PORT = 1883 # Standard connection port for Mosquitto
KEEPALIVE = 60 # Waiting time for message delivery, if it is exceeded when sending, the broker will be considered unavailable

# Dictionary with topics and parameters collected from them
SUB_TOPICS = {
'/devices/wb-msw-v3_21/controls/CO2': 'co2',
'/devices/wb-msw-v3_21/controls/Sound Level': 'noise',
'/devices/wb-ms_11/controls/Illuminance': 'illuminance',
'/devices/wb-ms_11/controls/Temperature': 'temp'
}

# Creating a dictionary for storing JSON data
JSON_DICT = {}
for value in SUB_TOPICS.values():
JSON_DICT[value] = 0

JSON_DICT["group"] = 12;
JSON_DICT["time"] = "";


def on_connect(client, userdata, flags, rc):
""" Function called when connecting to the broker

Arguments:
client - An instance of the Client class that manages the connection to the broker
userdata - Private user data transmitted during connection
flags - Response flags returned by the broker
rc is the result of the connection, if 0, everything is fine, otherwise go to the documentation
"""
print("Connected with result code " + str(rc))

# Connecting to all the topics specified above
for topic in SUB_TOPICS.keys():
client.subscribe(topic)

def on_message(client, userdata, msg):
""" Function called when receiving a message from a broker on one of the monitored topics

Arguments:
client - An instance of the Client class that manages the connection to the broker
userdata - Private user data transmitted during connection
msg - A message coming from the broker with all the information
"""
payload = msg.payload.decode() # The main value coming in the message, for example, the temperature indicator
topic = msg.topic # The topic from which the message came, since the function processes messages from all topics

param_name = SUB_TOPICS[topic]
JSON_DICT[param_name] = payload
print(topic + " " + payload)

now = datetime.datetime.now()
JSON_DICT["time"] = now.strftime("%H:%M %d.%m.%Y");

# Writing data to a file
with open('data.json', 'w') as file:
json_string = json.dumps(JSON_DICT) # Generating a JSON string from a dictionary
file.write(json_string)

with open('data.xml', 'w') as file:
xml = xmltodict.unparse({"data": JSON_DICT}, pretty=True) # Generating an XML string from a dictionary
file.write(xml)

def main():
# Creating and configuring an instance of the Client class to connect to Mosquitto
client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message
client.connect(HOST, PORT, KEEPALIVE)

client.loop_forever() # Infinite internal loop of the client waiting for messages


if __name__ == "__main__":
main()
