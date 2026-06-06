class A2fuse < Formula
  desc "Mount Apple II ProDOS disk images as read-only filesystems"
  homepage "https://github.com/markassad/a2fuse"
  url "https://github.com/markassad/a2fuse/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on "rust" => :build
  depends_on "pkg-config" => :build
  depends_on "macfuse"

  def install
    system "cargo", "install", "--locked", "--features", "macfuse", "--root", prefix
  end

  test do
    system "#{bin}/a2fuse", "--help"
  end
end
