var lightGreen = false;
var lightRed = false;
defineRule("green_light", {
    whenChanged: "wb-gpio/MOD1_IN2",
    then: function(newValue, devName, cellName) {
        if (newValue) {
            lightGreen = !lightGreen;
            lightRed = false;
        }
        dev["wb-gpio"]["EXT1_R3A3"] = lightRed;
        dev["wb-gpio"]["EXT1_R3A2"] = lightGreen;
        dev["wb-msw-v3_21"]["Red LED"] = lightRed;
        dev["wb-msw-v3_21"]["Green LED"] = lightGreen;
    }
});
defineRule("red_light", {
    whenChanged: "wb-gpio/MOD1_IN3",
    then: function(newValue, devName, cellName) {
        if (newValue) {
            lightRed = !lightRed;
            lightGreen = false;
        }
        dev["wb-gpio"]["EXT1_R3A3"] = lightRed;
        dev["wb-gpio"]["EXT1_R3A2"] = lightGreen;
        dev["wb-msw-v3_21"]["Red LED"] = lightRed;
        dev["wb-msw-v3_21"]["Green LED"] = lightGreen;
    }
});
