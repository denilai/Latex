t1:
mosquitto_sub -v -h "demo.thingsboard.io" -t "v1/devices/me/rpc/request/+" -u "nS83gBMMgHxwPq4yXVW9"
mosquitto_pub -d -q 1 -h "demo.thingsboard.io" -t "v1/devices/me/telemetry" -u "nS83gBMMgHxwPq4yXVW9" -m "{"motion": 800}"
mosquitto_pub -d -q 1 -h "demo.thingsboard.io" -t "v1/devices/me/rpc/response/2" -u "nS83gBMMgHxwPq4yXVW9" -m "{"fan_state": 1}"

t2:
mosquitto_sub -v -h "demo.thingsboard.io" -t "v1/devices/me/rpc/request/+" -u "RxcWZHP60DTvKzcgWB0T"
mosquitto_pub -d -q 1 -h "demo.thingsboard.io" -t "v1/devices/me/telemetry" -u "RxcWZHP60DTvKzcgWB0T" -m "{"redButton": 1, "greenButton": 0}"
mosquitto_pub -d -q 1 -h "demo.thingsboard.io" -t "v1/devices/me/rpc/response/2" -u "RxcWZHP60DTvKzcgWB0T" -m "{"redLightState": 1, "greenLightState": 0}"