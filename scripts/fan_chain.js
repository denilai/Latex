function getNewFanState(motion){
    return motion > 700;
}

let newMsg = {};
let newMsgType = '';

newMsg = {
    "method" : "setFanState",
    "params":{
        "state": getNewFanState(msg.motion)
    }
};

newMsgType = "POST_ATTRIBUTES_REQUEST";


return {msg: newMsg, metadata: metadata, msgType: newMsgType};