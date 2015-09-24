require 'package'

class Binutils < Package
  version '2.23.2'
  binary_url ({
    i686: 'https://dl.dropboxusercontent.com/s/u3cp7mpdyfx99ij/binutils-2.23.2-chromeos-i686.tar.gz?token_hash=AAGsFB9HXNb5tSAm_Wd2GyIUL59BkZYgMTHkj4CkHLxggg&dl=1',
    x86_64: 'https://dl.dropboxusercontent.com/s/mnu21v101rdbm8k/binutils-2.23.2-chromeos-x86_64.tar.gz?token_hash=AAEn4ngAJs-fpRUz1n1Q_2WKxQvQnPMwlgcEHBDKyLOpoA&dl=1'
  })
  binary_sha1 ({
    i686: 'a7edc9bdaf9fc72112fe6b370f158a9a1aee87ac',
    x86_64: '1c13b8f261e419a66b87f09653f3fbaf8449efe1'
  })
end
class Buildessential < Package
  version '1.0'
  
  is_fake
  
  depends_on 'gcc'
  depends_on 'make'
  depends_on 'linuxheaders'
end
class Curl < Package
  version '7.32.0'
  binary_url ({
    i686: 'https://dl.dropboxusercontent.com/s/h3x2iiy5ibi97vr/curl-7.32.0-chromeos-i686.tar.gz?token_hash=AAETu-MnNyBTCHQbkh4O817QbNK3wRLbAP_gQhjgNyFGtw&dl=1',
    x86_64: 'https://dl.dropboxusercontent.com/s/u2hmmd6wfz25qnn/curl-7.32.0-chromeos-x86_64.tar.gz?token_hash=AAGHjx6ATIsDW-Xi4pNUbCMknfWUa6GGQbAquWDkH1xzgg&dl=1'
  })
  binary_sha1 ({
    i686: 'af3abbae663884ed367c5b6b467ebb310052f53f',
    x86_64: '94766f554b195583040e31ce8e85846d8271ac11'
  })
end
class Expat < Package
  version '2.1.0'
  binary_url ({
    i686: 'https://dl.dropboxusercontent.com/s/jh5uw42elm40t9a/expat-2.1.0-chromeos-i686.tar.gz?token_hash=AAGYckE0KoTPsydZGG85KTkpr7Nt5U1OUs0egJ1K0iJ1mg&dl=1',
    x86_64: 'https://dl.dropboxusercontent.com/s/k89o1x1a3fwoamu/expat-2.1.0-chromeos-x86_64.tar.gz?token_hash=AAGBLOil45Zg7G2RlFlfDUxKfeDyTP3uUWjfBvGQrOjAYA&dl=1'
  })
  binary_sha1 ({
    i686: '9ab42ec03d06cc64d5d9944cb4cc7eaa61a0af84',
    x86_64: '3ac96a0e02c1117718d15bcd4976ef4bcef1a9ac'
  })
end
class Gcc < Package
  version '4.8.1-baseline'
  binary_url ({
    i686: "https://dl.dropboxusercontent.com/s/c06pcge8ogsqfcd/gcc-4.8.1-baseline-chromeos-i686.tar.gz?token_hash=AAFLnE_8iL_lAnGtAAVM5G_sYqejA44jGW8D9r0a8xCjrQ&dl=1",
    x86_64: "https://dl.dropboxusercontent.com/s/kk52ic170je87fc/gcc-4.8.1-baseline-chromeos-x86_64.tar.gz?token_hash=AAGcQBSj1y8OfHXUhsayxlFfvk4LRszY07ehx_Z6UoyNEg&dl=1"
  })
  binary_sha1 ({
    i686: "d720c9a804d26728d730b93748072ffa6df7ee3d",
    x86_64: "59932a73cd149ae82b4b5c277b734788c1efab44"
  })

  depends_on 'binutils'
  depends_on 'gmp'
  depends_on 'mpc'
  depends_on 'mpfr'
  depends_on 'glibc'
