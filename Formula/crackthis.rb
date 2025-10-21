class Crackthis < Formula
  desc "RSA cracking tool for CTF competitions"
  homepage "https://github.com/soycarlo99/crackthis"
  url "https://github.com/soycarlo99/crackthis/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "PUT_YOUR_SHA256_HERE"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"crackthis"
  end

  test do
    assert_match "crackthis is a modern CLI tool", shell_output("#{bin}/crackthis --help")
    output = shell_output("#{bin}/crackthis --c 65537 --n 144292 --e 3 2>&1")
    assert_match "SUCCESS", output
  end
end
