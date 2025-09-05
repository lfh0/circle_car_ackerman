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

class steering_ctrl_cmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ctrl_cmd_gear = null;
      this.steering_ctrl_cmd_velocity = null;
      this.steering_ctrl_cmd_steering = null;
      this.steering_ctrl_cmd_slipangle = null;
    }
    else {
      if (initObj.hasOwnProperty('ctrl_cmd_gear')) {
        this.ctrl_cmd_gear = initObj.ctrl_cmd_gear
      }
      else {
        this.ctrl_cmd_gear = 0;
      }
      if (initObj.hasOwnProperty('steering_ctrl_cmd_velocity')) {
        this.steering_ctrl_cmd_velocity = initObj.steering_ctrl_cmd_velocity
      }
      else {
        this.steering_ctrl_cmd_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('steering_ctrl_cmd_steering')) {
        this.steering_ctrl_cmd_steering = initObj.steering_ctrl_cmd_steering
      }
      else {
        this.steering_ctrl_cmd_steering = 0.0;
      }
      if (initObj.hasOwnProperty('steering_ctrl_cmd_slipangle')) {
        this.steering_ctrl_cmd_slipangle = initObj.steering_ctrl_cmd_slipangle
      }
      else {
        this.steering_ctrl_cmd_slipangle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type steering_ctrl_cmd
    // Serialize message field [ctrl_cmd_gear]
    bufferOffset = _serializer.uint8(obj.ctrl_cmd_gear, buffer, bufferOffset);
    // Serialize message field [steering_ctrl_cmd_velocity]
    bufferOffset = _serializer.float32(obj.steering_ctrl_cmd_velocity, buffer, bufferOffset);
    // Serialize message field [steering_ctrl_cmd_steering]
    bufferOffset = _serializer.float32(obj.steering_ctrl_cmd_steering, buffer, bufferOffset);
    // Serialize message field [steering_ctrl_cmd_slipangle]
    bufferOffset = _serializer.float32(obj.steering_ctrl_cmd_slipangle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type steering_ctrl_cmd
    let len;
    let data = new steering_ctrl_cmd(null);
    // Deserialize message field [ctrl_cmd_gear]
    data.ctrl_cmd_gear = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [steering_ctrl_cmd_velocity]
    data.steering_ctrl_cmd_velocity = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [steering_ctrl_cmd_steering]
    data.steering_ctrl_cmd_steering = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [steering_ctrl_cmd_slipangle]
    data.steering_ctrl_cmd_slipangle = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'yhs_can_msgs/steering_ctrl_cmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3a30854c013cd420df8ee96e5e086d81';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8    ctrl_cmd_gear
    float32  steering_ctrl_cmd_velocity
    float32  steering_ctrl_cmd_steering
    float32  steering_ctrl_cmd_slipangle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new steering_ctrl_cmd(null);
    if (msg.ctrl_cmd_gear !== undefined) {
      resolved.ctrl_cmd_gear = msg.ctrl_cmd_gear;
    }
    else {
      resolved.ctrl_cmd_gear = 0
    }

    if (msg.steering_ctrl_cmd_velocity !== undefined) {
      resolved.steering_ctrl_cmd_velocity = msg.steering_ctrl_cmd_velocity;
    }
    else {
      resolved.steering_ctrl_cmd_velocity = 0.0
    }

    if (msg.steering_ctrl_cmd_steering !== undefined) {
      resolved.steering_ctrl_cmd_steering = msg.steering_ctrl_cmd_steering;
    }
    else {
      resolved.steering_ctrl_cmd_steering = 0.0
    }

    if (msg.steering_ctrl_cmd_slipangle !== undefined) {
      resolved.steering_ctrl_cmd_slipangle = msg.steering_ctrl_cmd_slipangle;
    }
    else {
      resolved.steering_ctrl_cmd_slipangle = 0.0
    }

    return resolved;
    }
};

module.exports = steering_ctrl_cmd;
