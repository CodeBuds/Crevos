require 'package'

class Xcbutilimage < Package
  version '0.1.1'
  source_url 'https://github.com/anholt/libepoxy/releases/download/v1.3.1/libepoxy-1.3.1.tar.bz2'
  source_sha1 '96f6620a9b005a503e7b44b0b528287d'

  def self.build
    system "sudo ./configure --prefix=/usr"
    system "sudo make"
  end

  def self.install
    system "sudo make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
  end
end
