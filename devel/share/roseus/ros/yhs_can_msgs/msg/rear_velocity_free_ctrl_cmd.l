;; Auto-generated. Do not edit!


(when (boundp 'yhs_can_msgs::rear_velocity_free_ctrl_cmd)
  (if (not (find-package "YHS_CAN_MSGS"))
    (make-package "YHS_CAN_MSGS"))
  (shadow 'rear_velocity_free_ctrl_cmd (find-package "YHS_CAN_MSGS")))
(unless (find-package "YHS_CAN_MSGS::REAR_VELOCITY_FREE_CTRL_CMD")
  (make-package "YHS_CAN_MSGS::REAR_VELOCITY_FREE_CTRL_CMD"))

(in-package "ROS")
;;//! \htmlinclude rear_velocity_free_ctrl_cmd.msg.html


(defclass yhs_can_msgs::rear_velocity_free_ctrl_cmd
  :super ros::object
  :slots (_ctrl_cmd_gear _free_ctrl_cmd_velocity_lr _free_ctrl_cmd_velocity_rr ))

(defmethod yhs_can_msgs::rear_velocity_free_ctrl_cmd
  (:init
   (&key
    ((:ctrl_cmd_gear __ctrl_cmd_gear) 0)
    ((:free_ctrl_cmd_velocity_lr __free_ctrl_cmd_velocity_lr) 0.0)
    ((:free_ctrl_cmd_velocity_rr __free_ctrl_cmd_velocity_rr) 0.0)
    )
   (send-super :init)
   (setq _ctrl_cmd_gear (round __ctrl_cmd_gear))
   (setq _free_ctrl_cmd_velocity_lr (float __free_ctrl_cmd_velocity_lr))
   (setq _free_ctrl_cmd_velocity_rr (float __free_ctrl_cmd_velocity_rr))
   self)
  (:ctrl_cmd_gear
   (&optional __ctrl_cmd_gear)
   (if __ctrl_cmd_gear (setq _ctrl_cmd_gear __ctrl_cmd_gear)) _ctrl_cmd_gear)
  (:free_ctrl_cmd_velocity_lr
   (&optional __free_ctrl_cmd_velocity_lr)
   (if __free_ctrl_cmd_velocity_lr (setq _free_ctrl_cmd_velocity_lr __free_ctrl_cmd_velocity_lr)) _free_ctrl_cmd_velocity_lr)
  (:free_ctrl_cmd_velocity_rr
   (&optional __free_ctrl_cmd_velocity_rr)
   (if __free_ctrl_cmd_velocity_rr (setq _free_ctrl_cmd_velocity_rr __free_ctrl_cmd_velocity_rr)) _free_ctrl_cmd_velocity_rr)
  (:serialization-length
   ()
   (+
    ;; uint8 _ctrl_cmd_gear
    1
    ;; float32 _free_ctrl_cmd_velocity_lr
    4
    ;; float32 _free_ctrl_cmd_velocity_rr
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ctrl_cmd_gear
       (write-byte _ctrl_cmd_gear s)
     ;; float32 _free_ctrl_cmd_velocity_lr
       (sys::poke _free_ctrl_cmd_velocity_lr (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _free_ctrl_cmd_velocity_rr
       (sys::poke _free_ctrl_cmd_velocity_rr (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ctrl_cmd_gear
     (setq _ctrl_cmd_gear (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _free_ctrl_cmd_velocity_lr
     (setq _free_ctrl_cmd_velocity_lr (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _free_ctrl_cmd_velocity_rr
     (setq _free_ctrl_cmd_velocity_rr (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get yhs_can_msgs::rear_velocity_free_ctrl_cmd :md5sum-) "8a09af7b0d1e28fe6145a435936a53e7")
(setf (get yhs_can_msgs::rear_velocity_free_ctrl_cmd :datatype-) "yhs_can_msgs/rear_velocity_free_ctrl_cmd")
(setf (get yhs_can_msgs::rear_velocity_free_ctrl_cmd :definition-)
      "uint8    ctrl_cmd_gear
float32  free_ctrl_cmd_velocity_lr
float32  free_ctrl_cmd_velocity_rr

")



(provide :yhs_can_msgs/rear_velocity_free_ctrl_cmd "8a09af7b0d1e28fe6145a435936a53e7")


