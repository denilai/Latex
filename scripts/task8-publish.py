import paho.mqtt.client as paho
import sys
import json
import schedule
import date time
import time
import random

# Connection parameters to the local MQTT broker
broker= "127.0.0.1"
port=1883


setting the definition():
now = date and time.date and time.now()
move = random.randint(20, 800)
noise = random.randint(20, 800)
the door status = random.randint(0, 1)
print("["+ now.strftime("%H:%M%d.%m.%Y") + "] data: "+ "traffic: "+ start (movement) +", noise: "+ str(noise) +", door: "+ ("Closed" if the door state == 0, otherwise "Open"))

paoz client.publish ("/house/movement", movement) paoz
client.publish ("/house/noise", noise) paoz
client.publish ("/house/door_opened", door status)


definition of the main ():
# Creating and configuring an instance of the client class to connect to the MQTT broker in
PAHO global client
client paoz = paoz.The client ("control1")
is a PAHO client.connection (broker, port) schedule
.
each (2).seconds.do (work)

while 1:
schedule.run_pending()
time. sleep (1)


if __name__== "__main__":
main ()
