require 'package'

class Libxcb < Package
  version '0.1.1'
  source_url 'http://xcb.freedesktop.org/dist/libxcb-1.11.1.tar.bz2'
  source_sha1 'f97a65e6158775de518ac391935634c2'

  depends_on 'buildessential'

  def self.build
    system "./configure $XORG_CONFIG"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
