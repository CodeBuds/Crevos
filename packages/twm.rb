require 'package'

class Twm < Package
  version '1.3.21'
  source_url 'ftp://ftp.x.org/pub/individual/app/twm-1.0.9.tar.bz2'
  source_sha1 '59a6f076cdacb5f6945dac809bcf4906'

  def self.build
    system "sed -i -e '/^rcdir =/s,^\(rcdir = \).*,\1/etc/X11/app-defaults,' src/Makefile.in && ./configure $XORG_CONFIG && make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
