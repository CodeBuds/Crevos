require 'package'

class Xorgserv < Package
  version '0.1.1'
  source_url 'ftp://ftp.x.org/pub/individual/xserver/xorg-server-1.17.2.tar.bz2'
  source_sha1 '397e405566651150490ff493e463f1ad'

  def self.build
    system "./configure $XORG_CONFIG --enable-glamor --enable-install-setuid --enable-suid-wrapper --disable-systemd-logind --with-xkb-output=/var/lib/xkb"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install && 
    sudo mkdir -pv /etc/X11/xorg.conf.d &&
    sudo cat >> /etc/sysconfig/createfiles << "EOF"
    /tmp/.ICE-unix dir 1777 root root
    /tmp/.X11-unix dir 1777 root root
    EOF"
  end
end
