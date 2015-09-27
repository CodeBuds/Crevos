require 'package'

class Pkgconfig < Package
  version '0.28'
  source_url 'http://pkgconfig.freedesktop.org/releases/pkg-config-0.28.tar.gz'
  source_sha1 '71853779b12f958777bffcb8ca6d849b4d3bed46'

  def self.build
      system "./configure"
      system "sudo make"
  end

  def self.install
    system "sudo make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
  end
end
