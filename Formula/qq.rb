class Qq < Formula
  desc "Multi-tool structured format processor for query and transcoding"
  homepage "https://github.com/jfryy/qq"
  url "https://github.com/jfryy/qq/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "5c8a2ed6c93b79ae43d654cb4d7b2f4ca70db66899d6adecf74cd6ea83ba1601"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.3.0/qq-v0.3.0-darwin-amd64.tar.gz"
      sha256 "31741bb5608bae8b4431a0b820c522c404f2a3771ee416db7c7c008aea59339c"
    elsif Hardware::CPU.arm?
      url "https://github.com/JFryy/qq/releases/download/v0.3.0/qq-v0.3.0-darwin-arm64.tar.gz"
      sha256 "53d877a075d6b9904792a8c34261b92885ad7957f39299d84f1a1dc5eb3b6d13"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.3.0/qq-v0.3.0-linux-amd64.tar.gz"
      sha256 "e7f56420ba8b9032f3d2466d39b8fce2368a405432324813813d0cfdeac979da"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JFryy/qq/releases/download/v0.3.0/qq-v0.3.0-linux-arm64.tar.gz"
      sha256 "45e0d892396f289e0c9fc921202e00af9d68a71a2075e8cacc3d64decc6eac65"
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
