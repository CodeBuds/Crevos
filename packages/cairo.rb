require 'package'

class Cairo < Package
  version '1.14.2'
  source_url 'http://cairographics.org/releases/cairo-1.14.2.tar.xz'
  source_sha1 'e1cdfaf1c6c995c4d4c54e07215b0118'

  def self.build
    system "sudo ./configure --prefix=/usr    \
            --disable-static \
            --enable-tee"
    system "sudo make"
  end

  def self.install
    system "sudo make", "DESTDIR=#{CREVOS_DEST_DIR}", "install"
  end
end
