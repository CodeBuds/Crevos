require 'package'

class Xorgserv < Package
  version '0.1.1'
  source_url 'ftp://ftp.x.org/pub/individual/xserver/xorg-server-1.17.2.tar.bz2'
  source_sha1 '397e405566651150490ff493e463f1ad'

  depends_on 'buildessential'
  depends_on 'gtk'
  depends_on 'pkgconfig'
  depends_on 'xorgkey'
  depends_on 'xfonts'

  def self.build
    system "./configure $XORG_CONFIG --enable-glamor --enable-install-setuid --enable-suid-wrapper --disable-systemd-logind --with-xkb-output=/var/lib/xkb"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install && mkdir -pv /etc/X11/xorg.conf.d"
  end
end
