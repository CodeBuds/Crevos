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

#install nano
echo "Installing nano"
(echo y;) | crevos install nano

sleep 1 

echo "Get ready for the cool part, Installing graphical dependencies"
echo ""
echo "Installing Package Config..."
(echo y;) | crevos install pkgconfig
echo "Package Config install finished"

sleep 1

echo ""
echo "Installing GNOME > Gtk..."
(echo y;) crevos install gtk
echo "Gtk install finished"
echo ""

sleep 1

echo "Installing X Windows manager... Will take a long time, so sit back and relax"
cd $X11_PREFIX
sudo mkdir xc && cd xc
export XORG_PREFIX = "$X11_PREFIX"
export XORG_CONFIG="--prefix=$XORG_PREFIX --sysconfdir=/etc --localstatedir=/var --disable-static"
sudo cat > /etc/profile.d/xorg.sh << "EOF"
XORG_PREFIX="/usr"
XORG_CONFIG="--prefix=$XORG_PREFIX --sysconfdir=/etc --localstatedir=/var --disable-static"
export XORG_PREFIX XORG_CONFIG
EOF
chmod 644 /etc/profile.d/xorg.sh
#install util macros
(echo y;) crevos install utilmacros
cat > proto-7.7.md5 << "EOF"
1a05fb01fa1d5198894c931cf925c025  bigreqsproto-1.1.2.tar.bz2
98482f65ba1e74a08bf5b056a4031ef0  compositeproto-0.4.2.tar.bz2
998e5904764b82642cc63d97b4ba9e95  damageproto-1.2.1.tar.bz2
4ee175bbd44d05c34d43bb129be5098a  dmxproto-2.3.1.tar.bz2
b2721d5d24c04d9980a0c6540cb5396a  dri2proto-2.8.tar.bz2
a3d2cbe60a9ca1bf3aea6c93c817fee3  dri3proto-1.0.tar.bz2
e7431ab84d37b2678af71e29355e101d  fixesproto-5.0.tar.bz2
36934d00b00555eaacde9f091f392f97  fontsproto-2.1.3.tar.bz2
5565f1b0facf4a59c2778229c1f70d10  glproto-1.4.17.tar.bz2
6caebead4b779ba031727f66a7ffa358  inputproto-2.3.1.tar.bz2
94afc90c1f7bef4a27fdd59ece39c878  kbproto-1.0.7.tar.bz2
2d569c75884455c7148d133d341e8fd6  presentproto-1.0.tar.bz2
a46765c8dcacb7114c821baf0df1e797  randrproto-1.5.0.tar.bz2
1b4e5dede5ea51906f1530ca1e21d216  recordproto-1.14.2.tar.bz2
a914ccc1de66ddeb4b611c6b0686e274  renderproto-0.11.1.tar.bz2
cfdb57dae221b71b2703f8e2980eaaf4  resourceproto-1.2.0.tar.bz2
edd8a73775e8ece1d69515dd17767bfb  scrnsaverproto-1.2.2.tar.bz2
e658641595327d3990eab70fdb55ca8b  videoproto-2.3.2.tar.bz2
5f4847c78e41b801982c8a5e06365b24  xcmiscproto-1.2.2.tar.bz2
70c90f313b4b0851758ef77b95019584  xextproto-7.3.0.tar.bz2
120e226ede5a4687b25dd357cc9b8efe  xf86bigfontproto-1.2.0.tar.bz2
a036dc2fcbf052ec10621fd48b68dbb1  xf86dgaproto-2.1.tar.bz2
1d716d0dac3b664e5ee20c69d34bc10e  xf86driproto-2.1.1.tar.bz2
e793ecefeaecfeabd1aed6a01095174e  xf86vidmodeproto-2.3.1.tar.bz2
9959fe0bfb22a0e7260433b8d199590a  xineramaproto-1.2.1.tar.bz2
3ce2f230c5d8fa929f326ad1f0fa40a8  xproto-7.0.28.tar.bz2
EOF
sudo mkdir proto && cd proto && sudo grep -v '^#' ../proto-7.7.md5 | awk '{print $2}' | wget -i- -c \
    -B http://ftp.x.org/pub/individual/proto/ && sudo md5sum -c ../proto-7.7.md5