end
class Gettext < Package
  version '0.18.3.1'
  binary_url ({
    i686: 'https://dl.dropboxusercontent.com/s/xmsfr7q9r99dhcs/gettext-0.18.3.1-chromeos-i686.tar.gz?token_hash=AAGJo0pqudCOkGU3NHOcBuFG2zLwWpapNXLX-zUJLcS3aA&dl=1',
    x86_64: 'https://dl.dropboxusercontent.com/s/nidj0ehxwserhz6/gettext-0.18.3.1-chromeos-x86_64.tar.gz?token_hash=AAFn-kdXlB23HDVDCKTn9n_U-i9LFNCIB6HU0jSUiJTctA&dl=1'
  })
  binary_sha1 ({
    i686: '1ecbff59d6134c7f8804bcf18fb2b1b7a9a6d4c0',
    x86_64: '22174347defa4f034a360078c248a61710c5f854'
  })
end
class Git < Package
  version '1.8.4'
  binary_url ({
    i686: 'https://dl.dropboxusercontent.com/s/g3binxopw5nfky1/git-1.8.4-chromeos-i686.tar.gz?token_hash=AAEWnMNBfozSIzLD1unbYGJzT4FGkEfJmLFQ-3uzydfT_A&dl=1',
    x86_64: 'https://dl.dropboxusercontent.com/s/i7vs9wfk94tsrzt/git-1.8.4-chromeos-x86_64.tar.gz?token_hash=AAHyvjayN7THoxlryZaxQ2Ejm9xyD6bZCqXZM81hYRC8iQ&dl=1'
  })
  binary_sha1 ({
    i686: '8c1bf4bcffb0e9c17bf20dd05981e86ea34d5d65',
    x86_64: '067cb6c36616ac30999ab97e85f3dc0e9d1d57f4'
  })

  depends_on 'zlibpkg'
  depends_on 'libssh2'
  depends_on 'perl'
  depends_on 'curl'
  depends_on 'expat'
  depends_on 'gettext'
  depends_on 'python'
end
class Glibc < Package
  version '2.17.90-baseline'
  binary_url ({
    i686: "https://dl.dropboxusercontent.com/s/dic47f8eqxhpf89/glibc-2.17.90-baseline-chromeos-i686.tar.gz?token_hash=AAHx_77YtWLLnkjCJRaCJt7RsdKrfkT6lgKS9BZc4O-0Pg&dl=1",
    x86_64: "https://dl.dropboxusercontent.com/s/x3tu160i7pmn6tp/glibc-2.17-baseline-chromeos-x86_64.tar.gz?token_hash=AAG794JG65HjzHMcAyAysQUbEPMUci1bZJPREj3ztCtnBg&dl=1"
  })
  binary_sha1 ({
    i686: "3c3a0b86ed4591ec59daeb24d2dcda139574de1b",
    x86_64: "d818775f74d91692828f12321044cd95fc649cf0"
  })
end
class Gmp < Package
  version "5.1.2"
  binary_url ({
    i686: "https://dl.dropboxusercontent.com/s/9cwila1kaomsyl2/gmp-5.1.2-chromeos-i686.tar.gz?token_hash=AAHO9VxBpvXU2GPWBwimsp4hL8DADIItfNnIaFbfcyynMg&dl=1",
    x86_64: "https://dl.dropboxusercontent.com/s/zp1mw0l93jcg35e/gmp-5.1.3-chromeos-x86_64.tar.gz?token_hash=AAHa75_Uu5zFQlbQUbse19d_vhIAmEnZ8bYpshE6giSXGw&dl=1"
  })
  binary_sha1 ({
    i686: "b03b9508463588bfe9d09303c0725068cddd8810",
    x86_64: "2aee1fee1e4b98261127a4c73f3f88670f1c8162"
  })
