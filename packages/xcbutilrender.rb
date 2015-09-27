require 'package'

class Xcbutilrender < Package
  version '0.1.1'
  source_url 'http://xcb.freedesktop.org/dist/xcb-util-renderutil-0.3.9.tar.bz2'
  source_sha1 '468b119c94da910e1291f3ffab91019a'

  def self.build
    system "./configure $XORG_CONFIG"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
  end
end