(echo y;) crevos install libxau
(echo y;) crevos install libxdmcp
(echo y;) crevos install xcbproto
(echo y;) crevos install libxcb
echo "Trying to install graphical libraries"
sudo cat > lib-7.7.md5 << "EOF"
c5ba432dd1514d858053ffe9f4737dd8  xtrans-1.3.5.tar.bz2
2e36b73f8a42143142dda8129f02e4e0  libX11-1.6.3.tar.bz2
52df7c4c1f0badd9f82ab124fb32eb97  libXext-1.3.3.tar.bz2
d79d9fe2aa55eb0f69b1a4351e1368f7  libFS-1.0.7.tar.bz2
addfb1e897ca8079531669c7c7711726  libICE-1.0.9.tar.bz2
499a7773c65aba513609fe651853c5f3  libSM-1.2.2.tar.bz2
7a773b16165e39e938650bcc9027c1d5  libXScrnSaver-1.2.2.tar.bz2
8f5b5576fbabba29a05f3ca2226f74d3  libXt-1.1.5.tar.bz2
41d92ab627dfa06568076043f3e089e4  libXmu-1.1.2.tar.bz2
769ee12a43611cdebd38094eaf83f3f0  libXpm-3.5.11.tar.bz2
e5e06eb14a608b58746bdd1c0bd7b8e3  libXaw-1.0.13.tar.bz2
b985b85f8b9386c85ddcfe1073906b4d  libXfixes-5.0.1.tar.bz2
f7a218dcbf6f0848599c6c36fc65c51a  libXcomposite-0.4.4.tar.bz2
5db92962b124ca3a8147daae4adbd622  libXrender-0.9.9.tar.bz2
1e7c17afbbce83e2215917047c57d1b3  libXcursor-1.1.14.tar.bz2
0cf292de2a9fa2e9a939aefde68fd34f  libXdamage-1.1.4.tar.bz2
0920924c3a9ebc1265517bdd2f9fde50  libfontenc-1.1.3.tar.bz2
96f76ba94b4c909230bac1e2dcd551c4  libXfont-1.5.1.tar.bz2
331b3a2a3a1a78b5b44cfbd43f86fcfe  libXft-2.3.2.tar.bz2
9c4a69c34b19ec1e4212e849549544cb  libXi-1.7.4.tar.bz2
9336dc46ae3bf5f81c247f7131461efd  libXinerama-1.1.3.tar.bz2
309762867e41c6fd813da880d8a1bc93  libXrandr-1.5.0.tar.bz2
45ef29206a6b58254c81bea28ec6c95f  libXres-1.0.7.tar.bz2
25c6b366ac3dc7a12c5d79816ce96a59  libXtst-1.2.2.tar.bz2
e0af49d7d758b990e6fef629722d4aca  libXv-1.0.10.tar.bz2
eba6b738ed5fdcd8f4203d7c8a470c79  libXvMC-1.0.9.tar.bz2
d7dd9b9df336b7dd4028b6b56542ff2c  libXxf86dga-1.1.4.tar.bz2
298b8fff82df17304dfdb5fe4066fe3a  libXxf86vm-1.1.4.tar.bz2
ba983eba5a9f05d152a0725b8e863151  libdmx-1.1.3.tar.bz2
ace78aec799b1cf6dfaea55d3879ed9f  libpciaccess-0.13.4.tar.bz2
4a4cfeaf24dab1b991903455d6d7d404  libxkbfile-1.0.9.tar.bz2
66662e76899112c0f99e22f2fc775a7e  libxshmfence-1.2.tar.bz2
EOF
sudo mkdir lib && cd lib &&
sudo grep -v '^#' ../lib-7.7.md5 | awk '{print $2}' | wget -i- -c \
    -B http://ftp.x.org/pub/individual/lib/ &&
sudo md5sum -c ../lib-7.7.md5
(echo y;) crevos install xcbutil
(echo y;) crevos install xcbutilimage
(echo y;) crevos install xcbutilkeysyms
(echo y;) crevos install xcbutilrender
(echo y;) crevos install xcbutilwm
(echo y;) crevos install freetype
wget -N --continue --no-check-certificate "http://www.linuxfromscratch.org/patches/blfs/svn/mesa-10.6.6-llvm_3_7-1.patch"
patch -Np1 -i ../mesa-10.6.6-llvm_3_7-1.patch &&
GLL_DRV="nouveau,r300,r600,radeonsi,svga,swrast" &&
./autogen.sh CFLAGS='-O2' CXXFLAGS='-O2'    \
            --prefix=$XORG_PREFIX           \
            --sysconfdir=/etc               \
            --enable-texture-float          \
            --enable-gles1                  \
            --enable-gles2                  \
            --enable-osmesa                 \
            --enable-xa                     \
            --enable-gbm                    \
            --enable-glx-tls                \
            --with-egl-platforms="drm,x11"  \
            --with-gallium-drivers=$GLL_DRV &&
