class Qq < Formula
  desc "Multi-tool structured format processor for query and transcoding"
  homepage "https://github.com/jfryy/qq"
  url "https://github.com/jfryy/qq/archive/refs/tags/v0.1.5-stable.tar.gz"
  sha256 "2ce422a2fa1f101bb93690a9115849f7325986ab5732e31a59c811607821c876"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.1.5-stable/qq-v0.1.5-stable-darwin-amd64.tar.gz"
      sha256 "913c71c96b456b77a5b17076195966d0ad01322800ac4c1906f01c5194bba95f"
    elsif Hardware::CPU.arm?
      url "https://github.com/JFryy/qq/releases/download/v0.1.5-stable/qq-v0.1.5-stable-darwin-arm64.tar.gz"
      sha256 "eaa9c320ae5265565e88cf0339877f1e23dbb36da77941f93dfa8de16fa3c56d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/JFryy/qq/releases/download/v0.1.5-stable/qq-v0.1.5-stable-linux-amd64.tar.gz"
      sha256 "d2d16913d5404b69e86887081d1d8b762825722573325dce59e49762fe1f22e3"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JFryy/qq/releases/download/v0.1.5-stable/qq-v0.1.5-stable-linux-arm64.tar.gz"
      sha256 "5ba6fa5bbd4e7474b948d732482637573f0172fcc81ec257e8bb55c48794bd72"
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
