from datetime import datetime

import matplotlib.pyplot as plt
import csv
import json
import sys


# Function of getting an instance of the class for writing CSV
def get_csv_writer(filestream, fieldnames):
return csv.DictWriter(
filestream, # File stream
fieldnames=fieldnames, # Names of dictionary fields and CSV file headers
delimiter=';', # Delimiter of the CSV file
quotechar='"', # Quotes to frame text values containing a separator character
quoting=csv.QUOTE_MINIMAL, # Quote placement policy
lineterminator='\n'
)


# Function of getting an instance of the class to read CSV
def get_csv_reader(filestream, fieldnames):
return csv.DictReader(
filestream,
fieldnames=fieldnames,
delimiter=';',
quotechar='"',
quoting=csv.QUOTE_MINIMAL,
lineterminator='\n'
)


# Function for getting data from a json file
def get_data_from_json(filename):
with open(filename, 'r') as file:
data = file.read()

return json.loads(data)


def create_plots(plots_data_lists):
# Creating graphs for data rendering
fig, axs = plt.subplots(1, 2, figsize=(15,6)) # We get a window with 1 column and 2 columns of graphs
plt.gcf().autofmt_xdate()
# fig is the window in which the graphs will be drawn
# axs contains a list of graphs for drawing values on them

# Setting a set of points to draw
# The first argument is a list of values on the X axis, the second argument is on the Y axis
axs[0].plot(plots_data_lists['timestamp'], plots_data_lists['motion'])
# Setting labels for axes and graph
axs[0].set_xlabel('Time')
axs[0].set_ylabel('Motion level')
axs[0].set_title('Motion graph in the room')

# Forming a histogram
axs[1].hist(plots_data_lists['voltage'])
axs[1].set_xlabel('Voltage (Volts)')
axs[1].set_ylabel('Frequency of occurrence')
axs[1].set_title('Voltage suitcase')

fig1, axs1 = plt.subplots()
plt.gcf().autofmt_xdate()

types = ["<400", '400-500', '500-550', '550-600', '>600']
typesValues = [0, 0, 0, 0, 0]
explode = [0, 0, 0.1, 0, 0]

for val in plots_data_lists['illuminace']:
if val < 400:
typesValues[0] += 1
elif val < 500:
typesValues[1] += 1
elif val < 550:
typesValues[2] += 1
elif val < 600:
typesValues[3] += 1
else:
typesValues[4] += 1

axs1.pie(typesvalues, labels =types, explode=explode , autopct = "%0.2f%%")
axs1.set_title('Room lighting levels')

return fig, axs


def main(fileName):
json_dict = get_data_from_json(fileName)
data_list = json_dict['data']

fieldnames = ['timestamp', 'motion', 'voltage', 'illuminace']

# Creating lists to store data for graphs plots_data_lists
= {
'voltage': [],
'motion': [],
'illuminace': [],
'timestamp': []
}

# Creating a CSV file
with open("data.csv", "w") as csv_file:
# Getting an object to work with CSV
csv_writer = get_csv_writer(csv_file, fieldnames)

# Writing headers to a CSV file passed to the fieldnames field
csv_writer.writeheader()

# Writing data to a CSV file
for info_dict in data_list:
csv_writer.writerow({
'timestamp': info_dict['timestamp'],
'motion': info_dict['motion'],
'voltage': info_dict['voltage'],
'illuminace': info_dict['illuminace']})


with open('data.csv', 'r') as csv_file:
# Creating an object to read CSV (parameters correspond to DictWriter)
csv_reader = get_csv_reader(csv_file, fieldnames)

line_count = 0
for row in csv_reader:
# The title is always read in the zero line
if line_count == 0:
line_count += 1
continue

# Filling lists with data, with conversion of types
plots_data_lists['timestamp'].append(datetime.fromisoformat(row['timestamp']))
plots_data_lists['motion'].append(int(row['motion']))
plots_data_lists['illuminace'].append(float(row['illuminace']))
plots_data_lists['voltage'].append(float(row['voltage']))

line_count += 1

fig, axs = create_plots(plots_data_lists)

# Rendering the window
plt.show()


if __name__ == "__main__":
main(sys.argv[1])
