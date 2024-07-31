class Qq < Formula
  desc "Multi-tool structured format processor for query and transcoding"
  homepage "https://github.com/jfryy/qq"
  url "https://github.com/jfryy/qq/archive/refs/tags/v0.2.1-re.tar.gz"
  sha256 "8b568ee47c091a1e70693b0e9ca5175bbc2edf5f5359a173a40d6d1b7be0b957"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.2.1-re/qq-v0.2.1-re-darwin-amd64.tar.gz"
      sha256 "f7403919068014736ae36e19092668409a6b84ae1cf817f0fa424807e4a2e2bc"
    elsif Hardware::CPU.arm?
      url "https://github.com/JFryy/qq/releases/download/v0.2.1-re/qq-v0.2.1-re-darwin-arm64.tar.gz"
      sha256 "c015c196032865559eea47d7346a142924eefde0c6599924ab03f53e105d2350"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.2.1-re/qq-v0.2.1-re-linux-amd64.tar.gz"
      sha256 "1aa7a1ee4712f7142b9202babf72ebb5c5216c1f484dd9c83f1174a05c5a3d10"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JFryy/qq/releases/download/v0.2.1-re/qq-v0.2.1-re-linux-arm64.tar.gz"
      sha256 "c912bacc62be17529fcfa0f0d667b99f2ab0a191e9794acedc7b3c6ebbfe4fb1"
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
