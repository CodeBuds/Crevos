require 'package'

class WgetNew < Package
  version '1.16.3'
  source_url 'ftp://ftp.gnu.org/gnu/wget/wget-1.16.3.tar.xz'
  source_sha1 'd2e4455781a70140ae83b54ca594ce21'
  
  def self.build
    system "sudo ./configure --prefix=/usr      \
            --sysconfdir=/etc"
    system "sudo make"
  end
  
  def self.install
    system "sudo make install"
  end
end
