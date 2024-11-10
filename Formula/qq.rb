class Qq < Formula
  desc "Multi-tool structured format processor for query and transcoding"
  homepage "https://github.com/jfryy/qq"
  url "https://github.com/jfryy/qq/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "cec2d9471d708f566109225a5338960d32a41da29afbcba66d13165b6b968e33"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.2.3/qq-v0.2.3-darwin-amd64.tar.gz"
      sha256 "5129ff69c11ac0bd5b13e2d6f5a83c14641c7d3c53fb5478b069c999f5e9006d"
    elsif Hardware::CPU.arm?
      url "https://github.com/JFryy/qq/releases/download/v0.2.3/qq-v0.2.3-darwin-arm64.tar.gz"
      sha256 "4a4e773d7d5e20ba09f34272b5957f440725fccc77456aa63543b44cf0b43c9d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.2.3/qq-v0.2.3-linux-amd64.tar.gz"
      sha256 "21698c1f6010ad7cd1d0b60424cf7de258243773975fb6acbbb0d27d199c6da1"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JFryy/qq/releases/download/v0.2.3/qq-v0.2.3-linux-arm64.tar.gz"
      sha256 "0816667e77c1a551c6c08d116ea13d906dda85a9690697eab3aeef92f0dc5641"
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
