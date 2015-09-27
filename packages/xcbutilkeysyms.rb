require 'package'

class Xcbutilkeysysms < Package
  version '0.1.1'
  source_url 'http://xcb.freedesktop.org/dist/xcb-util-keysyms-0.4.0.tar.bz2'
  source_sha1 '1022293083eec9e62d5659261c29e367'

  depends_on 'buildessential'

  def self.build
    system "./configure $XORG_CONFIG"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
  end
end
