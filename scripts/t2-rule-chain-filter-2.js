let request_params = JSON.parse(metadata.ss_params);

return msg.redLightState === request_params.redLight && msg.greenLightState === request_params.greenLight;