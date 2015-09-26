require 'package'

class Xcursor < Package
  version '0.1.1'
  source_url 'ftp://ftp.x.org/pub/individual/data/xcursor-themes-1.0.4.tar.bz2'
  source_sha1 'fdfb0ad9cfceed60e3bfe9f18765aa0d'

  depends_on 'buildessential'
  depends_on 'gtk'
  depends_on 'pkgconfig'

  def self.build
    system "./configure $XORG_CONFIG"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
