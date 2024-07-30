class Qq < Formula
  desc "Multi-tool structured format processor for query and transcoding"
  homepage "https://github.com/jfryy/qq"
  url "https://github.com/jfryy/qq/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "08b08072b9744103af7ec1447a8976464f69faaf04715f31b3efd4cb8da3adc5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.2.2/qq-v0.2.2-darwin-amd64.tar.gz"
      sha256 "0558946c788a67eab90a71cd25d12102a6018e6d76eea4f8f56d5cc48f86f61d"
    elsif Hardware::CPU.arm?
      url "https://github.com/JFryy/qq/releases/download/v0.2.2/qq-v0.2.2-darwin-arm64.tar.gz"
      sha256 "c1b6f7feb8a60e0ab0dcf7b18624b9323936055675df319c533f1e38a5c8c64c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.2.2/qq-v0.2.2-linux-amd64.tar.gz"
      sha256 "776b1e38aab2792cb7824b8cd77299f484481f28b64d7f15da86cb49f7a2a9e2"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JFryy/qq/releases/download/v0.2.2/qq-v0.2.2-linux-arm64.tar.gz"
      sha256 "0d6ba30c27c477e4954bf8d24865268dc65c07d2da3f6dd5cee862f83383da2b"
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
