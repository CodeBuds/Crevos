require 'package'

class Xcbutilwm < Package
  version '0.1.1'
  source_url 'http://xcb.freedesktop.org/dist/xcb-util-wm-0.4.1.tar.bz2'
  source_sha1 '87b19a1cd7bfcb65a24e36c300e03129'

  depends_on 'buildessential'

  def self.build
    system "./configure $XORG_CONFIG"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
