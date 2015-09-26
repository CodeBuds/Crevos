require 'package'

class Libxdmcp < Package
  version '0.1.1'
  source_url 'ftp://ftp.x.org/pub/individual/lib/libXdmcp-1.1.2.tar.bz2'
  source_sha1 '18aa5c1279b01f9d18e3299969665b2e'

  depends_on 'buildessential'

  def self.build
    system "./configure $XORG_CONFIG"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
