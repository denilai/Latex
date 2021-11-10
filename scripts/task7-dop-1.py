#!/usr/bin/python3
import sys
import json
import schedule
import datetime
import time
import random

data = []

def job():
	now = datetime.datetime.now()
	data.append({"timestamp": now.isoformat(), "motion": random.randint(20, 800), "noise": random.randint(20, 800), "door_open" : random.randint(0, 1)})
	
schedule.every(2).seconds.do(job)

try:
	while 1:
		schedule.run_pending()
		time.sleep(1)
finally:
	with open("dop-out.json", "w") as file:
		json_string = json.dumps({"data": data})
		file.write(json_string)
