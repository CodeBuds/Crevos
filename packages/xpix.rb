require 'package'

class Xpix < Package
  version '0.1.1'
  source_url 'http://cairographics.org/releases/pixman-0.32.6.tar.gz'
  source_sha1 '3a30859719a41bd0f5cccffbfefdd4c2'

  depends_on 'buildessential'
  depends_on 'gtk'
  depends_on 'pkgconfig'

  def self.build
    system "sudo ./configure --prefix=/usr --disable-static"
    system "sudo make"
  end

  def self.install
    system "sudo make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
  end
end
