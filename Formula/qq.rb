class Qq < Formula
  desc "Multi-tool structured format processor for query and transcoding"
  homepage "https://github.com/jfryy/qq"
  url "https://github.com/jfryy/qq/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "e6bcc24996f7024f11cf53dd28558cb06d24dc7ed65a7bedb667dd26ab150e90"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.3.0/qq-v0.3.0-darwin-amd64.tar.gz"
      sha256 "7f3f5a28c9b50a954082d215ef685c2d05424b844b621f6b36e94fa47bbcd2db"
    elsif Hardware::CPU.arm?
      url "https://github.com/JFryy/qq/releases/download/v0.3.0/qq-v0.3.0-darwin-arm64.tar.gz"
      sha256 "b328f78ee6dc16124757e00ede86f2634a7fed3cc446c44e241a45441fa3a55a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.3.0/qq-v0.3.0-linux-amd64.tar.gz"
      sha256 "1011276f141cc6cad2e374067c47f970285db71b2f16be7dc80c65975ff17dd3"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JFryy/qq/releases/download/v0.3.0/qq-v0.3.0-linux-arm64.tar.gz"
      sha256 "0a85e504f316cc7d03002497120bf7192bb5bc92b7a0402335be9d54add5e80b"
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
