require 'package'

class Libxau < Package
  version '0.1.1'
  source_url 'ftp://ftp.x.org/pub/individual/lib/libXau-1.0.8.tar.bz2'
  source_sha1 '685f8abbffa6d145c0f930f00703b21b'

  depends_on 'buildessential'

  def self.build
    system "sudo ./configure $XORG_CONFIG"
    system "sudo make"
  end

  def self.install
    system "sudo make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
  end
end
