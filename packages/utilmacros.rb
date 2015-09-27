require 'package'

class Utilmacros < Package
  version '0.1.1'
  source_url 'ftp://ftp.x.org/pub/individual/util/util-macros-1.19.0.tar.bz2'
  source_sha1 '1cf984125e75f8204938d998a8b6c1e1'

  def self.build
    system "sudo ./configure $XORG_CONFIG"
    system "sudo make"
  end

  def self.install
    system "sudo make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
