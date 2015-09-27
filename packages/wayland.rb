require 'package'

class Atk < Package
  version '0.1.1'
  source_url 'http://wayland.freedesktop.org/releases/wayland-1.8.1.tar.xz'
  source_sha1 '6e877877c3e04cfb865cfcd0733c9ab1'
  
  def self.build
    system "sudo ./configure --prefix=/usr    \
            --disable-static \
            --disable-documentation"
    system "sudo make"
  end
  
  def self.install
    system "sudo make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
  end
end
