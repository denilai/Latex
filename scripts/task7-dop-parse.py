import sys
import json
import xmltodict

def hello(fileName):
	data = {}
	with open(fileName, "r") as file:
		data = json.load(file)["data"]
	
	for entry in data:
		print("[" + entry["timestamp"] + "] data: " + "motion: " + str(entry["motion"]) + ", noise: " + str(entry["noise"]) + ", door: " + ("Closed" if entry["door_open"] == 1 else "Open"))

if __name__ == "__main__":
    hello(sys.argv[1])
