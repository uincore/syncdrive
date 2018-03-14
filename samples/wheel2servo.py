#!/usr/bin/env python

#export |grep ROS
#ROSLISP_PACKAGE_DIRECTORIES="/home/ding/catkin_ws/devel/share/common-lisp"
#ROS_DISTRO="kinetic"
#ROS_ETC_DIR="/opt/ros/kinetic/etc/ros"
#ROS_IP="192.168.1.229"			!!!IMPORTANT!!!
#ROS_MASTER_URI="http://192.168.1.213:11311" !!!MASTER ROSCORE!!!
#ROS_PACKAGE_PATH="/home/ding/catkin_ws/src:/opt/ros/kinetic/share"
#ROS_ROOT="/opt/ros/kinetic/share/ros"

 
import rospy
from std_msgs.msg import String
from std_msgs.msg import Float64
from sensor_msgs.msg import Joy
 
 
def callback(data):
        #display = str(data.header)
        pub_servo = rospy.Publisher('/commands/servo/position', Float64, queue_size=10)        
        pub_duty  = rospy.Publisher('/commands/motor/duty_cycle', Float64, queue_size=10)        
#        rospy.loginfo("axes %s", data.axes)
#        rospy.loginfo("buttons %s", data.buttons)

        wheel = data.axes[0]*-0.5+0.5         #1,-1 --> 0, 1
	throttle = data.axes[2]*0.5+0.5       #-1,1 --> 0.0 - 1
        if(wheel <= 0.02 ):
            wheel = 0.02
        if(wheel >= 0.98):
            wheel = 0.98

	throttle = throttle * 0.3
        if(throttle<= 0 ):
            throttle= 0
        if(throttle>= 0.3):
            throttle = 0.3

        pub_servo.publish(wheel)
	pub_duty.publish(throttle)
        rospy.loginfo("wheel %s, throttle %s", wheel,throttle)
         
def listener():
 
    # In ROS, nodes are uniquely named. If two nodes with the same
    # node are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'talker' node so that multiple talkers can
    # run simultaneously.
    #rospy.init_node('control', anonymous=True)
    rospy.init_node('control', log_level=rospy.ERROR)
 
    rospy.Subscriber("joy",Joy, callback)


 
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()
 
if __name__ == '__main__':
    print "Start....."
    listener()


