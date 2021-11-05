import sys
import json
import xmltodict

def hello(fileName):
	data = {}
	with open(fileName, "r") as file:
		data = json.load(file)
	
	newData = []
	
	for entry in data["data"]:
			newData.append({"timestamp": entry["timestamp"], "group": 5, "motion": entry["motion"], "temperature": entry["temperature"], "sound": entry["sound"], "illuminace": entry["illuminace"]})
	
	with open("data.json", "w") as file:
		json_string = json.dumps({"data": newData})
		file.write(json_string)
		
	with open('data.xml', 'w') as file:
		xml = xmltodict.unparse({"data":{"entry": newData}}, pretty=True)
		file.write(xml)

if __name__ == "__main__":
    hello(sys.argv[1])
