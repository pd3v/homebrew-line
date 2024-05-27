class LineAT062 < Formula
  desc "tiny command-line midi sequencer and language for live coding music. < ableton link compatible >"
  homepage "https://github.com/pd3v/line"
  #url "https://github.com/pd3v/line/archive/refs/tags/v0.6.2.tar.gz"
  head "https://github.com/pd3v/line", :branch => "ableton_link_integration"
  sha256 "3a380903d4abb79dd889c3e3d5d380563c01f1b1530ef6258c65223d6d34364c"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "readline" => :recommended

  def install
    #system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "mkdir", "build"
    system "mkdir", "bin"
    system "cmake", "-S", ".", "-B", "build/" , *std_cmake_args
    #system "make", "-C", "build/"
    bin.install "line"
    #system "./build.sh"  
    ohai("Make some noise!")
  end
end