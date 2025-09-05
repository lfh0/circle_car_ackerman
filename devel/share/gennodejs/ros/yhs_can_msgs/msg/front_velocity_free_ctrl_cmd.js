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

class front_velocity_free_ctrl_cmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ctrl_cmd_gear = null;
      this.free_ctrl_cmd_velocity_lf = null;
      this.free_ctrl_cmd_velocity_rf = null;
    }
    else {
      if (initObj.hasOwnProperty('ctrl_cmd_gear')) {
        this.ctrl_cmd_gear = initObj.ctrl_cmd_gear
      }
      else {
        this.ctrl_cmd_gear = 0;
      }
      if (initObj.hasOwnProperty('free_ctrl_cmd_velocity_lf')) {
        this.free_ctrl_cmd_velocity_lf = initObj.free_ctrl_cmd_velocity_lf
      }
      else {
        this.free_ctrl_cmd_velocity_lf = 0.0;
      }
      if (initObj.hasOwnProperty('free_ctrl_cmd_velocity_rf')) {
        this.free_ctrl_cmd_velocity_rf = initObj.free_ctrl_cmd_velocity_rf
      }
      else {
        this.free_ctrl_cmd_velocity_rf = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type front_velocity_free_ctrl_cmd
    // Serialize message field [ctrl_cmd_gear]
    bufferOffset = _serializer.uint8(obj.ctrl_cmd_gear, buffer, bufferOffset);
    // Serialize message field [free_ctrl_cmd_velocity_lf]
    bufferOffset = _serializer.float32(obj.free_ctrl_cmd_velocity_lf, buffer, bufferOffset);
    // Serialize message field [free_ctrl_cmd_velocity_rf]
    bufferOffset = _serializer.float32(obj.free_ctrl_cmd_velocity_rf, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type front_velocity_free_ctrl_cmd
    let len;
    let data = new front_velocity_free_ctrl_cmd(null);
    // Deserialize message field [ctrl_cmd_gear]
    data.ctrl_cmd_gear = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [free_ctrl_cmd_velocity_lf]
    data.free_ctrl_cmd_velocity_lf = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [free_ctrl_cmd_velocity_rf]
    data.free_ctrl_cmd_velocity_rf = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'yhs_can_msgs/front_velocity_free_ctrl_cmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6ccb4ea5d60635b5d1a6ac7be60374c9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8    ctrl_cmd_gear
    float32  free_ctrl_cmd_velocity_lf
    float32  free_ctrl_cmd_velocity_rf
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new front_velocity_free_ctrl_cmd(null);
    if (msg.ctrl_cmd_gear !== undefined) {
      resolved.ctrl_cmd_gear = msg.ctrl_cmd_gear;
    }
    else {
      resolved.ctrl_cmd_gear = 0
    }

    if (msg.free_ctrl_cmd_velocity_lf !== undefined) {
      resolved.free_ctrl_cmd_velocity_lf = msg.free_ctrl_cmd_velocity_lf;
    }
    else {
      resolved.free_ctrl_cmd_velocity_lf = 0.0
    }

    if (msg.free_ctrl_cmd_velocity_rf !== undefined) {
      resolved.free_ctrl_cmd_velocity_rf = msg.free_ctrl_cmd_velocity_rf;
    }
    else {
      resolved.free_ctrl_cmd_velocity_rf = 0.0
    }

    return resolved;
    }
};

module.exports = front_velocity_free_ctrl_cmd;
