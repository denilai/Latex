function GetRedLightState(msg){
    return msg.redButton == 1 && msg.greenButton == 0;
}

function GetGreenLightState(msg){
    return msg.redButton == 0 && msg.greenButton == 1;
}

let newMsg = {};
let newMsgType = '';

newMsg = {
    "method" : "setLightsState",
    "params":{
        "redLight": GetRedLightState(msg),
        "greenLight": GetGreenLightState(msg)
    }
};

newMsgType = "POST_ATTRIBUTES_REQUEST";

return {msg: msg, metadata: metadata, msgType: msgType};
