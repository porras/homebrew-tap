class Crul < Formula
  desc "command-line HTTP client (alternative to curl) written in Crystal"
  homepage "https://github.com/porras/crul"
  url "https://github.com/porras/crul/archive/v0.4.2.tar.gz"
  sha256 "23ad4d583c61d3164e7e9bbe03fbea77b959ff14fc22a0c87910412bae2fb121"
  head "https://github.com/porras/crul.git"

  bottle do
    root_url "https://github.com/porras/crul/releases/download/v0.4.2"
    sha256 "6bf754dede6c9e1ba824b4cfb0bb82591713f8cf0dac56a75c85499c6e1516bb" => :el_capitan
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