unset GLL_DRV &&
make
(echo y;) crevos install xbitmaps
sudo cat > app-7.7.md5 << "EOF"
53a48e1fdfec29ab2e89f86d4b7ca902  bdftopcf-1.0.5.tar.bz2
25dab02f8e40d5b71ce29a07dc901b8c  iceauth-1.0.7.tar.bz2
c4a3664e08e5a47c120ff9263ee2f20c  luit-1.1.1.tar.bz2
18c429148c96c2079edda922a2b67632  mkfontdir-1.0.7.tar.bz2
9bdd6ebfa62b1bbd474906ac86a40fd8  mkfontscale-1.1.2.tar.bz2
e238c89dabc566e1835e1ecb61b605b9  sessreg-1.1.0.tar.bz2
2c47a1b8e268df73963c4eb2316b1a89  setxkbmap-1.3.1.tar.bz2
3a93d9f0859de5d8b65a68a125d48f6a  smproxy-1.0.6.tar.bz2
f0b24e4d8beb622a419e8431e1c03cd7  x11perf-1.6.0.tar.bz2
7d6003f32838d5b688e2c8a131083271  xauth-1.0.9.tar.bz2
0066f23f69ca3ef62dcaeb74a87fdc48  xbacklight-1.2.1.tar.bz2
9956d751ea3ae4538c3ebd07f70736a0  xcmsdb-1.0.5.tar.bz2
b58a87e6cd7145c70346adad551dba48  xcursorgen-1.0.6.tar.bz2
8809037bd48599af55dad81c508b6b39  xdpyinfo-1.3.2.tar.bz2
fceddaeb08e32e027d12a71490665866  xdriinfo-1.0.5.tar.bz2
249bdde90f01c0d861af52dc8fec379e  xev-1.2.2.tar.bz2
90b4305157c2b966d5180e2ee61262be  xgamma-1.0.6.tar.bz2
f5d490738b148cb7f2fe760f40f92516  xhost-1.0.7.tar.bz2
305980ac78a6954e306a14d80a54c441  xinput-1.6.1.tar.bz2
0012a8e3092cddf7f87b250f96bb38c5  xkbcomp-1.3.0.tar.bz2
c747faf1f78f5a5962419f8bdd066501  xkbevd-1.1.4.tar.bz2
502b14843f610af977dffc6cbf2102d5  xkbutils-1.0.4.tar.bz2
0ae6bc2a8d3af68e9c76b1a6ca5f7a78  xkill-1.0.4.tar.bz2
5dcb6e6c4b28c8d7aeb45257f5a72a7d  xlsatoms-1.1.2.tar.bz2
9fbf6b174a5138a61738a42e707ad8f5  xlsclients-1.1.3.tar.bz2
2dd5ae46fa18abc9331bc26250a25005  xmessage-1.0.4.tar.bz2
723f02d3a5f98450554556205f0a9497  xmodmap-1.0.9.tar.bz2
6101f04731ffd40803df80eca274ec4b  xpr-1.0.4.tar.bz2
fae3d2fda07684027a643ca783d595cc  xprop-1.2.2.tar.bz2
441fdb98d2abc6051108b7075d948fc7  xrandr-1.4.3.tar.bz2
b54c7e3e53b4f332d41ed435433fbda0  xrdb-1.1.0.tar.bz2
a896382bc53ef3e149eaf9b13bc81d42  xrefresh-1.0.5.tar.bz2
dcd227388b57487d543cab2fd7a602d7  xset-1.2.3.tar.bz2
7211b31ec70631829ebae9460999aa0b  xsetroot-1.1.1.tar.bz2
558360176b718dee3c39bc0648c0d10c  xvinfo-1.1.3.tar.bz2
6b5d48464c5f366e91efd08b62b12d94  xwd-1.0.6.tar.bz2
b777bafb674555e48fd8437618270931  xwininfo-1.1.3.tar.bz2
3025b152b4f13fdffd0c46d0be587be6  xwud-1.0.4.tar.bz2
EOF
sudo mkdir app &&
cd app &&
sudo grep -v '^#' ../app-7.7.md5 | awk '{print $2}' | wget -i- -c \
    -B http://ftp.x.org/pub/individual/app/ &&
