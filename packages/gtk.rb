require 'package'

class Gtk < Package
  version '0.1.1'
  source_url 'http://ftp.gnome.org/pub/gnome/sources/gtk+/3.16/gtk+-3.16.0.tar.xz'
  source_sha1 'ce617318fe18092383cf6ed5d8c688a95a97f2d4c68481317a6a531e288c26ea'
  
  depends_on 'pkgconfig'
  
  def self.build
    system "./configure --prefix=/opt/gtk"
    system "sudo make"
  end
  
  def self.install
    system "sudo make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
  end
end
