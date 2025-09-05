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

class rear_velocity_free_ctrl_cmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ctrl_cmd_gear = null;
      this.free_ctrl_cmd_velocity_lr = null;
      this.free_ctrl_cmd_velocity_rr = null;
    }
    else {
      if (initObj.hasOwnProperty('ctrl_cmd_gear')) {
        this.ctrl_cmd_gear = initObj.ctrl_cmd_gear
      }
      else {
        this.ctrl_cmd_gear = 0;
      }
      if (initObj.hasOwnProperty('free_ctrl_cmd_velocity_lr')) {
        this.free_ctrl_cmd_velocity_lr = initObj.free_ctrl_cmd_velocity_lr
      }
      else {
        this.free_ctrl_cmd_velocity_lr = 0.0;
      }
      if (initObj.hasOwnProperty('free_ctrl_cmd_velocity_rr')) {
        this.free_ctrl_cmd_velocity_rr = initObj.free_ctrl_cmd_velocity_rr
      }
      else {
        this.free_ctrl_cmd_velocity_rr = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rear_velocity_free_ctrl_cmd
    // Serialize message field [ctrl_cmd_gear]
    bufferOffset = _serializer.uint8(obj.ctrl_cmd_gear, buffer, bufferOffset);
    // Serialize message field [free_ctrl_cmd_velocity_lr]
    bufferOffset = _serializer.float32(obj.free_ctrl_cmd_velocity_lr, buffer, bufferOffset);
    // Serialize message field [free_ctrl_cmd_velocity_rr]
    bufferOffset = _serializer.float32(obj.free_ctrl_cmd_velocity_rr, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rear_velocity_free_ctrl_cmd
    let len;
    let data = new rear_velocity_free_ctrl_cmd(null);
    // Deserialize message field [ctrl_cmd_gear]
    data.ctrl_cmd_gear = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [free_ctrl_cmd_velocity_lr]
    data.free_ctrl_cmd_velocity_lr = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [free_ctrl_cmd_velocity_rr]
    data.free_ctrl_cmd_velocity_rr = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'yhs_can_msgs/rear_velocity_free_ctrl_cmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8a09af7b0d1e28fe6145a435936a53e7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8    ctrl_cmd_gear
    float32  free_ctrl_cmd_velocity_lr
    float32  free_ctrl_cmd_velocity_rr
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new rear_velocity_free_ctrl_cmd(null);
    if (msg.ctrl_cmd_gear !== undefined) {
      resolved.ctrl_cmd_gear = msg.ctrl_cmd_gear;
    }
    else {
      resolved.ctrl_cmd_gear = 0
    }

    if (msg.free_ctrl_cmd_velocity_lr !== undefined) {
      resolved.free_ctrl_cmd_velocity_lr = msg.free_ctrl_cmd_velocity_lr;
    }
    else {
      resolved.free_ctrl_cmd_velocity_lr = 0.0
    }

    if (msg.free_ctrl_cmd_velocity_rr !== undefined) {
      resolved.free_ctrl_cmd_velocity_rr = msg.free_ctrl_cmd_velocity_rr;
    }
    else {
      resolved.free_ctrl_cmd_velocity_rr = 0.0
    }

    return resolved;
    }
};

module.exports = rear_velocity_free_ctrl_cmd;
