class Tlcr < Formula
  desc "Simple terminal-based client for TLDR pages, written in Crystal"
  homepage "https://github.com/porras/tlcr"
  url "https://github.com/porras/tlcr/archive/0.1.1.tar.gz"
  sha256 "6ed81377a751b2679e2052be6e88b9b15a5feda59eb9bb024a1eefbee7b99295"
  head "https://github.com/porras/tlcr.git"

  bottle do
    root_url "https://github.com/porras/tlcr/releases/download/0.1.1"
    sha256 "5c464967d69a51185abdb99ff23a39f659f37a510a89f0c27617f5c43bfa0772" => :yosemite
  end

  depends_on "crystal-lang" => :build
  depends_on "openssl"
  depends_on "libevent"
  depends_on "libpcl"
  depends_on "bdw-gc"

  def install
    system "shards"
    system "crystal", "build", "--release", "tlcr.cr"
    bin.install "tlcr"
    doc.install "LICENSE"
  end

  test do
    system "tlcr", "--completion"
  end
end
