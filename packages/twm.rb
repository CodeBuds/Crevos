require 'package'

class Graphicsmagick < Package
  version '1.3.21'
  source_url 'ftp://ftp.x.org/pub/individual/app/twm-1.0.9.tar.bz2'
  source_sha1 '59a6f076cdacb5f6945dac809bcf4906'

  depends_on 'buildessential'
  depends_on 'gtk'
  depends_on 'pkgconfig'

  def self.build
    system "./configure"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
