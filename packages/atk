require 'package'

class Atk < Package
  version '0.1.1'
  source_url 'https://download.gnome.org/sources/atk/2.18/atk-2.18.0.tar.xz'
  source_sha1 'ce6c48d77bf951083029d5a396dd552d836fff3c1715d3a7022e917e46d0c92b'
  
  def self.build
    system "sudo ./configure"
    system "sudo make"
  end
  
  def self.install
    system "sudo make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
  end
end
