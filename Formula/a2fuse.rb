class A2fuse < Formula
  desc "Mount Apple II ProDOS disk images as read-only filesystems"
  homepage "https://github.com/markassad/a2fuse"
  url "https://github.com/markassad/a2fuse/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "81af2f73eacb8a0202bd174c8878d572610d3e21644131e2084257d3fc3a9e14"
  license "MIT"

  depends_on "rust" => :build
  depends_on "pkg-config" => :build

  def install
    system "cargo", "install", "--locked", "--features", "macfuse", "--root", prefix
  end

  def caveats
    <<~EOS
      macFUSE is required to mount images. Install it with:
        brew install --cask macfuse
    EOS
  end

  test do
    system "#{bin}/a2fuse", "--help"
  end
end
