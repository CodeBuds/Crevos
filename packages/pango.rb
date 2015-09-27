require 'package'

class Pango < Package
  version '0.1.1'
  source_url 'ftp://ftp.gnome.org/pub/gnome/sources/pango/1.36/pango-1.36.8.tar.xz'
  source_sha1 '217a9a753006275215fa9fa127760ece'
  
  def self.build
    system "sudo ./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/local/lib64/ CC=\"gcc -m64\" CFLAGS=\" -fPIC\""
    system "sudo make"
  end
  
  def self.install
    system "sudo make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
    #system "sudo pango-querymodules --update-cache"
  end
end
