require 'package'

class Xterm < Package
  version '0.1.1'
  source_url 'ftp://invisible-island.net/xterm/xterm-320.tgz'
  source_sha1 '0d7f0e6390d132ae59876b3870e5783d'

  def self.build
    system "sed -i '/v0/{n;s/new:/new:kb=^?:/}' termcap && printf '\tkbs=\\177,\n' >> terminfo && TERMINFO=/usr/share/terminfo ./configure $XORG_CONFIG --with-app-defaults=/etc/X11/app-defaults"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install && make install-ti"
  end
end
