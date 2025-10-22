class Qq < Formula
  desc "Multi-tool structured format processor for query and transcoding"
  homepage "https://github.com/jfryy/qq"
  url "https://github.com/jfryy/qq/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "9a619fdbabadb59bad726744f92c55a727a8dace03becdf0a2cab5028feb4e5b"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.3.1/qq-v0.3.1-darwin-amd64.tar.gz"
      sha256 "2d372dc058cf731795d60f30b1e9f8140f5545d776ad3bdcf450a56222803b9d"
    elsif Hardware::CPU.arm?
      url "https://github.com/JFryy/qq/releases/download/v0.3.1/qq-v0.3.1-darwin-arm64.tar.gz"
      sha256 "9f01374507ea157e11c152a9eae74f1633e679dc059ff1b9d71bb2a94d6448ba"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.3.1/qq-v0.3.1-linux-amd64.tar.gz"
      sha256 "604be271d6141aabe2f87958539a06911083280488858c9ce69a69517a17c270"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JFryy/qq/releases/download/v0.3.1/qq-v0.3.1-linux-arm64.tar.gz"
      sha256 "a48d6b02ee23d7fe9873ae39b759695e403d0ec2ba4806b86d31a30fdd5ca9c9"
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
