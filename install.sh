#
# Welcome to Crevos which is something short for Chrome Development Operating System
# If you need to change the directories for the files below just do so
# If you would like to contact Eli: <plunkinguitar@gmail.com> or David: <smerkousdavid@gmail.com>
# We would be happy to help (P.S. some of this you might see is similar to chromebrew by skycocker)
#

# Directories for all files
CREATORS="David Smerkous and Eli Smith"
MODIFIERS="NONE"
URL="https://raw.github.com/CodeBuds/Crevos/master"
CPREFIX=/usr/local
CBIN=$CPREFIX/bin
CLIB=$CPREFIX/lib/crevos/
CCONFIG=$CPREFIX/etc/crevos/
CBREW=$CPREFIX/tmp/crevos/
CDEST=$CBREW/dest
CPACKAGES=$CLIB/packages

X11_PREFIX=/usr
X11_PATH=$X11_PREFIX/xc

#Short intro
echo "Welcome to Crevos, Chrome Development Operating System"
echo "By: $CREATORS"
echo "Modified By: $MODIFIERS"
echo ""
echo ""

sleep 1

#Similar to chromebrew check to see if architecture is similar
user=$(whoami)
architecture=$(uname -m)

if [ $architecture != "i686" ] && [ $architecture != "x86_64" ]; then
  echo "Please make sure you have an intel 32bit or 64bit device for Crevos to work :'("
  echo 'exiting...'
  exit 1;
fi

#You already asked to wipe everything so lets do it 
#You must use chown to change ownership of file which is a good idea
sudo mkdir -p $CLIB && sudo chown -R $USER:$USER $CLIB
sudo mkdir -p $CCONFIG && sudo chown -R $USER:$USER $CCONFIG
sudo mkdir -p $CCONFIG/meta && sudo chown -R $USER:$USER $CCONFIG/meta
sudo mkdir -p $CBREW && sudo chown -R $USER:$USER $CBREW
sudo mkdir -p $CDEST && sudo chown -R $USER:$USER $CDEST
sudo mkdir -p $CPACKAGES && sudo chown -R $USER:$USER $CPACKAGES

#Like cromebrew have the installation happen in the crew directory
cd $CBREW

#EXACLTY from crew because we do need ruby to run this don't we
echo "Downloading Ruby"

sleep 2

case "$architecture" in
"i686")
  link='https://dl.dropboxusercontent.com/s/tufbuqcn80ubypx/ruby-2.0.0p247-chromeos-i686.tar.gz?token_hash=AAGu_5wuqZe2eDOkfL5oh4esQ8HAZJIvbMG7GplnQrSa3g&dl=1'
  tarname='ruby-2.0.0p247-chromeos-'$architecture'.tar.gz'
  ;;
"x86_64")
  link='https://dl.dropboxusercontent.com/s/3dw5ue5vhf5nj8k/ruby-2.0.0-p247-chromeos1-chromeos-x86_64.tar.gz?dl=1&token_hash=AAHYJ-WOExuc2f4mKN3pDHUOlTMnt3h-rBosLmYr2Gvy7w'
  tarname='ruby-2.0.0-p247-chromeos1-chromeos-'$architecture'.tar.gz'
  ;;
esac

#The above snippet just gets the url now we actually install it
wget --continue --no-check-certificate --content-disposition $link -O $tarname

