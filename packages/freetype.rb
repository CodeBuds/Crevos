require 'package'

class Freetype < Package
  version '0.1.1'
  source_url 'http://downloads.sourceforge.net/freetype/freetype-2.6.tar.bz2'
  source_sha1 '5682890cb0267f6671dd3de6eabd3e69'

  def self.build
    system "sudo sed -i  -e \"/AUX.*.gxvalid/s@^# @@"+" -e"+"/AUX.*.otvalid/s@^# @@\" modules.cfg && sudo sed -ri -e 's:.*(#.*SUBPIXEL.*) .*:\1:' include/config/ftoption.h && sudo ./configure --prefix=/usr --disable-static"
    system "sudo make"
  end

  def self.install
    system "sudo make", "DESTDIR=#{CREVOS_DEST_DIR}", "install && sudo install -v -m755 -d /usr/share/doc/freetype-2.6 && cp -v -R docs/*     /usr/share/doc/freetype-2.6"
  end
end
