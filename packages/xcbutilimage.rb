require 'package'

class Xcbutilimage < Package
  version '0.1.1'
  source_url 'http://xcb.freedesktop.org/dist/xcb-util-image-0.4.0.tar.bz2'
  source_sha1 '08fe8ffecc8d4e37c0ade7906b3f4c87'

  depends_on 'buildessential'

  def self.build
    system "sudo ./configure $XORG_CONFIG"
    system "sudo make"
  end

  def self.install
    system "sudo make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
  end
end
