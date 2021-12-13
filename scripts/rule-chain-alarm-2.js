var details = {};
var request_params = JSON.parse(metadata.ss_params);

if (metadata.prevAlarmDetails) {
    details = JSON.parse(metadata.prevAlarmDetails);
    //remove prevAlarmDetails from metadata
    delete metadata.prevAlarmDetails;
    //now metadata is the same as it comes IN this rule node
}

details.send_status = request_params.state; 
details.answer_status = msg.fan_state;

return details;