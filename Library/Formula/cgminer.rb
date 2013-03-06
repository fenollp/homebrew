require 'formula'

class Cgminer < Formula
  homepage 'https://github.com/ckolivas/cgminer'
  url 'https://github.com/ckolivas/cgminer/archive/v2.11.0.tar.gz'
  sha1 '56f7d2bed9b51a3a9b6cafacb09c10de552f5e82'
  version '2.11'

  depends_on 'automake' => :build
  depends_on 'curl' => :build
  depends_on 'c-ares' => :build
  depends_on 'libusb'
  depends_on 'pkg-config' => :build

  def install
    ENV['NOCONFIGURE'] = '1'

    system "./autogen.sh"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
    "--prefix=#{prefix}", "--enable-cpumining"
    system "make install"
  end
end
