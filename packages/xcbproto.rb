require 'package'

class Xproto < Package
  version '0.1.1'
  source_url 'http://xcb.freedesktop.org/dist/xcb-proto-1.11.tar.bz2'
  source_sha1 '6bf2797445dc6d43e9e4707c082eff9c'

  def self.build
    system "sudo ./configure $XORG_CONFIG"
    system "sudo make"
  end

  def self.install
    system "sudo make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
  end
end
