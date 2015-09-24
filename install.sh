#
# Welcome to Crevos which is something short for Chrome Development Operating System
# If you need to change the directories for the files below just do so
# If you would like to contact Eli: <Email> or David: smerkousdavid@gmail.com
# We would be happy to help (P.S. some of this you might see is similar to chromebrew)

# Directories for all files
CREVOSCREATORS="David Smerkous and Eli Smith"
CREVOSMODIFIERS="NONE"
URL="https://raw.github.com/smerkousdavid/Crevos/master"
CREVOS_PRE=/usr/local
CREVOS_LIB_PATH=$CREVOS_PRE/lib/crevos/
CREVOS_CONFIG_PATH=$CREVOS_PRE/etc/crevos/
CREVOS_BREW_DIR=$CREVOS_PRE/tmp/crevos/
CREVOS_DEST_DIR=$CREVOS_BREW_DIR/dest
CREVOS_PACKAGES_PATH=$CREVOS_LIB_PATH/packages

echo 'Welcome to Crevos, Chrome Development Operating System\nBy:$CREVOSCREATORS\nModified By:$CREVOSMODIFIERS'
#Similar to chromebrew check to see if architecture is similar
user=$(whoami)
architecture=$(uname -m)

if [ $architecture != "i686" ] && [ $architecture != "x86_64" ]; then
  echo 'Please make sure you have an intel device for Crevos to work :<('
  sleep 1
  echo 'exiting...'
  exit 1;
fi

#Double check to remove everything
read -r -p "Do you want to continue? [y/N] " response
case $response in
    [yY][eE][sS]|[yY]) 
        continue
        ;;
    *)
        echo 'Exiting...'
        sleep 1
        exit 1;
        ;;
esac

#You already asked to wipe everything so lets do it 
#You must use chown to change ownership of file which is a good idea
sudo mkdir -p $CREVOS_LIB_PATH && sudo chown -R $USER:$USER $CREVOS_LIB_PATH
sudo mkdir -p $CREVOS_CONFIG_PATH && sudo chown -R $USER:$USER $CREVOS_CONFIG_PATH
sudo mkdir -p $CREVOS_CONFIG_PATH/meta && sudo chown -R $USER:$USER $CREVOS_CONFIG_PATH/meta
sudo mkdir -p $CREVOS_BREW_DIR && sudo chown -R $USER:$USER $CREVOS_BREW_DIR
sudo mkdir -p $CREVOS_DEST_DIR && sudo chown -R $USER:$USER $CREVOS_DEST_DIR
sudo mkdir -p $CREVOS_PACKAGES_PATH && sudo chown -R $USER:$USER $CREVOS_PACKAGES_PATH

#Like cromebrew have the installation happen in then crew directory
cd $CREVOS_BREW_DIR

#EXACLTY from crew because we do need ruby to run this don't we
echo "Downloading program managment file runner... aka Ruby"

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
tar -xf $tarname
sudo cp -r ./usr/* /usr
mv ./dlist $CREVOS_CONFIG_PATH/meta/ruby.directorylist
mv ./filelist $CREVOS_CONFIG_PATH/meta/ruby.filelist
#End of ruby installment

#download, prepare and install Crevos, mostly built from crew
cd $CREVOS_LIB_PATH
wget -N --continue --no-check-certificate $URL/crevos
chmod +x crevos
sudo ln -s `pwd`/crevos $CREVOS_PRE/bin
#install crevos library
mkdir $CREVOS_LIB_PATH/lib && cd $CREVOS_LIB_PATH/lib
wget -N --continue --no-check-certificate $URL/lib/package.rb
wget -N --continue --no-check-certificate $URL/lib/package_helpers.rb

#create the device.json file (We will need to fix this up later)
cd $CREVOS_CONFIG_PATH
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
cd $CREVOS_PACKAGES_PATH
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

#install readline for ruby
(echo y;) | crevos install readline

#install git
(echo y;) | crevos install git

#prepare sparse checkout .rb packages directory and do it
cd $CREVOS_LIB_PATH
git init
git remote add -f origin https://github.com/smerkousdavid/Crevos.git
git config core.sparsecheckout true
echo packages >> .git/info/sparse-checkout
echo lib >> .git/info/sparse-checkout
echo crevos >> .git/info/sparse-checkout
git fetch origin master
git reset --hard origin/master
echo "Crevos has been installed (ALPHA TO THE BETA)...\nSo see if you can run something graphical"