#Extract and install using the tar command which every linux system should have
echo "Installing ruby Please wait..."
sudo tar -xf $tarname
sudo cp -r ./usr/* /usr
sudo mv ./dlist $CCONFIG/meta/ruby.directorylist
sudo mv ./filelist $CCONFIG/meta/ruby.filelist
#End of ruby installment

#download, prepare and install Crevos, mostly built from crew
cd $CLIB
wget -N --continue --no-check-certificate $URL/crevos
sudo chmod +x crevos
chmod +x crevos
sudo ln -s `pwd`/crevos $CPREFIX/bin
wget -N --continue --no-check-certificate $URL/crevos-uninstall
sudo chmod +x crevos-uninstall
chmod +x crevos-uninstall
sudo ln -s `pwd`/crevos-uninstall $CPREFIX/bin
wget -N --continue --no-check-certificate $URL/crevos-reinstall
sudo chmod +x crevos-reinstall
chmod +x crevos-reinstall
sudo ln -s `pwd`/crevos-reinstall $CPREFIX/bin
wget -N --continue --no-check-certificate $URL/install-x
sudo chmod +x install-x
chmod +x install-x
sudo ln -s `pwd`/install-x $CPREFIX/bin
#install crevos library
mkdir $CLIB/lib && cd $CLIB/lib
wget -N --continue --no-check-certificate $URL/lib/package.rb
wget -N --continue --no-check-certificate $URL/lib/package_helpers.rb

cd $CBIN
chmod +x crevos
chmod +x crevos-uninstall
chmod +x crevos-reinstall


#create the device.json file (We will need to fix this up later), Copied from chromebrew
cd $CCONFIG
touch device.json
echo "{" > device.json
echo '  "architecture": "'$architecture'",' >> device.json
echo '  "installed_packages": [' >> device.json
echo '    {' >> device.json
echo '      "name": "ruby",' >> device.json
echo '      "version": "2.0.0p247"' >> device.json
echo '    }' >> device.json
echo '  ]' >> device.json
echo "}" >> device.json

#I didn't want to type any of this so I just got this from crew
#download git and its dependencies .rb package files
echo 'Installing dependencies...'
cd $CPACKAGES
wget -N --continue --no-check-certificate $URL/packages/git.rb
wget -N --continue --no-check-certificate $URL/packages/zlibpkg.rb
wget -N --continue --no-check-certificate $URL/packages/libssh2.rb
wget -N --continue --no-check-certificate $URL/packages/perl.rb
wget -N --continue --no-check-certificate $URL/packages/curl.rb
wget -N --continue --no-check-certificate $URL/packages/expat.rb
wget -N --continue --no-check-certificate $URL/packages/gettext.rb
wget -N --continue --no-check-certificate $URL/packages/python.rb
wget -N --continue --no-check-certificate $URL/packages/readline.rb
wget -N --continue --no-check-certificate $URL/packages/ruby.rb
wget -N --continue --no-check-certificate $URL/packages/buildessential.rb
wget -N --continue --no-check-certificate $URL/packages/gcc.rb
wget -N --continue --no-check-certificate $URL/packages/binutils.rb
wget -N --continue --no-check-certificate $URL/packages/make.rb
wget -N --continue --no-check-certificate $URL/packages/mpc.rb
wget -N --continue --no-check-certificate $URL/packages/mpfr.rb
wget -N --continue --no-check-certificate $URL/packages/gmp.rb
wget -N --continue --no-check-certificate $URL/packages/glibc.rb
wget -N --continue --no-check-certificate $URL/packages/linuxheaders.rb
wget -N --continue --no-check-certificate $URL/packages/pkgconfig.rb
wget -N --continue --no-check-certificate $URL/packages/gtk.rb
wget -N --continue --no-check-certificate $URL/packages/utilmacros.rb
wget -N --continue --no-check-certificate $URL/packages/libxau.rb
wget -N --continue --no-check-certificate $URL/packages/libxcb.rb
wget -N --continue --no-check-certificate $URL/packages/libxdmcp.rb
wget -N --continue --no-check-certificate $URL/packages/nano.rb
wget -N --continue --no-check-certificate $URL/packages/nanoinst.rb
wget -N --continue --no-check-certificate $URL/packages/twm.rb
wget -N --continue --no-check-certificate $URL/packages/xbitmaps.rb
wget -N --continue --no-check-certificate $URL/packages/xcbproto.rb
wget -N --continue --no-check-certificate $URL/packages/xcbutil.rb
wget -N --continue --no-check-certificate $URL/packages/xcbutilimage.rb
wget -N --continue --no-check-certificate $URL/packages/xcbutilkeysysms.rb
wget -N --continue --no-check-certificate $URL/packages/xcbutilrender.rb
wget -N --continue --no-check-certificate $URL/packages/xcbutilwm.rb
wget -N --continue --no-check-certificate $URL/packages/xcursor.rb
wget -N --continue --no-check-certificate $URL/packages/xkeyboardconf.rb
wget -N --continue --no-check-certificate $URL/packages/xorgserver.rb
wget -N --continue --no-check-certificate $URL/packages/xpix.rb
wget -N --continue --no-check-certificate $URL/packages/freetype.rb
wget -N --continue --no-check-certificate $URL/packages/libevdev.rb
wget -N --continue --no-check-certificate $URL/packages/fontconfig.rb
wget -N --continue --no-check-certificate $URL/packages/jdk8.rb
wget -N --continue --no-check-certificate $URL/packages/xterm.rb

#install readline for ruby
(echo y;) | crevos install readline

#install git
(echo y;) | crevos install git

#prepare sparse checkout .rb packages directory and do it
cd $CLIB
git init
git remote add -f origin https://github.com/CodeBuds/Crevos.git
git config core.sparsecheckout true
echo packages >> .git/info/sparse-checkout
echo lib >> .git/info/sparse-checkout
echo crevos >> .git/info/sparse-checkout
git fetch origin master 
git reset --hard origin/master
echo "Crevos has been installed (ALPHA TO THE BETA TO THE ALPHA)..."
echo "So see if you can run something graphical"

cd $CBIN
chmod +x crevos
chmod +x crevos-uninstall
chmod +x crevos-reinstall
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo "PLEASE READ ALL OF THIS AND ANSWER CAREFULLY... If you don't you might need to reinstall this script"
echo "The problem here is that we can't just randomly change deep system files"
echo "we will need to remount the user filesystem so we can edit the X11 settings"
echo ""
echo "If you select something besides no, program will exit..."
echo "If you select yes or put some other character, (if not already) continue installation using install-x"
echo "Fyi don't but 'crevos install-x' just 'install-x' (Without apos.)"
echo ""
echo "Have you mounted and rebooted your syetem to read and write yet"
echo "Press Ctrl+Z to quit, if you have already mounted and rebooted your system before"
sleep 5
  echo "Please be ready to anwser system settings questions, so that we can proceed"
  sleep 3
  sudo /usr/share/vboot/bin/make_dev_ssd.sh --remove_rootfs_verification
  sudo crossystem dev_boot_signed_only=0
  sleep 1
  echo ""
  echo ""
  echo "I just ran a script to modify your kernel, so I can access system directories..."
  echo "The above command I just ran said 'Try running the script with ...... --partitions N'"
  echo ""
  echo ""
  read -p "Please enter (The number nothing else (ex: 2)) the number of the partition N above: " an
  re='^[0-9]+$'
  if ! [[ $an =~ $re ]] ; then
     echo "ERROR: Not a number..."
     echo "Remember what I said to be careful"
     echo "Now you have 2 choices, either reinstall this script"
     echo "OR"
     echo "type in these (to finish) commands"
     echo ""
     echo "sudo /usr/share/vboot/bin/make_dev_ssd.sh --remove_rootfs_verification"
     echo "sudo crossystem dev_boot_signed_only=0"
     echo "sudo /usr/share/vboot/bin/make_dev_ssd.sh --remove_rootfs_verification --partitions N (Replace N with number)"
     echo "sudo mount -o remount,rw /"
     echo "sudo reboot (This will reboot your system)"
     echo "(After you reboot run this command)"
     echo "install-x"
     exit 1
  fi
  sudo /usr/share/vboot/bin/make_dev_ssd.sh --remove_rootfs_verification --partitions $an
  sudo crossystem dev_boot_signed_only=0
  sudo mount -o remount,rw /
  echo "Succesful remount of system, now the rest of the script should run with little warnings besides"
  echo "That this isn't a officialy supported device (Luckily we have been able to fix that)"
  echo "BUT"
  echo "For the second have of the script to work you will need to reboot"
  echo "As soon as you reboot, you will need to install X11 for chromebooks, so run the command"
  echo "install-x"
  echo "Nothing else just install-x"
  echo ""
  read -p "You need to reboot, do you want to now? [y/n]" ny
  sleep 1
  case $ny in
  [yY]* ) sudo reboot;;
  [nN]* ) exit;;
  * ) echo "Sorry didn't understand that :'(";; 
  esac
