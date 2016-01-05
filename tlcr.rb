class Tlcr < Formula
  desc "Simple terminal-based client for TLDR pages, written in Crystal"
  homepage "https://github.com/porras/tlcr"
  url "https://github.com/porras/tlcr/archive/0.2.1.tar.gz"
  sha256 "224e3818abad044cd65330b06e88d4730cbcc2c1b90fba48aa2f55d3f59e37e6"
  head "https://github.com/porras/tlcr.git"

  bottle do
    root_url "https://github.com/porras/tlcr/releases/download/0.2.1"
    sha256 "b7f7718aa6896e767b841129eeed5c008989ebfb31090fb0fa817cd90037c0d8" => :yosemite
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
