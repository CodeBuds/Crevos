require 'package'

class Libffi < Package
  version '0.1.1'
  source_url 'ftp://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz'
  source_sha1 '83b89587607e3eb65c70d361f13bab43'

  def self.build
    system "sudo sed -e '/^includesdir/ s/$(libdir).*$/$(includedir)/' \
    -i include/Makefile.in && sudo sed -e '/^includedir/ s/=.*$/=@includedir@/' \
    -e 's/^Cflags: -I${includedir}/Cflags:/' \
    -i libffi.pc.in && sudo ./configure --prefix=/usr --disable-static"
    system "sudo make"
  end

  def self.install
    system "sudo make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
  end
end
