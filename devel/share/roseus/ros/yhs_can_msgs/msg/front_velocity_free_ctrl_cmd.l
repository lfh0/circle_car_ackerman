;; Auto-generated. Do not edit!


(when (boundp 'yhs_can_msgs::front_velocity_free_ctrl_cmd)
  (if (not (find-package "YHS_CAN_MSGS"))
    (make-package "YHS_CAN_MSGS"))
  (shadow 'front_velocity_free_ctrl_cmd (find-package "YHS_CAN_MSGS")))
(unless (find-package "YHS_CAN_MSGS::FRONT_VELOCITY_FREE_CTRL_CMD")
  (make-package "YHS_CAN_MSGS::FRONT_VELOCITY_FREE_CTRL_CMD"))

(in-package "ROS")
;;//! \htmlinclude front_velocity_free_ctrl_cmd.msg.html


(defclass yhs_can_msgs::front_velocity_free_ctrl_cmd
  :super ros::object
  :slots (_ctrl_cmd_gear _free_ctrl_cmd_velocity_lf _free_ctrl_cmd_velocity_rf ))

(defmethod yhs_can_msgs::front_velocity_free_ctrl_cmd
  (:init
   (&key
    ((:ctrl_cmd_gear __ctrl_cmd_gear) 0)
    ((:free_ctrl_cmd_velocity_lf __free_ctrl_cmd_velocity_lf) 0.0)
    ((:free_ctrl_cmd_velocity_rf __free_ctrl_cmd_velocity_rf) 0.0)
    )
   (send-super :init)
   (setq _ctrl_cmd_gear (round __ctrl_cmd_gear))
   (setq _free_ctrl_cmd_velocity_lf (float __free_ctrl_cmd_velocity_lf))
   (setq _free_ctrl_cmd_velocity_rf (float __free_ctrl_cmd_velocity_rf))
   self)
  (:ctrl_cmd_gear
   (&optional __ctrl_cmd_gear)
   (if __ctrl_cmd_gear (setq _ctrl_cmd_gear __ctrl_cmd_gear)) _ctrl_cmd_gear)
  (:free_ctrl_cmd_velocity_lf
   (&optional __free_ctrl_cmd_velocity_lf)
   (if __free_ctrl_cmd_velocity_lf (setq _free_ctrl_cmd_velocity_lf __free_ctrl_cmd_velocity_lf)) _free_ctrl_cmd_velocity_lf)
  (:free_ctrl_cmd_velocity_rf
   (&optional __free_ctrl_cmd_velocity_rf)
   (if __free_ctrl_cmd_velocity_rf (setq _free_ctrl_cmd_velocity_rf __free_ctrl_cmd_velocity_rf)) _free_ctrl_cmd_velocity_rf)
  (:serialization-length
   ()
   (+
    ;; uint8 _ctrl_cmd_gear
    1
    ;; float32 _free_ctrl_cmd_velocity_lf
    4
    ;; float32 _free_ctrl_cmd_velocity_rf
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ctrl_cmd_gear
       (write-byte _ctrl_cmd_gear s)
     ;; float32 _free_ctrl_cmd_velocity_lf
       (sys::poke _free_ctrl_cmd_velocity_lf (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _free_ctrl_cmd_velocity_rf
       (sys::poke _free_ctrl_cmd_velocity_rf (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ctrl_cmd_gear
     (setq _ctrl_cmd_gear (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _free_ctrl_cmd_velocity_lf
     (setq _free_ctrl_cmd_velocity_lf (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _free_ctrl_cmd_velocity_rf
     (setq _free_ctrl_cmd_velocity_rf (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get yhs_can_msgs::front_velocity_free_ctrl_cmd :md5sum-) "6ccb4ea5d60635b5d1a6ac7be60374c9")
(setf (get yhs_can_msgs::front_velocity_free_ctrl_cmd :datatype-) "yhs_can_msgs/front_velocity_free_ctrl_cmd")
(setf (get yhs_can_msgs::front_velocity_free_ctrl_cmd :definition-)
      "uint8    ctrl_cmd_gear
float32  free_ctrl_cmd_velocity_lf
float32  free_ctrl_cmd_velocity_rf

")



(provide :yhs_can_msgs/front_velocity_free_ctrl_cmd "6ccb4ea5d60635b5d1a6ac7be60374c9")


