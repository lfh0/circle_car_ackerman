;; Auto-generated. Do not edit!


(when (boundp 'yhs_can_msgs::rear_angle_free_ctrl_cmd)
  (if (not (find-package "YHS_CAN_MSGS"))
    (make-package "YHS_CAN_MSGS"))
  (shadow 'rear_angle_free_ctrl_cmd (find-package "YHS_CAN_MSGS")))
(unless (find-package "YHS_CAN_MSGS::REAR_ANGLE_FREE_CTRL_CMD")
  (make-package "YHS_CAN_MSGS::REAR_ANGLE_FREE_CTRL_CMD"))

(in-package "ROS")
;;//! \htmlinclude rear_angle_free_ctrl_cmd.msg.html


(defclass yhs_can_msgs::rear_angle_free_ctrl_cmd
  :super ros::object
  :slots (_ctrl_cmd_gear _free_ctrl_cmd_angle_lr _free_ctrl_cmd_angle_rr ))

(defmethod yhs_can_msgs::rear_angle_free_ctrl_cmd
  (:init
   (&key
    ((:ctrl_cmd_gear __ctrl_cmd_gear) 0)
    ((:free_ctrl_cmd_angle_lr __free_ctrl_cmd_angle_lr) 0.0)
    ((:free_ctrl_cmd_angle_rr __free_ctrl_cmd_angle_rr) 0.0)
    )
   (send-super :init)
   (setq _ctrl_cmd_gear (round __ctrl_cmd_gear))
   (setq _free_ctrl_cmd_angle_lr (float __free_ctrl_cmd_angle_lr))
   (setq _free_ctrl_cmd_angle_rr (float __free_ctrl_cmd_angle_rr))
   self)
  (:ctrl_cmd_gear
   (&optional __ctrl_cmd_gear)
   (if __ctrl_cmd_gear (setq _ctrl_cmd_gear __ctrl_cmd_gear)) _ctrl_cmd_gear)
  (:free_ctrl_cmd_angle_lr
   (&optional __free_ctrl_cmd_angle_lr)
   (if __free_ctrl_cmd_angle_lr (setq _free_ctrl_cmd_angle_lr __free_ctrl_cmd_angle_lr)) _free_ctrl_cmd_angle_lr)
  (:free_ctrl_cmd_angle_rr
   (&optional __free_ctrl_cmd_angle_rr)
   (if __free_ctrl_cmd_angle_rr (setq _free_ctrl_cmd_angle_rr __free_ctrl_cmd_angle_rr)) _free_ctrl_cmd_angle_rr)
  (:serialization-length
   ()
   (+
    ;; uint8 _ctrl_cmd_gear
    1
    ;; float32 _free_ctrl_cmd_angle_lr
    4
    ;; float32 _free_ctrl_cmd_angle_rr
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ctrl_cmd_gear
       (write-byte _ctrl_cmd_gear s)
     ;; float32 _free_ctrl_cmd_angle_lr
       (sys::poke _free_ctrl_cmd_angle_lr (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _free_ctrl_cmd_angle_rr
       (sys::poke _free_ctrl_cmd_angle_rr (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ctrl_cmd_gear
     (setq _ctrl_cmd_gear (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _free_ctrl_cmd_angle_lr
     (setq _free_ctrl_cmd_angle_lr (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _free_ctrl_cmd_angle_rr
     (setq _free_ctrl_cmd_angle_rr (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get yhs_can_msgs::rear_angle_free_ctrl_cmd :md5sum-) "94285ea3dc345ecdd9025bc4c5de4488")
(setf (get yhs_can_msgs::rear_angle_free_ctrl_cmd :datatype-) "yhs_can_msgs/rear_angle_free_ctrl_cmd")
(setf (get yhs_can_msgs::rear_angle_free_ctrl_cmd :definition-)
      "uint8    ctrl_cmd_gear
float32  free_ctrl_cmd_angle_lr
float32  free_ctrl_cmd_angle_rr

")



(provide :yhs_can_msgs/rear_angle_free_ctrl_cmd "94285ea3dc345ecdd9025bc4c5de4488")


