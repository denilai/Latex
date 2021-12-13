let request_params = JSON.parse(metadata.ss_params);

return msg.fan_state === request_params.state;