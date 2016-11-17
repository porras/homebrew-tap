class Tlcr < Formula
  desc "Simple terminal-based client for TLDR pages, written in Crystal"
  homepage "https://github.com/porras/tlcr"
  url "https://github.com/porras/tlcr/archive/0.3.1.tar.gz"
  sha256 "33a60954258c016272f0bd4d8fe041409ad4854db284706d798e726ed8d32672"
  head "https://github.com/porras/tlcr.git"

  bottle do
    rebuild 1
    root_url "https://github.com/porras/tlcr/releases/download/0.3.1"
    sha256 "7b7d62d06b5d4ace90f202e5a1060abec20be5bc8225f39957af6ad6ff88a5c0" => :el_capitan
  end

  depends_on "crystal-lang" => :build
  depends_on "libevent"
  depends_on "bdw-gc"

  def install
    system "shards"
    system "crystal", "build", "--release", "tlcr.cr"
    system "./tlcr --completion > tlcr-completion"

    bin.install "tlcr"
    doc.install "LICENSE"
    bash_completion.install "tlcr-completion"
  end

  test do
    system "tlcr", "--version"
  end
end
