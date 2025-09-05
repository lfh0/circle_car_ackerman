; Auto-generated. Do not edit!


(cl:in-package yhs_can_msgs-msg)


;//! \htmlinclude rear_velocity_free_ctrl_cmd.msg.html

(cl:defclass <rear_velocity_free_ctrl_cmd> (roslisp-msg-protocol:ros-message)
  ((ctrl_cmd_gear
    :reader ctrl_cmd_gear
    :initarg :ctrl_cmd_gear
    :type cl:fixnum
    :initform 0)
   (free_ctrl_cmd_velocity_lr
    :reader free_ctrl_cmd_velocity_lr
    :initarg :free_ctrl_cmd_velocity_lr
    :type cl:float
    :initform 0.0)
   (free_ctrl_cmd_velocity_rr
    :reader free_ctrl_cmd_velocity_rr
    :initarg :free_ctrl_cmd_velocity_rr
    :type cl:float
    :initform 0.0))
)

(cl:defclass rear_velocity_free_ctrl_cmd (<rear_velocity_free_ctrl_cmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rear_velocity_free_ctrl_cmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rear_velocity_free_ctrl_cmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yhs_can_msgs-msg:<rear_velocity_free_ctrl_cmd> is deprecated: use yhs_can_msgs-msg:rear_velocity_free_ctrl_cmd instead.")))

(cl:ensure-generic-function 'ctrl_cmd_gear-val :lambda-list '(m))
(cl:defmethod ctrl_cmd_gear-val ((m <rear_velocity_free_ctrl_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yhs_can_msgs-msg:ctrl_cmd_gear-val is deprecated.  Use yhs_can_msgs-msg:ctrl_cmd_gear instead.")
  (ctrl_cmd_gear m))

(cl:ensure-generic-function 'free_ctrl_cmd_velocity_lr-val :lambda-list '(m))
(cl:defmethod free_ctrl_cmd_velocity_lr-val ((m <rear_velocity_free_ctrl_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yhs_can_msgs-msg:free_ctrl_cmd_velocity_lr-val is deprecated.  Use yhs_can_msgs-msg:free_ctrl_cmd_velocity_lr instead.")
  (free_ctrl_cmd_velocity_lr m))

(cl:ensure-generic-function 'free_ctrl_cmd_velocity_rr-val :lambda-list '(m))
(cl:defmethod free_ctrl_cmd_velocity_rr-val ((m <rear_velocity_free_ctrl_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yhs_can_msgs-msg:free_ctrl_cmd_velocity_rr-val is deprecated.  Use yhs_can_msgs-msg:free_ctrl_cmd_velocity_rr instead.")
  (free_ctrl_cmd_velocity_rr m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rear_velocity_free_ctrl_cmd>) ostream)
  "Serializes a message object of type '<rear_velocity_free_ctrl_cmd>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ctrl_cmd_gear)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'free_ctrl_cmd_velocity_lr))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'free_ctrl_cmd_velocity_rr))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rear_velocity_free_ctrl_cmd>) istream)
  "Deserializes a message object of type '<rear_velocity_free_ctrl_cmd>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ctrl_cmd_gear)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'free_ctrl_cmd_velocity_lr) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'free_ctrl_cmd_velocity_rr) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rear_velocity_free_ctrl_cmd>)))
  "Returns string type for a message object of type '<rear_velocity_free_ctrl_cmd>"
  "yhs_can_msgs/rear_velocity_free_ctrl_cmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rear_velocity_free_ctrl_cmd)))
  "Returns string type for a message object of type 'rear_velocity_free_ctrl_cmd"
  "yhs_can_msgs/rear_velocity_free_ctrl_cmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rear_velocity_free_ctrl_cmd>)))
  "Returns md5sum for a message object of type '<rear_velocity_free_ctrl_cmd>"
  "8a09af7b0d1e28fe6145a435936a53e7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rear_velocity_free_ctrl_cmd)))
  "Returns md5sum for a message object of type 'rear_velocity_free_ctrl_cmd"
  "8a09af7b0d1e28fe6145a435936a53e7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rear_velocity_free_ctrl_cmd>)))
  "Returns full string definition for message of type '<rear_velocity_free_ctrl_cmd>"
  (cl:format cl:nil "uint8    ctrl_cmd_gear~%float32  free_ctrl_cmd_velocity_lr~%float32  free_ctrl_cmd_velocity_rr~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rear_velocity_free_ctrl_cmd)))
  "Returns full string definition for message of type 'rear_velocity_free_ctrl_cmd"
  (cl:format cl:nil "uint8    ctrl_cmd_gear~%float32  free_ctrl_cmd_velocity_lr~%float32  free_ctrl_cmd_velocity_rr~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rear_velocity_free_ctrl_cmd>))
  (cl:+ 0
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rear_velocity_free_ctrl_cmd>))
  "Converts a ROS message object to a list"
  (cl:list 'rear_velocity_free_ctrl_cmd
    (cl:cons ':ctrl_cmd_gear (ctrl_cmd_gear msg))
    (cl:cons ':free_ctrl_cmd_velocity_lr (free_ctrl_cmd_velocity_lr msg))
    (cl:cons ':free_ctrl_cmd_velocity_rr (free_ctrl_cmd_velocity_rr msg))
))
