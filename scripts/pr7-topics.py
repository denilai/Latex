def on_connect(client, userdata, flags, rc):
client.subscribe('/devices/wb-msw-v3_21/controls/CO2')
client.subscribe('/devices/wb-msw-v3_21/controls/Sound Level')
client.subscribe('/devices/wb-ms_11/controls/Illuminance')
client.subscribe('/devices/wb-ms_11/controls/Temperature')
