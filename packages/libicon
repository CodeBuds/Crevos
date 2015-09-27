require 'package'

class Libicon < Package
  version '0.1.1'
  source_url 'http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.14.tar.gz'
  source_sha1 'ce617318fe18092383cf6ed5d8c688a95a97f2d4c68481317a6a531e288c26ea'
  
  def self.build
    system "sudo ./configure --prefix=/usr/local"
    system "sudo make"
  end
  
  def self.install
    system "sudo make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
  end
end