sudo md5sum -c ../app-7.7.md5
(echo y;) crevos install xcursor
sudo cat > font-7.7.md5 << "EOF"
23756dab809f9ec5011bb27fb2c3c7d6  font-util-1.3.1.tar.bz2
0f2d6546d514c5cc4ecf78a60657a5c1  encodings-1.0.4.tar.bz2
1347c3031b74c9e91dc4dfa53b12f143  font-adobe-100dpi-1.0.3.tar.bz2
6c9f26c92393c0756f3e8d614713495b  font-adobe-75dpi-1.0.3.tar.bz2
66fb6de561648a6dce2755621d6aea17  font-adobe-utopia-100dpi-1.0.4.tar.bz2
e99276db3e7cef6dccc8a57bc68aeba7  font-adobe-utopia-75dpi-1.0.4.tar.bz2
fcf24554c348df3c689b91596d7f9971  font-adobe-utopia-type1-1.0.4.tar.bz2
6d25f64796fef34b53b439c2e9efa562  font-alias-1.0.3.tar.bz2
cc0726e4a277d6ed93b8e09c1f195470  font-arabic-misc-1.0.3.tar.bz2
9f11ade089d689b9d59e0f47d26f39cd  font-bh-100dpi-1.0.3.tar.bz2
565494fc3b6ac08010201d79c677a7a7  font-bh-75dpi-1.0.3.tar.bz2
c8b73a53dcefe3e8d3907d3500e484a9  font-bh-lucidatypewriter-100dpi-1.0.3.tar.bz2
f6d65758ac9eb576ae49ab24c5e9019a  font-bh-lucidatypewriter-75dpi-1.0.3.tar.bz2
e8ca58ea0d3726b94fe9f2c17344be60  font-bh-ttf-1.0.3.tar.bz2
53ed9a42388b7ebb689bdfc374f96a22  font-bh-type1-1.0.3.tar.bz2
6b223a54b15ecbd5a1bc52312ad790d8  font-bitstream-100dpi-1.0.3.tar.bz2
d7c0588c26fac055c0dd683fdd65ac34  font-bitstream-75dpi-1.0.3.tar.bz2
5e0c9895d69d2632e2170114f8283c11  font-bitstream-type1-1.0.3.tar.bz2
e452b94b59b9cfd49110bb49b6267fba  font-cronyx-cyrillic-1.0.3.tar.bz2
3e0069d4f178a399cffe56daa95c2b63  font-cursor-misc-1.0.3.tar.bz2
0571bf77f8fab465a5454569d9989506  font-daewoo-misc-1.0.3.tar.bz2
6e7c5108f1b16d7a1c7b2c9760edd6e5  font-dec-misc-1.0.3.tar.bz2
bfb2593d2102585f45daa960f43cb3c4  font-ibm-type1-1.0.3.tar.bz2
a2401caccbdcf5698e001784dbd43f1a  font-isas-misc-1.0.3.tar.bz2
cb7b57d7800fd9e28ec35d85761ed278  font-jis-misc-1.0.3.tar.bz2
143c228286fe9c920ab60e47c1b60b67  font-micro-misc-1.0.3.tar.bz2
96109d0890ad2b6b0e948525ebb0aba8  font-misc-cyrillic-1.0.3.tar.bz2
6306c808f7d7e7d660dfb3859f9091d2  font-misc-ethiopic-1.0.3.tar.bz2
e3e7b0fda650adc7eb6964ff3c486b1c  font-misc-meltho-1.0.3.tar.bz2
c88eb44b3b903d79fb44b860a213e623  font-misc-misc-1.1.2.tar.bz2
56b0296e8862fc1df5cdbb4efe604e86  font-mutt-misc-1.0.3.tar.bz2
e805feb7c4f20e6bfb1118d19d972219  font-schumacher-misc-1.1.2.tar.bz2
6f3fdcf2454bf08128a651914b7948ca  font-screen-cyrillic-1.0.4.tar.bz2
beef61a9b0762aba8af7b736bb961f86  font-sony-misc-1.0.3.tar.bz2
948f2e07810b4f31195185921470f68d  font-sun-misc-1.0.3.tar.bz2
829a3159389b7f96f629e5388bfee67b  font-winitzki-cyrillic-1.0.3.tar.bz2
3eeb3fb44690b477d510bbd8f86cf5aa  font-xfree86-type1-1.0.4.tar.bz2
EOF
sudo mkdir font &&
cd font &&
sudo grep -v '^#' ../font-7.7.md5 | awk '{print $2}' | wget -i- -c \
    -B http://ftp.x.org/pub/individual/font/ &&
sudo md5sum -c ../font-7.7.md5
(echo y;) crevos install xkeyboardconf
(echo y;) crevos install xorgserver
(echo y;) crevos install libevdev
(echo y;) crevos install twm
