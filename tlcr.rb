class Tlcr < Formula
  desc "Simple terminal-based client for TLDR pages, written in Crystal"
  homepage "https://github.com/porras/tlcr"
  url "https://github.com/porras/tlcr/archive/0.3.0.tar.gz"
  sha256 "d0f8be0b5d85fe0ed9587da4d32bdf7c8c401014bca83200aa8833f64d40b0c9"
  head "https://github.com/porras/tlcr.git"

  bottle do
    root_url "https://github.com/porras/tlcr/releases/download/0.3.0"
    sha256 "6f434710fa787ab90da18d27ac811d0307552c4753e5a6c679689ba8c7a38b1e" => :yosemite
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
