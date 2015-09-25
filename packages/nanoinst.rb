equire 'package'

class Diffutils < Package
  version '3.3'
  source_url 'ftp://ftp.gnu.org/gnu/diffutils/diffutils-3.3.tar.xz'
  source_sha1 '6463cce7d3eb73489996baefd0e4425928ecd61e'

  depends_on "libsigsegv"

  def self.build
    system "sed -i -e '/gets is a/d' lib/stdio.in.h"  # fixes an error, credit to http://www.linuxfromscratch.org/lfs/view/7.3/chapter05/diffutils.html
    system "sed -i 's:= @mkdir_p@:= /bin/mkdir -p:' po/Makefile.in.in" # http://www.linuxfromscratch.org/lfs/view/development/chapter06/diffutils.html

    system "./configure --prefix=/usr/local"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end

class Ncurses < Package
  version '5.9'
  source_url 'ftp://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz'
  source_sha1 '3e042e5f2c7223bffdaac9646a533b8c758b65b5'

  depends_on "diffutils"

  def self.build
    system "./configure CFLAGS=\" -fPIC\" --without-debug --prefix=/usr/local"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end

class Ncurses_so < Package
  version '5.9'
  source_url 'ftp://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz'
  source_sha1 '3e042e5f2c7223bffdaac9646a533b8c758b65b5'

  depends_on "ncurses"

  def self.build
    system "./configure --prefix=/usr/local \"CFLAGS= -fPIC\" --without-debug --without-normal --with-shared"
    system "make"
  end

  def self.install
    out = "#{CREW_DEST_DIR}/usr/local/lib"
    system "mkdir -p #{out}"
    ["form", "menu", "ncurses", "panel"].each do |lib|
      system "cp", "lib/lib#{lib}.so.5.9", out
      FileUtils.cd(out) do
        system "ln -s lib#{lib}.so.5.9 lib#{lib}.so"
        system "ln -s lib#{lib}.so.5.9 lib#{lib}.so.5"
      end
    end
    FileUtils.cd(out) do
      system "ln -s libncurses.so.5.9 libtinfo.so.5.9"
      system "ln -s libncurses.so.5 libtinfo.so.5"
      system "ln -s libncurses.so libtinfo.so"
    end
  end
end

class Nano < Package
  version '2.3.6'
  source_url 'ftp://ftp.gnu.org/pub/gnu/nano/nano-2.3.6.tar.gz' # software source tarball url  
  source_sha1 '7dd39f21bbb1ab176158e0292fd61c47ef681f6d'

  depends_on 'buildessential'
  depends_on 'ncurses' 
  
  def self.build                                                  # self.build contains commands needed to build the software from source
    system "./configure CPPFLAGS=\"-I/usr/local/include/ncurses\""
    system "make"                                                 # ordered chronologically
  end
  
  def self.install                                                # self.install contains commands needed to install the software on the target system
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"          # remember to include DESTDIR set to CREW_DEST_DIR - needed to keep track of changes made to system
  end         
end
