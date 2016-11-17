class Crul < Formula
  desc "command-line HTTP client (alternative to curl) written in Crystal"
  homepage "https://github.com/porras/crul"
  url "https://github.com/porras/crul/archive/v0.4.1.tar.gz"
  sha256 "c9ef775560e04e7125cf8f6123846d563f09e4ae2e56e6d036694896521c57fd"
  head "https://github.com/porras/crul.git"

  bottle do
    root_url "https://github.com/porras/crul/releases/download/v0.4.1/"
    sha256 "230777e48c3431a8639232c3a5087ee97d63209f3c95568e72208d294a00f7a9" => :el_capitan
  end

  depends_on "crystal-lang" => :build
  depends_on "libevent"
  depends_on "bdw-gc"

  def install
    system "crystal", "deps"
    system "crystal", "build", "--release", "crul.cr"
    system "./crul --completion > crul-completion"

    bin.install "crul"
    doc.install "LICENSE.txt"
    bash_completion.install "crul-completion"
  end

  test do
    system "crul", "--version"
  end
end