end
class Libssh2 < Package
  version '1.4.3'
  binary_url ({
    i686: 'https://dl.dropboxusercontent.com/s/zjnild1c2i10h53/libssh2-1.4.3-chromeos-i686.tar.gz?token_hash=AAG_aZ7_dPKOiOMCMUiW2g3mLkz8UKHnGn5jLcDAGcNCIA&dl=1',
    x86_64: 'https://dl.dropboxusercontent.com/s/frzkbbnf35ie6ns/libssh2-1.4.3-chromeos-x86_64.tar.gz?token_hash=AAEk26mEOXT0MX05nM9gG6yNDPkL6KmLazRxKqQCR6qs8Q&dl=1'
  })
  binary_sha1 ({
    i686: '21b4b1a9608b12c0b3d1e6f0b6615f4a4152acb3',
    x86_64: '903aae8255c47c6052003837be132ff39582422b'
  })
end
class Linuxheaders < Package
  version '3.4.0'
  binary_url ({
    i686: "https://dl.dropboxusercontent.com/s/mdzdoyq7dtnz682/linux-headers-3.4.0-chromeos-i686.tar.gz?token_hash=AAE4yw5oH_SfZ3lAx02mFP603rnjmoB9Gp4vqTY14NsA-A&dl=1",
    x86_64: "https://dl.dropboxusercontent.com/s/3ec3fjpls0t2iqn/linuxheaders-3.8.11-chromeos-x86_64.tar.gz?token_hash=AAFl1_1I3FtwGdoGvGJuGrGUqzaDkhumPzsGJMX5pYhZyQ&dl=1"
  })
  binary_sha1 ({
    i686: "31c933f3a4e82fd9310b0f5b32d79c9a51514fee",
    x86_64: "c113e16d72147429f774ba6678d72a221b19a5bc"
  })
end
class Make < Package
  version '3.82'
  binary_url ({
    i686: "https://dl.dropboxusercontent.com/s/f6pg4bkg6m3vn7q/make-3.82-chromeos-i686.tar.gz?token_hash=AAHP__I3leN8BCLdP0pLbkNopoFGGhDuKX0sN-I6Zx4JYg&dl=1",
    x86_64: "https://dl.dropboxusercontent.com/s/t818zxgixti6wvl/make-3.82-chromeos-x86_64.tar.gz?token_hash=AAGLBxpwv2mZj7dAgnzdmfFcO8G28wbCfb0lPM8_qwRtSA&dl=1"
  })
  binary_sha1 ({
    i686: "ccb01c7358e5abdf8b06305eb31b1969b8b174f7",
    x86_64: "2bab91837440d101eb55129f41a7837101249b46"
  })
end
class Mpc < Package
  version '1.0.1'
  binary_url ({
    i686: "https://dl.dropboxusercontent.com/s/3o6uc8n4uy3oved/mpc-1.0.1-chromeos-i686.tar.gz?token_hash=AAH_OlvQWGUF7lyFhV3DXXgYRM1fupgKoHIwyiVmmVyWUQ&dl=1",
    x86_64: "https://dl.dropboxusercontent.com/s/qr1x2fr1z0af26o/mpc-1.0.1-chromeos-x86_64.tar.gz?token_hash=AAFGK8OM8sm4k02lBAudZg8olgKxs_HmieFFqU6MZZONOA&dl=1"
  })
  binary_sha1 ({
    i686: "f11c6e74e9059bf400b0978e6e05fe67c7f3dfe9",
    x86_64: "24c4be4ea026d2d6e432a0aa9edb6dd27cf3e7df"
  })
end
class Mpfr < Package
  version '3.1.2'
  binary_url ({
    i686: "https://dl.dropboxusercontent.com/s/lo9ks3g7ar3zpfu/mpfr-3.1.2-chromeos-i686.tar.gz?token_hash=AAH1GlLfYtUs4uxl1ayeGTBe8RJ5uTXzOAsXgSlv8G5rrA&dl=1",
    x86_64: "https://dl.dropboxusercontent.com/s/ev2a1yha3gm1hwy/mpfr-3.1.2-chromeos-x86_64.tar.gz?token_hash=AAErYQPCHkhALqnX4Y0LjATZITtD2qoKNbkdn67LOmRVRQ&dl=1"
  })
  binary_sha1 ({
    i686: "eb81b9bb83ebb43b94ab33e43293f1df3bcbad7c",
    x86_64: "a80c48bee7e6e8ddcd1771c4fd7708d89f2abb9c"
  })
