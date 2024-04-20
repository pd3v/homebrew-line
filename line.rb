class Line < Formula
  desc "tiny command-line midi sequencer and language for live coding"
  homepage ""
  url "https://github.com/pd3v/line/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "cd2e09f2fd0aa43fbfef5d1c0ca9300765c21703e7e366e566c9f35c18144878"
  license "MIT"

  # depends_on "cmake" => :build
  depends_on "readline" => :recommended

  def install
    system "mkdir", "build"
    #system "mkdir", "bin"
    system "cmake", "-S", ".", "-B", "build/" , *std_cmake_args
    system "make", "-C", "build/"
    bin.install "build/line"
    ohai("Make some noise!")
  end
end
