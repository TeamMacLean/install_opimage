.PHONY : update netstuff matplotlib scipy scikit-image opimage access_point remove_folders

update :
		sudo apt-get update

access_point :
	git clone git://github.com/TeamMacLean/make_ap
	cd make_ap; sudo bash make_access_point.sh

netstuff :
	sudo apt-get install netatalk
	sudo apt-get install samba

matplotlib :
	sudo apt-get install python-matplotlib

scipy : matplotlib
	sudo apt-get install python-scipy

scikit-image : scipy
	sudo apt-get install cython 
	sudo pip install scikit-image

opimage : scikit-image opimage_things
	git clone git://github.com/TeamMacLean/opimage.git
	cd opimage; sudo python setup.py develop

opimage_things :
	git clone git://github.com/TeamMacLean/opimage_things
	cd opimage_things; sudo python setup.py develop

opimage_interface : opimage
	git clone git://github.com/TeamMacLean/opimage_interface.git
	cd opimage_interface; sudo chmod 775 cgi-bin/*
	mv opimage_interface ~/Desktop

remove_folders :
	sudo rm -rf make_ap/

clean :
	sudo rm -rf make_ap
	sudo rm -rf opimage
	sudo rm -rf opimage_things

ap : update access_point

software : netstuff matplotlib scipy scikit-image opimage opimage_interface remove_folders
