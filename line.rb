class Line < Formula
  desc "Tiny command-line midi sequencer and language for live coding music. ableton link compatible"
  homepage "https://github.com/pd3v/line"
  url "https://github.com/pd3v/line.git",
  tag: "v0.6.2"
 
  sha256 "3a380903d4abb79dd889c3e3d5d380563c01f1b1530ef6258c65223d6d34364c"
  license "MIT"

  # depends_on "rtmidi" => :recommended
  depends_on "readline" => :recommended
  depends_on "cmake" => :build
  
  def install
    #system "./configure", "--disable-silent-rules", *std_configure_args
    system "mkdir", "build"
    system "mkdir", "bin"
    system "cmake", "-S", ".", "-B", "build/" , *std_cmake_args
    system "make", "-C", "build/"

    on_macos do
      lib.install "build/externals/lpeg/liblpeg.dylib"
      lib.install "build/externals/lua/liblua.dylib"
      lib.install "build/externals/rtmidi/librtmidi.dylib"
    end
    on_linux do
      lib.install "build/externals/lpeg/liblpeg.so"
      lib.install "build/externals/lua/liblua.so"
      lib.install "build/externals/rtmidi/librtmidi.so"
    end
    bin.install "build/line"
  
    ohai("Make some noise!")
  end
end