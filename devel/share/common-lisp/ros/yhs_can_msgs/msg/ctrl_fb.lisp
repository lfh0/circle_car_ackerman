; Auto-generated. Do not edit!


(cl:in-package yhs_can_msgs-msg)


;//! \htmlinclude ctrl_fb.msg.html

(cl:defclass <ctrl_fb> (roslisp-msg-protocol:ros-message)
  ((ctrl_fb_gear
    :reader ctrl_fb_gear
    :initarg :ctrl_fb_gear
    :type cl:fixnum
    :initform 0)
   (ctrl_fb_linear
    :reader ctrl_fb_linear
    :initarg :ctrl_fb_linear
    :type cl:float
    :initform 0.0)
   (ctrl_fb_angular
    :reader ctrl_fb_angular
    :initarg :ctrl_fb_angular
    :type cl:float
    :initform 0.0)
   (ctrl_fb_slipangle
    :reader ctrl_fb_slipangle
    :initarg :ctrl_fb_slipangle
    :type cl:float
    :initform 0.0))
)

(cl:defclass ctrl_fb (<ctrl_fb>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ctrl_fb>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ctrl_fb)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yhs_can_msgs-msg:<ctrl_fb> is deprecated: use yhs_can_msgs-msg:ctrl_fb instead.")))

(cl:ensure-generic-function 'ctrl_fb_gear-val :lambda-list '(m))
(cl:defmethod ctrl_fb_gear-val ((m <ctrl_fb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yhs_can_msgs-msg:ctrl_fb_gear-val is deprecated.  Use yhs_can_msgs-msg:ctrl_fb_gear instead.")
  (ctrl_fb_gear m))

(cl:ensure-generic-function 'ctrl_fb_linear-val :lambda-list '(m))
(cl:defmethod ctrl_fb_linear-val ((m <ctrl_fb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yhs_can_msgs-msg:ctrl_fb_linear-val is deprecated.  Use yhs_can_msgs-msg:ctrl_fb_linear instead.")
  (ctrl_fb_linear m))

(cl:ensure-generic-function 'ctrl_fb_angular-val :lambda-list '(m))
(cl:defmethod ctrl_fb_angular-val ((m <ctrl_fb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yhs_can_msgs-msg:ctrl_fb_angular-val is deprecated.  Use yhs_can_msgs-msg:ctrl_fb_angular instead.")
  (ctrl_fb_angular m))

(cl:ensure-generic-function 'ctrl_fb_slipangle-val :lambda-list '(m))
(cl:defmethod ctrl_fb_slipangle-val ((m <ctrl_fb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yhs_can_msgs-msg:ctrl_fb_slipangle-val is deprecated.  Use yhs_can_msgs-msg:ctrl_fb_slipangle instead.")
  (ctrl_fb_slipangle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ctrl_fb>) ostream)
  "Serializes a message object of type '<ctrl_fb>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ctrl_fb_gear)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ctrl_fb_linear))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ctrl_fb_angular))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ctrl_fb_slipangle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ctrl_fb>) istream)
  "Deserializes a message object of type '<ctrl_fb>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ctrl_fb_gear)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ctrl_fb_linear) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ctrl_fb_angular) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ctrl_fb_slipangle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ctrl_fb>)))
  "Returns string type for a message object of type '<ctrl_fb>"
  "yhs_can_msgs/ctrl_fb")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ctrl_fb)))
  "Returns string type for a message object of type 'ctrl_fb"
  "yhs_can_msgs/ctrl_fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ctrl_fb>)))
  "Returns md5sum for a message object of type '<ctrl_fb>"
  "71d69c3b3059c584ab39c7c5410b944f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ctrl_fb)))
  "Returns md5sum for a message object of type 'ctrl_fb"
  "71d69c3b3059c584ab39c7c5410b944f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ctrl_fb>)))
  "Returns full string definition for message of type '<ctrl_fb>"
  (cl:format cl:nil "uint8    ctrl_fb_gear~%float32  ctrl_fb_linear~%float32  ctrl_fb_angular~%float32  ctrl_fb_slipangle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ctrl_fb)))
  "Returns full string definition for message of type 'ctrl_fb"
  (cl:format cl:nil "uint8    ctrl_fb_gear~%float32  ctrl_fb_linear~%float32  ctrl_fb_angular~%float32  ctrl_fb_slipangle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ctrl_fb>))
  (cl:+ 0
     1
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ctrl_fb>))
  "Converts a ROS message object to a list"
  (cl:list 'ctrl_fb
    (cl:cons ':ctrl_fb_gear (ctrl_fb_gear msg))
    (cl:cons ':ctrl_fb_linear (ctrl_fb_linear msg))
    (cl:cons ':ctrl_fb_angular (ctrl_fb_angular msg))
    (cl:cons ':ctrl_fb_slipangle (ctrl_fb_slipangle msg))
))
