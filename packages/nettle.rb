require 'package'

class Nettle < Package
  version '0.1.1'
  source_url 'ftp://ftp.gnu.org/gnu/nettle/nettle-3.1.1.tar.gz'
  source_sha1 'b40fa88dc32f37a182b6b42092ebb144'
  
  def self.build
    system "sudo ./configure --prefix=/usr"
    system "sudo make"
  end
  
  def self.install
    system "sudo make install &&
chmod   -v   755 /usr/lib/lib{hogweed,nettle}.so &&
install -v -m755 -d /usr/share/doc/nettle-3.1.1  &&
install -v -m644 nettle.html /usr/share/doc/nettle-3.1.1"
  end
end
