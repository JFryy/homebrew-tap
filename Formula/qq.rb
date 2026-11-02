class Qq < Formula
  desc "Multi-tool structured format processor for query and transcoding"
  homepage "https://github.com/JFryy/qq"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.5.0/qq-v0.5.0-darwin-amd64.tar.gz"
      sha256 "93d3f049007fae173f602190577af5ce7b798e252e67245ed5b30dce74d14815"
    elsif Hardware::CPU.arm?
      url "https://github.com/JFryy/qq/releases/download/v0.5.0/qq-v0.5.0-darwin-arm64.tar.gz"
      sha256 "dbdbfa8322bb497eb2995d4f2400287348636750d24a8bec537cdd02f4d5f942"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.5.0/qq-v0.5.0-linux-amd64.tar.gz"
      sha256 "8a445b3986ac0fb003b0e341c27dfbe8c4ad43a8d7174e69e76898409909c016"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JFryy/qq/releases/download/v0.5.0/qq-v0.5.0-linux-arm64.tar.gz"
      sha256 "432604472519ab6d94ed113d9d9fae19a87f04b687c20d8f4b473a952f8ede59"
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
