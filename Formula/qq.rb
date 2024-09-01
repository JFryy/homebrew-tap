class Qq < Formula
  desc "Multi-tool structured format processor for query and transcoding"
  homepage "https://github.com/jfryy/qq"
  url "https://github.com/jfryy/qq/archive/refs/tags/v0.2.2-r.tar.gz"
  sha256 "183446237a1d99d7b2517273f6b2ec5f05f7326082b95359602975eb08e384b2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.2.2-r/qq-v0.2.2-r-darwin-amd64.tar.gz"
      sha256 "a029c834638067bf862e2ab79c9127fd3ecc7663caad5bf1f57a7be83127c23e"
    elsif Hardware::CPU.arm?
      url "https://github.com/JFryy/qq/releases/download/v0.2.2-r/qq-v0.2.2-r-darwin-arm64.tar.gz"
      sha256 "81904e38479cb00e58f1bb1fd9cd847fe66f2dfd029384d174fc653115fb6026"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.2.2-r/qq-v0.2.2-r-linux-amd64.tar.gz"
      sha256 "bab57a22c2465242bced2555faf2fa52c2948b991ca4f0fcbe65fe3852a14bd5"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JFryy/qq/releases/download/v0.2.2-r/qq-v0.2.2-r-linux-arm64.tar.gz"
      sha256 "43067ea8147ea2857cb2a6659aec66900a70c385926589937b20b4d948683bf8"
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
