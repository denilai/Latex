var details = {};
var request_params = JSON.parse(metadata.ss_params);

if (metadata.prevAlarmDetails) {
    details = JSON.parse(metadata.prevAlarmDetails);
    //remove prevAlarmDetails from metadata
    delete metadata.prevAlarmDetails;
    //now metadata is the same as it comes IN this rule node
}

details.expected = request_params;
details.received = msg;

return details;