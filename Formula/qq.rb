class Qq < Formula
  desc "Multi-tool structured format processor for query and transcoding"
  homepage "https://github.com/jfryy/qq"
  url "https://github.com/jfryy/qq/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "cdcc643f4ffbda46a9092413193eebfda4cd2894642749ae1be3e9b009c20889"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.2.4/qq-v0.2.4-darwin-amd64.tar.gz"
      sha256 "cd6448f0511b1d91d0b48f1ac9ce703e769faa0f839b6ab0539b6aafb33ab89c"
    elsif Hardware::CPU.arm?
      url "https://github.com/JFryy/qq/releases/download/v0.2.4/qq-v0.2.4-darwin-arm64.tar.gz"
      sha256 "b78ba7bfda3a9e826e9bd651b0d953bd148d16246743d0576b3ddcd3b9cf42bb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.2.4/qq-v0.2.4-linux-amd64.tar.gz"
      sha256 "162287b4e8c6ab208f0234efdb0f2e95909d8955050b2847ced6d1114db45ead"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JFryy/qq/releases/download/v0.2.4/qq-v0.2.4-linux-arm64.tar.gz"
      sha256 "1e99f6cbe145e72fb01c9263e98a65aaadce3c87fb56bb349a861cc48102568c"
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
