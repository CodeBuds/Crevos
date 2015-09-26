require 'package'

class Libevdev < Package
  version '0.1.1'
  source_url 'http://www.freedesktop.org/software/libevdev/libevdev-1.4.4.tar.xz'
  source_sha1 'b66443bb664cfaf2ba7b3f8c238ea951'

  depends_on 'buildessential'

  def self.build
    system "./configure $XORG_CONFIG"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
