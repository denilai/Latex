import paho.mqtt.client as paho
import sys
import json
import schedule
import datetime
import time
import random

# Connection parameters to the MQTT broker
broker="demo.thingsboard.io"
port=1883

USERNAME = "i1Ohu4cIi2Q7OqUAHf21" # Login to connect to the broker


def job():
	now = datetime.datetime.now()
	motion = random.randint(20, 800)
	noise = random.randint(20, 800)
	doorState = random.randint(0, 1)
	print("[" + now.strftime("%H:%M %d.%m.%Y") + "] data: " + "motion: " + str(motion) + ", noise: " + str(noise) + ", door: " + ("Closed" if doorState == 0 else "Open"))
	
	data = {
		"timestamp" : now.isoformat(),
		"motion" : motion,
		"noise": noise,
		"door_open" : doorState
	}
	
	pahoClient.publish("v1/devices/me/telemetry", json.dumps(data))


def main():
	# Creating and configuring an instance of the Client class to connect to the MQTT broker
	global pahoClient
	pahoClient	= paho.Client("control1")
	pahoClient.username_pw_set(USERNAME)
	pahoClient.connect(broker,port)
	
	schedule.every(2).seconds.do(job)

	while 1:
		schedule.run_pending()
		time.sleep(1)


if __name__ == "__main__":
    main()
