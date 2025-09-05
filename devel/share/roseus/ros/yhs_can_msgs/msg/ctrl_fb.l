;; Auto-generated. Do not edit!


(when (boundp 'yhs_can_msgs::ctrl_fb)
  (if (not (find-package "YHS_CAN_MSGS"))
    (make-package "YHS_CAN_MSGS"))
  (shadow 'ctrl_fb (find-package "YHS_CAN_MSGS")))
(unless (find-package "YHS_CAN_MSGS::CTRL_FB")
  (make-package "YHS_CAN_MSGS::CTRL_FB"))

(in-package "ROS")
;;//! \htmlinclude ctrl_fb.msg.html


(defclass yhs_can_msgs::ctrl_fb
  :super ros::object
  :slots (_ctrl_fb_gear _ctrl_fb_linear _ctrl_fb_angular _ctrl_fb_slipangle ))

(defmethod yhs_can_msgs::ctrl_fb
  (:init
   (&key
    ((:ctrl_fb_gear __ctrl_fb_gear) 0)
    ((:ctrl_fb_linear __ctrl_fb_linear) 0.0)
    ((:ctrl_fb_angular __ctrl_fb_angular) 0.0)
    ((:ctrl_fb_slipangle __ctrl_fb_slipangle) 0.0)
    )
   (send-super :init)
   (setq _ctrl_fb_gear (round __ctrl_fb_gear))
   (setq _ctrl_fb_linear (float __ctrl_fb_linear))
   (setq _ctrl_fb_angular (float __ctrl_fb_angular))
   (setq _ctrl_fb_slipangle (float __ctrl_fb_slipangle))
   self)
  (:ctrl_fb_gear
   (&optional __ctrl_fb_gear)
   (if __ctrl_fb_gear (setq _ctrl_fb_gear __ctrl_fb_gear)) _ctrl_fb_gear)
  (:ctrl_fb_linear
   (&optional __ctrl_fb_linear)
   (if __ctrl_fb_linear (setq _ctrl_fb_linear __ctrl_fb_linear)) _ctrl_fb_linear)
  (:ctrl_fb_angular
   (&optional __ctrl_fb_angular)
   (if __ctrl_fb_angular (setq _ctrl_fb_angular __ctrl_fb_angular)) _ctrl_fb_angular)
  (:ctrl_fb_slipangle
   (&optional __ctrl_fb_slipangle)
   (if __ctrl_fb_slipangle (setq _ctrl_fb_slipangle __ctrl_fb_slipangle)) _ctrl_fb_slipangle)
  (:serialization-length
   ()
   (+
    ;; uint8 _ctrl_fb_gear
    1
    ;; float32 _ctrl_fb_linear
    4
    ;; float32 _ctrl_fb_angular
    4
    ;; float32 _ctrl_fb_slipangle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ctrl_fb_gear
       (write-byte _ctrl_fb_gear s)
     ;; float32 _ctrl_fb_linear
       (sys::poke _ctrl_fb_linear (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ctrl_fb_angular
       (sys::poke _ctrl_fb_angular (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ctrl_fb_slipangle
       (sys::poke _ctrl_fb_slipangle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ctrl_fb_gear
     (setq _ctrl_fb_gear (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _ctrl_fb_linear
     (setq _ctrl_fb_linear (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ctrl_fb_angular
     (setq _ctrl_fb_angular (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ctrl_fb_slipangle
     (setq _ctrl_fb_slipangle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get yhs_can_msgs::ctrl_fb :md5sum-) "71d69c3b3059c584ab39c7c5410b944f")
(setf (get yhs_can_msgs::ctrl_fb :datatype-) "yhs_can_msgs/ctrl_fb")
(setf (get yhs_can_msgs::ctrl_fb :definition-)
      "uint8    ctrl_fb_gear
float32  ctrl_fb_linear
float32  ctrl_fb_angular
float32  ctrl_fb_slipangle

")



(provide :yhs_can_msgs/ctrl_fb "71d69c3b3059c584ab39c7c5410b944f")


