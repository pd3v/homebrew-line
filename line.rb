class Line < Formula
  desc "tiny command-line midi sequencer and language for live coding. ableton link compatible."
  homepage "https://github.com/pd3v/line"
  head "https://github.com/pd3v/line.git"
  #, :branch => :ableton_link_integration
  #url "https://github.com/pd3v/line/archive/refs/tags/v0.6.1.tar.gz"
  #sha256 "cd2e09f2fd0aa43fbfef5d1c0ca9300765c21703e7e366e566c9f35c18144878"
  #license "MIT"
  #url "https://github.com/thestk/rtmidi.git", tag: "2.1.1", revision: "b45dae2d3a9e3aae819ade3e5a53504d601e05dd"
  #url "https://github.com/thestk/rtmidi.git", tag: "2.1.1", revision: "a94e7828f93b9fbf109d3f2d1028ddc097dd20cf"
  #url "https://github.com/Ableton/link.git", tag: "Link-3.1.0", revision: "e55789a3f665de4416dc4809e4a8934266110ffd"

  depends_on "cmake"  =>  :build
  #depends_on "readline" =>  :recommended
  depends_on "readline" =>  :optional
  #depends_on "rtmidi" =>  :build
  #depends_on "link" =>  :build

  def install
    system "mkdir", "build"
    #system "mkdir", "bin"
    system "cmake", "-S", ".", "-B", "build/" , *std_cmake_args
    system "make", "-C", "build/"
    bin.install "build/line"
    ohai("Make some noise!")
  end
end
