import sys
import json
import xmltodict

def hello(fileName):
	data = {}
	with open(fileName, "r") as file:
		if fileName.endswith(".json"):
			data = json.load(file)["data"]
		else:
			data = xmltodict.parse(file.read())
			data = json.loads(json.dumps(data))["data"]["entry"]
	
	for entry in data:
		print("[" + entry["timestamp"] + "] data: " + "motion: " + str(entry["motion"]) + ", sound: " + str(entry["sound"]) + ", illuminace: " + str(entry["illuminace"]) + ", temperature: " + str(entry["temperature"]))

if __name__ == "__main__" : hello(sys.argv[1])
