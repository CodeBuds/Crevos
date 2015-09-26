#
# Welcome to Crevos which is something short for Chrome Development Operating System
# If you need to change the directories for the files below just do so
# If you would like to contact Eli: <plunkinguitar@gmail.com> or David: <smerkousdavid@gmail.com>
# We would be happy to help (P.S. some of this you might see is similar to chromebrew by skycocker)
#

# Directories for all files
CREATORS="David Smerkous and Eli Smith"
MODIFIERS="NONE"
URL="https://raw.github.com/smerkousdavid/Crevos/master"
CPREFIX=/usr/local
CBIN=$CPREFIX/bin
CLIB=$CPREFIX/lib/crevos/
CCONFIG=$CPREFIX/etc/crevos/
CBREW=$CPREFIX/tmp/crevos/
CDEST=$CBREW/dest
CPACKAGES=$CLIB/packages

#Short intro
echo "Welcome to Crevos, Chrome Development Operating System"
echo "By: $CREATORS"
echo "Modified By: $MODIFIERS"

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
#install crevos library
mkdir $CLIB/lib && cd $CPREFIX/bin
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
wget -N --continue --no-check-certificate $URL/packages/allDepend.rb

#install readline for ruby
(echo y;) | crevos install readline

#install git
(echo y;) | crevos install git

#prepare sparse checkout .rb packages directory and do it
cd $CLIB
git init
git remote add -f origin https://github.com/smerkousdavid/Crevos.git
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
