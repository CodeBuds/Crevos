require 'package'

class Fontconfig < Package
  version '0.1.1'
  source_url 'http://www.freedesktop.org/software/fontconfig/release/fontconfig-2.11.1.tar.bz2'
  source_sha1 '824d000eb737af6e16c826dd3b2d6c90'
  
  depends_on 'freetype'

  def self.build
    system "sudo ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-docs --docdir=/usr/share/doc/fontconfig-2.11.1"
    system "sudo make"
  end

  def self.install
    system "sudo make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
  end
end
