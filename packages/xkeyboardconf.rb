require 'package'

class Xorgkey < Package
  version '0.1.2'
  source_url 'ftp://ftp.x.org/pub/individual/data/xkeyboard-config/xkeyboard-config-2.15.tar.bz2'
  source_sha1 '4af1deeb7c5f4cad62e65957d98d6758'

  depends_on 'buildessential'
  depends_on 'gtk'
  depends_on 'pkgconfig'

  def self.build
    system "./configure $XORG_CONFIG --with-xkb-rules-symlink=xorg"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
  end
end
