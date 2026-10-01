class Qq < Formula
  desc "Multi-tool structured format processor for query and transcoding"
  homepage "https://github.com/JFryy/qq"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.4.0/qq-v0.4.0-darwin-amd64.tar.gz"
      sha256 "0bccf0821f43dce03aa8ac674b3826a6502709c829d5e19d37a6b967bfb539f0"
    elsif Hardware::CPU.arm?
      url "https://github.com/JFryy/qq/releases/download/v0.4.0/qq-v0.4.0-darwin-arm64.tar.gz"
      sha256 "fcbbe382d29f60a52cb6a63fad675666fa8b06c36445701001c64eeb696d679b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.4.0/qq-v0.4.0-linux-amd64.tar.gz"
      sha256 "38478a53ffbc343f64b7c41a7599767e51a92359d25fffa12c495d235317cd6d"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JFryy/qq/releases/download/v0.4.0/qq-v0.4.0-linux-arm64.tar.gz"
      sha256 "498a31d18c46ff92e1870340fcb32ccb5130f399d770eadcf1df63ab09512aa4"
    end
  end

  def install
    bin.install "qq"
  end

  test do
    (testpath/"test.json").write('{"somekey": "somevalue"}')
    assert_equal "somevalue", shell_output("cat test.json | #{bin}/qq .somekey -r").strip
    assert_match version.to_s, shell_output("#{bin}/qq --version")
  end
end
