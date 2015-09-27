require 'package'

class Pango < Package
  version '0.1.1'
  source_url 'http://ftp.gnome.org/pub/GNOME/sources/pango/1.38/pango-1.38.0.tar.xz'
  source_sha1 '1d4e75974bad853ee9ac5fc5caee5e7ab235abbd945d51d01f3806e04e7c226c'
  
  def self.build
    system "sudo ./configure --prefix=/usr --sysconfdir=/etc"
    system "sudo make"
  end
  
  def self.install
    system "sudo make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
    system "sudo pango-querymodules --update-cache"
  end
end
