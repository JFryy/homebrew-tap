class Qq < Formula
  desc "Multi-tool structured format processor for query and transcoding"
  homepage "https://github.com/jfryy/qq"
  url "https://github.com/jfryy/qq/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "1c68da487208aa2daad60de0f9d1bec2ca145d066ea912cb7e58b677bcede344"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.2.1/qq-v0.2.1-darwin-amd64.tar.gz"
      sha256 "5319a72c981becaf36e572c0d4fc3f4b4a426021a3e7ee037e68893b6211fb9b"
    elsif Hardware::CPU.arm?
      url "https://github.com/JFryy/qq/releases/download/v0.2.1/qq-v0.2.1-darwin-arm64.tar.gz"
      sha256 "ff29d4486565a31360196a9977ed6f07a90f38cfa3c1aacd6e052f84473a9303"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.2.1/qq-v0.2.1-linux-amd64.tar.gz"
      sha256 "2df3d20d93051dd34cb009b9a5d0de081dbd439dc02b4d8a4c9a2bb8257586a1"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JFryy/qq/releases/download/v0.2.1/qq-v0.2.1-linux-arm64.tar.gz"
      sha256 "a7f1f19972c19eb895804b2d26ac3f0a8e899384027e630dbf7154b7b6ffb6b8"
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
