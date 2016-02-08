# Making your Open Pi Image System

## The Hardware

You will need:

1.  Raspberry Pi 2 Model B
2.  64 Gb memory card
3.  External HD / USB Stick
4.  2x WiFi dongles (preferably of chipset xxx)
5.  HDMI monitor and cable
6.  USB mouse and keyboard
7.  Some other computer and a memory card reader
8.  PiNoir camera module and cable
9.  Wireless internet access

### Starting up the Pi

1.  You will first need to put an operating system on the SD card, we will use Raspbian. The whole process is described at the Raspberry Pi site [https://www.raspberrypi.org/documentation/installation/installing-images/](here), so please follow those instructions. Make sure to flash the SD card with the `JESSIE` version of Raspbian (`2015-11-21`).
2.  Now plug in the monitor, keyboard, PiNoir camera and both WiFi dongles to the Pi. Then plug in the power supply, the Pi should start up.

### Expand the filesystem

3. We will eventually install a lot of software. So let's make the Pi use the whole memory card. Expand the filesystem using the Pi's System Preferences program.
Go to the `Menu` button at the top left corner of the Pi Deskyop
  1.  `Menu -> Preferences -> System tab -> Expand filesystem`
  2.  `Menu -> Preferences -> Interfaces tab -> Camera Enable`
  3.  `Menu -> Shutdown -> Reboot`

### Connect the Pi to the internet.

To set everything up, we need a basic internet connection. Here are wireless instructions, you can use a wired ethernet connection if you like.

1.  Use the WiFi configuration panel (in the top right of the screen, under the WiFi symbol, click and select `wlan0` to select the wireless network to connect to).

### Update system software

Now we need to make sure that the Pi's internal software is up to date. We'll use `apt-get` - the Raspbian software package manager. Open a Terminal by clicking the Terminal program icon at the top of the screen, you should get a black window to type into. Type  

  `sudo apt-get update`

and the software should update automatically.

The Pi should now be in its basic state and we're ready to go ahead with the stuff for `Open Pi Image`.

## The software
There are two options at this stage, an automatic build script that makes plenty of assumptions about your locale but _should_ be fine, and a manual walkthrough where you can configure things a bit more.

## Automatic Method

We'll get the automatic script from github and run that.

1.  In the terminal window, type `git clone git://github.com/TeamMacLean/install_opimage`
2.  Then type `cd install_opimage`
3.  Then type `make ap`

This will setup the wireless access point. You need to answer some questions about your local network. If you don't know the answers, use the suggested defaults and keep your fingers crossed. Here are the questions you'll be asked with suggested answers (we will try to make this step automatic in the future):

1.  Qn 0) `Do you accept above terms?` - press `y` to accept.
2.  Qn 1) `Please provide your new SSID to be broadcasted by RPi` - The name of the network your Pi will create, try `TheRPi`
3.  Qn 2) `Please provide password for your new wireless network (8-63 characters)` -  The password to access this new network, try `raspberry`
4.  Qn 3) This one is dependent on the hardware of your dongles, it may not be asked - `Some of the WiFi chipset require special version of hostapd. Please answer yes if you want to have different version of hostapd downloaded.` type `yes` to answer yes.
5.  Qn 4) `You have more than one wlan interface. Please select the interface to become AP` - use `wlan1` so __PRESS 2__ **dont type wlan1**
6.  Qn 5) `Please provide network interface that will be used as WAN connection` - if you intend to use a wireless connection to connect to the internet, type `wlan0` - it is possible to setup a wired connection here by typing `eth0` if you wish.
7.  Qn 6) `Please provide your new AP network (i.e. 192.168.10.X). Remember to put X at the end!!!` - this is the address of the subnet your Pi will work on. Assuming that there aren't already machines with this range of IP's locally type - `10.10.10.X`
8.  Qn 7) You will see a summary of the information provided, type `Y` to confirm
9.  Qn 8) `Would you like to start AP on boot? (y/n)` - type `y` to agree







Once done, the Pi will need rebooting, so do that and when it starts again re-open the terminal and

1.  Type `cd install_opimage`
2.  Then type `make software`

The  download and setup process should now begin, there is a lot to do so it will take a long time.


## Manual Method.
Try these steps if the Automatic
### Make the Pi into an Access Point

To make the Pi reachable over the wireless...
Open Terminal from menu bar
`cd Desktop`
`git clone git://github.com/TeamMacLean/make_ap`
`cd make_ap`
`sudo bash make_access_point.sh`

Qn 0) accept terms
Qn 1) SSID - `TheRPi`
Qn 2) pword - `raspberry`
qn3 ) which dongle for ap - wlan1 PRESS 2 dont type wlan1
qn 4) which dongle wifi type wlan0
qn 5) address for IP `10.10.10.X`
qn 6) continue `Y`
qn 7) do you want to start ap? - yes

Reboot.

## install samba/afp

`sudo apt-get install netatalk`
`sudo apt-get install samba`

## install opimage_things
`cd Desktop`
`git clone git://github.com/TeamMacLean/opimage_things`
`cd opimage_things`
`sudo python setup.py develop`

## opimage prerequisites
`sudo apt-get install python sci-py`
`sudo pip install -U scikit-image` #45mins!

## opimage itself
cd Desktop
`git clone git://github.com/TeamMacLean/opimage`
`cd opimage`
`sudo python setup.py develop`


##opimage Interface
`git clone git://github.com/TeamMacLean/opimage_interface`

## connet to Po
wifi - TheRPi pword raspberry

`nohup python -m CGIHTTPServer 8000 &`
