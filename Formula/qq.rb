class Qq < Formula
  desc "Multi-tool structured format processor for query and transcoding"
  homepage "https://github.com/jfryy/qq"
  url "https://github.com/jfryy/qq/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "ea705de059cd7b2af7fadbf5c812d5928dcf0f17209045cc6e062e9623915c9b"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.3.3/qq-v0.3.3-darwin-amd64.tar.gz"
      sha256 "b4c5a2357f5d62e6da35525c3eeda0e7b4f53c9e81806709e9960f993e8e53eb"
    elsif Hardware::CPU.arm?
      url "https://github.com/JFryy/qq/releases/download/v0.3.3/qq-v0.3.3-darwin-arm64.tar.gz"
      sha256 "45aaa3ec6bb23182efe3c3fcb87c3a71eb17443248c80408a76a7438326ba99d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.3.3/qq-v0.3.3-linux-amd64.tar.gz"
      sha256 "de780b0a5f0183850f665b6fe23d8d8c41ed385159cb1c6025e022190e4d960d"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JFryy/qq/releases/download/v0.3.3/qq-v0.3.3-linux-arm64.tar.gz"
      sha256 "6008c99cee869bcf6fd4a108127051525a94d28d5d4e468e90b7343caab021cb"
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
