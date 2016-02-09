class Crul < Formula
  desc "command-line HTTP client (alternative to curl) written in Crystal"
  homepage "https://github.com/porras/crul"
  url "https://github.com/porras/crul/archive/v0.4.0.tar.gz"
  sha256 "67b93b9025686d286184fed3b55b6942ebd48ce9095fb5456a44c9984959cfc3"

  depends_on "crystal-lang" => :build
  depends_on "openssl"

  def install
    system "crystal", "deps"
    system "crystal", "build", "--release", "crul.cr"
    bin.install "crul"
    doc.install "LICENSE.txt"
  end

  test do
    system "crul", "--completion"
  end
end
