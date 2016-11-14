class Tlcr < Formula
  desc "Simple terminal-based client for TLDR pages, written in Crystal"
  homepage "https://github.com/porras/tlcr"
  url "https://github.com/porras/tlcr/archive/0.3.1.tar.gz"
  sha256 "33a60954258c016272f0bd4d8fe041409ad4854db284706d798e726ed8d32672"
  head "https://github.com/porras/tlcr.git"

  bottle do
    root_url "https://github.com/porras/tlcr/releases/download/0.3.1"
    sha256 "09fe66c483dbe8ac6850c39d3977c4d436317364dbe41caf64d58781ea6c431c" => :el_capitan
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
    system "tlcr", "--version"
  end
end
