require 'package'

class Xfonts < Package
  version '0.1.1'
  source_url 'ftp://ftp.x.org/pub/individual/font/'
  source_sha1 '23756dab809f9ec5011bb27fb2c3c7d6'

  depends_on 'buildessential'

  def self.build
    system "./configure"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
