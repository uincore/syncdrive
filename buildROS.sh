#Project: SyncDrive
#author: dinglx@uincore.net
#Create Date: Mar 12 2018

#Ubuntu 16.04 LTS (64bit) xenial
#http://wiki.ros.org/kinetic/Installation/Ubuntu

#http://wiki.ros.org/catkin/Tutorials/create_a_workspace

source /opt/ros/kinetic/setup.bash

#make a empty project to create develop enviromnet
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make

#http://wiki.ros.org/joy
#Logitech G29 Wheel
source  devel/setup.bash
sudo apt install libusb-dev
sudo apt-get install libspnav-dev
sudo apt-get install libbluetooth-dev
cd ~/catkin_ws/src
git clone https://github.com/ros-drivers/joystick_drivers.git
git clone https://github.com/ros/roslint.git
git clone https://github.com/ros/diagnostics.git

cd ~
git clone https://github.com/uincore/cwiid.git
cd ~/cwiid
aclocal
autoconf
./configure
make
sudo make install

cd ~/catkin_ws
catkin_make

#roslaunch ps3joy ps3.launch

#http://wiki.ros.org/usb_cam
#USB Camery (Logitech C922 Pro Stream Webcam)
cd ~/catkin_ws/src
git clone https://github.com/ros-drivers/usb_cam.git
git clone https://github.com/ros-perception/image_common.git
git clone https://github.com/ros-perception/image_pipeline.git
git clone https://github.com/ros-perception/vision_opencv.git
git clone https://github.com/ros/geometry.git
git clone https://github.com/ros/geometry2.git
git clone https://github.com/ros-perception/image_transport_plugins.git
cd ~/catkin_ws
catkin_make
#vim src/usb_cam/launch/usb_cam-test.launch #Cameray resolution ratio:1280x720
#roslaunch usb_cam usb_cam-test.launch
#rosrun camera_calibration cameracalibrator.py --size 8x6 --square 0.108 image:=/usb_cam/image_raw camera:=/usb_cam

#VESC(Vehicle Electric Speed Control)
#https://github.com/vedderb/bldc
cd ~/catkin_ws/src
git clone https://github.com/wjwwood/serial.git
git clone https://github.com/ros-drivers/ackermann_msgs.git
git clone https://github.com/uincore/vesc.git
cd ~/catkin_ws
catkin_make
#Serial Device: /dev/ttUSBx or /dev/ttyACMx
#roslaunch vesc_driver vesc_driver_node.launch