end
class Perl < Package
  version '5.16.3'
  binary_url ({
    i686: 'https://dl.dropboxusercontent.com/s/qwbwhvqed0yyv3l/perl-5.16.3-chromeos-i686.tar.gz?token_hash=AAHjq1OrZ3iNYerA9y6QIPtsn3fOnW5QeIFbYlBbBN-OkA&dl=1',
    x86_64: 'https://dl.dropboxusercontent.com/s/gg2q9tsvy2ybf80/perl-5.18.1-chromeos-x86_64.tar.gz?token_hash=AAFbAeYB604esg7FRBM_TeBh2hiDg2Bw8eZfPHFH8zCdHw&dl=1'
  })
  binary_sha1 ({
    i686: 'e2a8c5280b8a4abec70256f41d5e5b04253d6796',
    x86_64: '5bf7c1762499a40f2ce8684be6f5699c6a4658e1'
  })
end
class Python < Package
  version '3.3.2'
  binary_url ({
    i686: 'https://dl.dropboxusercontent.com/s/mxgfmq992hhiawk/python-3.3.2-chromeos-i686.tar.gz?token_hash=AAFA2YzFp293uyV3zYfP70iwCk8oH9HCLKMTrK0dtMU8GQ&dl=1',
    x86_64: 'https://dl.dropboxusercontent.com/s/r1zvmza51hrr87q/python-3.3.2-chromeos-x86_64.tar.gz?token_hash=AAHIdz6pWcOrfty7C8ACuRcLDq0d0ERYs0jCgOPLn5USUQ&dl=1'
  })
  binary_sha1 ({
    i686: 'a985a4bba243b4fa701db302dc2fa554aef76f1c',
    x86_64: 'fbfe0946c2f9191bd6110705994d459e373a8b09'
  })
end
class Readline < Package
  version '6.2'

  binary_url({
    x86_64: "https://dl.dropboxusercontent.com/s/v8xva6e4u3tvkaw/readline-6.2-chromeos-x86_64.tar.gz?token_hash=AAHOv1kLiv7xzDkYEZCSB_3ShK0n_7B4m2dNGHPnn2fZIg&dl=1"
  })
  binary_sha1({
    x86_64: '621c2538b452be33cca507110ccfd4144c61edd2'
  })
  
  depends_on 'buildessential' #until binary for i686 provided

  def self.build
    system "./configure"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
class Ruby < Package
  version '2.0.0p247-chromeos1'
  binary_url ({
    i686: "https://dl.dropboxusercontent.com/s/tufbuqcn80ubypx/ruby-2.0.0p247-chromeos-i686.tar.gz?token_hash=AAGu_5wuqZe2eDOkfL5oh4esQ8HAZJIvbMG7GplnQrSa3g&dl=1",
    x86_64: "https://www.dropbox.com/s/x3jt0z5i1r4afyv/ruby-2.0.0p247-chromeos-x86_64.tar.gz?dl=1"
  })
  binary_sha1 ({
    i686: "49eeba5d542e4c3e6aa3686f215485e0946fb99a",
    x86_64: "ec4d9c9d1a993ca03d0dee594c79ab1945e5b88d"
  })

  depends_on 'readline'
  depends_on 'zlibpkg'
end
class Zlibpkg < Package
  version '1.2.8'
  binary_url ({
    i686: 'https://dl.dropboxusercontent.com/s/ljhhvr12u1izayj/zlib-1.2.8-chromeos-i686.tar.gz?token_hash=AAEABTatYkxOOybZGoCj3Kg_DKEbFbSfolzZklfHwCsP_A&dl=1',
    x86_64: 'https://dl.dropboxusercontent.com/s/h4lqj0rnand0jqu/zlib-1.2.8-chromeos-x86_64.tar.gz?token_hash=AAGabAMhX4CGpzhpkcuKMmmWPxFZDiNOC-r9B0o7x4D7eQ&dl=1'
  })
  binary_sha1 ({
    i686: 'e02974780bfb3bf46940183043d15897a765ab4e',
    x86_64: 'cb764e22b68b7e2884372708b5b585d11efca972'
  })
end
