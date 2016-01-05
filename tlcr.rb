class Tlcr < Formula
  desc "Simple terminal-based client for TLDR pages, written in Crystal"
  homepage "https://github.com/porras/tlcr"
  url "https://github.com/porras/tlcr/archive/0.2.0.tar.gz"
  sha256 "93309d20e476486a4e5a283eac6ebd4d9b902c03c88ef4b6d86f327a5c9033ac"
  head "https://github.com/porras/tlcr.git"

  bottle do
    root_url "https://github.com/porras/tlcr/releases/download/0.2.0"
    sha256 "71d01f970a78f3f176532c25cfecb74d42211b38822023ef0de4904f6e99b9b8" => :yosemite
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
