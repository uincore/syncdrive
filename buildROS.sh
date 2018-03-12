#Project: SyncDrive
#author: dinglx@uincore.net
#Date: Mar 12 2018

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


