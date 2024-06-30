class Qq < Formula
  desc "Multi-tool structured format processor for query and transcoding"
  homepage "https://github.com/jfryy/qq"
  url "https://github.com/jfryy/qq/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "4286f5736d8aad1435954cbbc49aabdfb44b39eb300da777a0b3cf8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.1.6/qq-v0.1.6-darwin-amd64.tar.gz"
      sha256 "3070bd09c274b362a9fe813d6c58d60528e41309097ad7b2af226d4c97f67657"
    elsif Hardware::CPU.arm?
      url "https://github.com/JFryy/qq/releases/download/v0.1.6/qq-v0.1.6-darwin-arm64.tar.gz"
      sha256 "59c4c86d45782b278ad8318dc34b35875b415e68229cebeba3abe262fbe54167"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.1.6/qq-v0.1.6-linux-amd64.tar.gz"
      sha256 "f1a24fa909ee4a81170971b24825265e1caa399bd5cbaac6a21c609e261e9990"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JFryy/qq/releases/download/v0.1.6/qq-v0.1.6-linux-arm64.tar.gz"
      sha256 "c45a1cd25b4786686d9e6db5dab01301d9e370e95b831bc8ca573c6af1aa396f"
    end
  end

  def install
    bin.install "qq"
  end

  test do
    (testpath/"test.json").write('{"somekey": "somevalue"}')
    assert_equal "somevalue", shell_output("cat test.json | #{bin}/qq .somekey -r").strip
  end
end
