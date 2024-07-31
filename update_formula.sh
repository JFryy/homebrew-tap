#!/bin/bash

# Constants
REPO="jfryy/qq"
VERSION="v0.2.1-re"

# URLs
URL_SOURCE="https://github.com/$REPO/archive/refs/tags/$VERSION.tar.gz"
URL_MACOS_INTEL="https://github.com/JFryy/qq/releases/download/$VERSION/qq-$VERSION-darwin-amd64.tar.gz"
URL_MACOS_ARM="https://github.com/JFryy/qq/releases/download/$VERSION/qq-$VERSION-darwin-arm64.tar.gz"
URL_LINUX_INTEL="https://github.com/JFryy/qq/releases/download/$VERSION/qq-$VERSION-linux-amd64.tar.gz"
URL_LINUX_ARM="https://github.com/JFryy/qq/releases/download/$VERSION/qq-$VERSION-linux-arm64.tar.gz"

# Function to calculate SHA256 checksum
calculate_sha256() {
    url=$1
    curl -Ls "$url" | sha256sum | awk '{print $1}'
}

# Function to generate Homebrew formula content
generate_formula() {
    cat <<EOF
class Qq < Formula
  desc "Multi-tool structured format processor for query and transcoding"
  homepage "https://github.com/jfryy/qq"
  url "$URL_SOURCE"
  sha256 "$(calculate_sha256 $URL_SOURCE)"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "$URL_MACOS_INTEL"
      sha256 "$(calculate_sha256 $URL_MACOS_INTEL)"
    elsif Hardware::CPU.arm?
      url "$URL_MACOS_ARM"
      sha256 "$(calculate_sha256 $URL_MACOS_ARM)"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "$URL_LINUX_INTEL"
      sha256 "$(calculate_sha256 $URL_LINUX_INTEL)"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "$URL_LINUX_ARM"
      sha256 "$(calculate_sha256 $URL_LINUX_ARM)"
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
EOF
}

# Generate the formula file
generate_formula > Formula/qq.rb

echo "Formula file generated successfully."

