; Auto-generated. Do not edit!


(cl:in-package yhs_can_msgs-msg)


;//! \htmlinclude front_velocity_free_ctrl_cmd.msg.html

(cl:defclass <front_velocity_free_ctrl_cmd> (roslisp-msg-protocol:ros-message)
  ((ctrl_cmd_gear
    :reader ctrl_cmd_gear
    :initarg :ctrl_cmd_gear
    :type cl:fixnum
    :initform 0)
   (free_ctrl_cmd_velocity_lf
    :reader free_ctrl_cmd_velocity_lf
    :initarg :free_ctrl_cmd_velocity_lf
    :type cl:float
    :initform 0.0)
   (free_ctrl_cmd_velocity_rf
    :reader free_ctrl_cmd_velocity_rf
    :initarg :free_ctrl_cmd_velocity_rf
    :type cl:float
    :initform 0.0))
)

(cl:defclass front_velocity_free_ctrl_cmd (<front_velocity_free_ctrl_cmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <front_velocity_free_ctrl_cmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'front_velocity_free_ctrl_cmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yhs_can_msgs-msg:<front_velocity_free_ctrl_cmd> is deprecated: use yhs_can_msgs-msg:front_velocity_free_ctrl_cmd instead.")))

(cl:ensure-generic-function 'ctrl_cmd_gear-val :lambda-list '(m))
(cl:defmethod ctrl_cmd_gear-val ((m <front_velocity_free_ctrl_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yhs_can_msgs-msg:ctrl_cmd_gear-val is deprecated.  Use yhs_can_msgs-msg:ctrl_cmd_gear instead.")
  (ctrl_cmd_gear m))

(cl:ensure-generic-function 'free_ctrl_cmd_velocity_lf-val :lambda-list '(m))
(cl:defmethod free_ctrl_cmd_velocity_lf-val ((m <front_velocity_free_ctrl_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yhs_can_msgs-msg:free_ctrl_cmd_velocity_lf-val is deprecated.  Use yhs_can_msgs-msg:free_ctrl_cmd_velocity_lf instead.")
  (free_ctrl_cmd_velocity_lf m))

(cl:ensure-generic-function 'free_ctrl_cmd_velocity_rf-val :lambda-list '(m))
(cl:defmethod free_ctrl_cmd_velocity_rf-val ((m <front_velocity_free_ctrl_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yhs_can_msgs-msg:free_ctrl_cmd_velocity_rf-val is deprecated.  Use yhs_can_msgs-msg:free_ctrl_cmd_velocity_rf instead.")
  (free_ctrl_cmd_velocity_rf m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <front_velocity_free_ctrl_cmd>) ostream)
  "Serializes a message object of type '<front_velocity_free_ctrl_cmd>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ctrl_cmd_gear)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'free_ctrl_cmd_velocity_lf))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'free_ctrl_cmd_velocity_rf))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <front_velocity_free_ctrl_cmd>) istream)
  "Deserializes a message object of type '<front_velocity_free_ctrl_cmd>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ctrl_cmd_gear)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'free_ctrl_cmd_velocity_lf) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'free_ctrl_cmd_velocity_rf) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<front_velocity_free_ctrl_cmd>)))
  "Returns string type for a message object of type '<front_velocity_free_ctrl_cmd>"
  "yhs_can_msgs/front_velocity_free_ctrl_cmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'front_velocity_free_ctrl_cmd)))
  "Returns string type for a message object of type 'front_velocity_free_ctrl_cmd"
  "yhs_can_msgs/front_velocity_free_ctrl_cmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<front_velocity_free_ctrl_cmd>)))
  "Returns md5sum for a message object of type '<front_velocity_free_ctrl_cmd>"
  "6ccb4ea5d60635b5d1a6ac7be60374c9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'front_velocity_free_ctrl_cmd)))
  "Returns md5sum for a message object of type 'front_velocity_free_ctrl_cmd"
  "6ccb4ea5d60635b5d1a6ac7be60374c9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<front_velocity_free_ctrl_cmd>)))
  "Returns full string definition for message of type '<front_velocity_free_ctrl_cmd>"
  (cl:format cl:nil "uint8    ctrl_cmd_gear~%float32  free_ctrl_cmd_velocity_lf~%float32  free_ctrl_cmd_velocity_rf~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'front_velocity_free_ctrl_cmd)))
  "Returns full string definition for message of type 'front_velocity_free_ctrl_cmd"
  (cl:format cl:nil "uint8    ctrl_cmd_gear~%float32  free_ctrl_cmd_velocity_lf~%float32  free_ctrl_cmd_velocity_rf~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <front_velocity_free_ctrl_cmd>))
  (cl:+ 0
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <front_velocity_free_ctrl_cmd>))
  "Converts a ROS message object to a list"
  (cl:list 'front_velocity_free_ctrl_cmd
    (cl:cons ':ctrl_cmd_gear (ctrl_cmd_gear msg))
    (cl:cons ':free_ctrl_cmd_velocity_lf (free_ctrl_cmd_velocity_lf msg))
    (cl:cons ':free_ctrl_cmd_velocity_rf (free_ctrl_cmd_velocity_rf msg))
))
