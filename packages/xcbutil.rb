require 'package'

class Xcbutil < Package
  version '0.1.1'
  source_url 'http://xcb.freedesktop.org/dist/xcb-util-0.4.0.tar.bz2'
  source_sha1 '2e97feed81919465a04ccc71e4073313'

  def self.build
    system "sudo ./configure $XORG_CONFIG"
    system "sudo make"
  end

  def self.install
    system "sudo make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
  end
end
