;; Auto-generated. Do not edit!


(when (boundp 'yhs_can_msgs::front_angle_free_ctrl_cmd)
  (if (not (find-package "YHS_CAN_MSGS"))
    (make-package "YHS_CAN_MSGS"))
  (shadow 'front_angle_free_ctrl_cmd (find-package "YHS_CAN_MSGS")))
(unless (find-package "YHS_CAN_MSGS::FRONT_ANGLE_FREE_CTRL_CMD")
  (make-package "YHS_CAN_MSGS::FRONT_ANGLE_FREE_CTRL_CMD"))

(in-package "ROS")
;;//! \htmlinclude front_angle_free_ctrl_cmd.msg.html


(defclass yhs_can_msgs::front_angle_free_ctrl_cmd
  :super ros::object
  :slots (_ctrl_cmd_gear _free_ctrl_cmd_angle_lf _free_ctrl_cmd_angle_rf ))

(defmethod yhs_can_msgs::front_angle_free_ctrl_cmd
  (:init
   (&key
    ((:ctrl_cmd_gear __ctrl_cmd_gear) 0)
    ((:free_ctrl_cmd_angle_lf __free_ctrl_cmd_angle_lf) 0.0)
    ((:free_ctrl_cmd_angle_rf __free_ctrl_cmd_angle_rf) 0.0)
    )
   (send-super :init)
   (setq _ctrl_cmd_gear (round __ctrl_cmd_gear))
   (setq _free_ctrl_cmd_angle_lf (float __free_ctrl_cmd_angle_lf))
   (setq _free_ctrl_cmd_angle_rf (float __free_ctrl_cmd_angle_rf))
   self)
  (:ctrl_cmd_gear
   (&optional __ctrl_cmd_gear)
   (if __ctrl_cmd_gear (setq _ctrl_cmd_gear __ctrl_cmd_gear)) _ctrl_cmd_gear)
  (:free_ctrl_cmd_angle_lf
   (&optional __free_ctrl_cmd_angle_lf)
   (if __free_ctrl_cmd_angle_lf (setq _free_ctrl_cmd_angle_lf __free_ctrl_cmd_angle_lf)) _free_ctrl_cmd_angle_lf)
  (:free_ctrl_cmd_angle_rf
   (&optional __free_ctrl_cmd_angle_rf)
   (if __free_ctrl_cmd_angle_rf (setq _free_ctrl_cmd_angle_rf __free_ctrl_cmd_angle_rf)) _free_ctrl_cmd_angle_rf)
  (:serialization-length
   ()
   (+
    ;; uint8 _ctrl_cmd_gear
    1
    ;; float32 _free_ctrl_cmd_angle_lf
    4
    ;; float32 _free_ctrl_cmd_angle_rf
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ctrl_cmd_gear
       (write-byte _ctrl_cmd_gear s)
     ;; float32 _free_ctrl_cmd_angle_lf
       (sys::poke _free_ctrl_cmd_angle_lf (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _free_ctrl_cmd_angle_rf
       (sys::poke _free_ctrl_cmd_angle_rf (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ctrl_cmd_gear
     (setq _ctrl_cmd_gear (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _free_ctrl_cmd_angle_lf
     (setq _free_ctrl_cmd_angle_lf (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _free_ctrl_cmd_angle_rf
     (setq _free_ctrl_cmd_angle_rf (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get yhs_can_msgs::front_angle_free_ctrl_cmd :md5sum-) "cd2756d856d6872454c479420fbd2adf")
(setf (get yhs_can_msgs::front_angle_free_ctrl_cmd :datatype-) "yhs_can_msgs/front_angle_free_ctrl_cmd")
(setf (get yhs_can_msgs::front_angle_free_ctrl_cmd :definition-)
      "uint8    ctrl_cmd_gear
float32  free_ctrl_cmd_angle_lf
float32  free_ctrl_cmd_angle_rf

")



(provide :yhs_can_msgs/front_angle_free_ctrl_cmd "cd2756d856d6872454c479420fbd2adf")


