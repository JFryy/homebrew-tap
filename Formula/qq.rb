class Qq < Formula
  desc "Multi-tool structured format processor for query and transcoding"
  homepage "https://github.com/jfryy/qq"
  url "https://github.com/jfryy/qq/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "efc6d539777ecb642ba6986380a1222756acb8402b4b58f02582f00ca1e58744"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.2.0/qq-v0.2.0-darwin-amd64.tar.gz"
      sha256 "9d973d1b3070b5c9cd7b2d7bd462ec059acb7eb7d489b24f821d6fc04c9c90fd"
    elsif Hardware::CPU.arm?
      url "https://github.com/JFryy/qq/releases/download/v0.2.0/qq-v0.2.0-darwin-arm64.tar.gz"
      sha256 "12aeb93963cbf2b1a85e0b0f176d13d834f583383e533660e1107d09d2195b21"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.2.0/qq-v0.2.0-linux-amd64.tar.gz"
      sha256 "bcea0ec4c9eaad44930588d5d899eeda5367b90e4b404934ecf81ea13a10111b"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JFryy/qq/releases/download/v0.2.0/qq-v0.2.0-linux-arm64.tar.gz"
      sha256 "727c4f0b92251f49c91167eda0ce545369ab344d8ac4f10acdd760061649c513"
    end
  end

  def install
    bin.install "qq"
  end

  test do
    (testpath/"test.json").write('{"somekey": "somevalue"}')
    assert_equal "somevalue", shell_output("cat test.json | \#{bin}/qq .somekey -r").strip
  end
end
