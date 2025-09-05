// Auto-generated. Do not edit!

// (in-package yhs_can_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ctrl_cmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ctrl_cmd_gear = null;
      this.ctrl_cmd_linear = null;
      this.ctrl_cmd_angular = null;
      this.ctrl_cmd_slipangle = null;
    }
    else {
      if (initObj.hasOwnProperty('ctrl_cmd_gear')) {
        this.ctrl_cmd_gear = initObj.ctrl_cmd_gear
      }
      else {
        this.ctrl_cmd_gear = 0;
      }
      if (initObj.hasOwnProperty('ctrl_cmd_linear')) {
        this.ctrl_cmd_linear = initObj.ctrl_cmd_linear
      }
      else {
        this.ctrl_cmd_linear = 0.0;
      }
      if (initObj.hasOwnProperty('ctrl_cmd_angular')) {
        this.ctrl_cmd_angular = initObj.ctrl_cmd_angular
      }
      else {
        this.ctrl_cmd_angular = 0.0;
      }
      if (initObj.hasOwnProperty('ctrl_cmd_slipangle')) {
        this.ctrl_cmd_slipangle = initObj.ctrl_cmd_slipangle
      }
      else {
        this.ctrl_cmd_slipangle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ctrl_cmd
    // Serialize message field [ctrl_cmd_gear]
    bufferOffset = _serializer.uint8(obj.ctrl_cmd_gear, buffer, bufferOffset);
    // Serialize message field [ctrl_cmd_linear]
    bufferOffset = _serializer.float32(obj.ctrl_cmd_linear, buffer, bufferOffset);
    // Serialize message field [ctrl_cmd_angular]
    bufferOffset = _serializer.float32(obj.ctrl_cmd_angular, buffer, bufferOffset);
    // Serialize message field [ctrl_cmd_slipangle]
    bufferOffset = _serializer.float32(obj.ctrl_cmd_slipangle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ctrl_cmd
    let len;
    let data = new ctrl_cmd(null);
    // Deserialize message field [ctrl_cmd_gear]
    data.ctrl_cmd_gear = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [ctrl_cmd_linear]
    data.ctrl_cmd_linear = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ctrl_cmd_angular]
    data.ctrl_cmd_angular = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ctrl_cmd_slipangle]
    data.ctrl_cmd_slipangle = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'yhs_can_msgs/ctrl_cmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cea8aa41b6a865fbd2628e5a43e04d12';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8    ctrl_cmd_gear
    float32  ctrl_cmd_linear
    float32  ctrl_cmd_angular
    float32  ctrl_cmd_slipangle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ctrl_cmd(null);
    if (msg.ctrl_cmd_gear !== undefined) {
      resolved.ctrl_cmd_gear = msg.ctrl_cmd_gear;
    }
    else {
      resolved.ctrl_cmd_gear = 0
    }

    if (msg.ctrl_cmd_linear !== undefined) {
      resolved.ctrl_cmd_linear = msg.ctrl_cmd_linear;
    }
    else {
      resolved.ctrl_cmd_linear = 0.0
    }

    if (msg.ctrl_cmd_angular !== undefined) {
      resolved.ctrl_cmd_angular = msg.ctrl_cmd_angular;
    }
    else {
      resolved.ctrl_cmd_angular = 0.0
    }

    if (msg.ctrl_cmd_slipangle !== undefined) {
      resolved.ctrl_cmd_slipangle = msg.ctrl_cmd_slipangle;
    }
    else {
      resolved.ctrl_cmd_slipangle = 0.0
    }

    return resolved;
    }
};

module.exports = ctrl_cmd;
