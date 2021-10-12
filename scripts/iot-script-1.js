defineRule("motionControl", {
    whenChanged: "wb-msw-v3_21/Current Motion",
    then: function (newValue, devName, cellName) {
        if ( newValue > 700) {
        dev["wb-mr3_56"]["K2"] = true;
        } else {
            setTimeout(function () {
                dev["wb-mr3_56"]["K2"] = false;
            }, 5000);
        }
    }
});
