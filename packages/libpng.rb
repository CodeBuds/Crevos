require 'package'

class Xlibpng < Package
  version '0.1.1'
  source_url 'http://downloads.sourceforge.net/libpng/libpng-1.6.18.tar.xz'
  source_sha1 '6a57c8e0f5469b9c9949a4b43d57b3a1'

  depends_on 'buildessential'
  depends_on 'gtk'
  depends_on 'pkgconfig'

  def self.build
    system "./configure --prefix=/usr --disable-static"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
    system "mkdir -v /usr/share/doc/libpng-1.6.18 && cp -v README libpng-manual.txt /usr/share/doc/libpng-1.6.18"
  end
end
