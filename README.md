# syncdrive
Remote control a vehicle base on ROS Framework!

1. Develop enviromnet:

Ubuntu 16.04 LTS(64bit) xenial
ROS: kinetic and catkin

2. Build All 
git clone https://github.com/uincore/syncdrive.git
cd syncdrive
./buildROS.sh

3. Usage sample

ROS MASTER IP(SERVICE): 192.168.1.215

	Hardware: VESC + IMU + USB_CAMERA

	source ~/syncdrive/script/rosenv.sh 192.168.1.215 192.168.1.215
      	@Terminal1  roscore
      	@Terminal2  roslaunch vesc_driver vesc_driver_node.launch
      	@Terminal3  roslaunch usb_cam usb_cam_node.launch

ROS IP(CLIENT): 192.168.1.226

	Hardware: LOGIT G29(Wheel+Padal+Shift)
	source ~/syncdrive/script/rosenv.sh 192.168.1.215 192.168.1.226
	@Terminal1 roslaunch ps3joy ps3.launch
	@Terminal2 rqt_image_view
	@Terminal3 ~/syncdrive/samples/wheel2servo.py

