require 'package'

class Xbitmaps < Package
  version '0.1.1'
  source_url 'ftp://ftp.x.org/pub/individual/data/xbitmaps-1.1.1.tar.bz2'
  source_sha1 '7444bbbd999b53bec6a60608a5301f4c'

  depends_on 'buildessential'

  def self.build
    system "./configure $XORG_CONFIG"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
  end
end
