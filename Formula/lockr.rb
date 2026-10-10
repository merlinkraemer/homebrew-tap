class Lockr < Formula
  desc "Minimal i3lock-style lock screen for macOS that keeps your Mac awake"
  homepage "https://github.com/merlinkraemer/lockr"
  url "https://github.com/merlinkraemer/lockr/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "96b4631202d9244e39e580107a9686146f52b64b39999ad8a659b42184e89a29"
  license "MIT"
  head "https://github.com/merlinkraemer/lockr.git", branch: "main"

  depends_on macos: :sonoma

  def install
    system "make"
    prefix.install "build/Lockr.app"
    (bin/"lockr").write <<~SH
      #!/bin/sh
      exec open -a "#{opt_prefix}/Lockr.app" "$@"
    SH
  end

  def caveats
    <<~EOS
      Lock the screen with:
        lockr

      The first run asks for Accessibility permission and quits without locking.
      Enable Lockr under System Settings > Privacy & Security > Accessibility,
      then run it again. Each upgrade rebuilds Lockr, so macOS asks again.

      To stay awake with the lid closed, see:
        https://github.com/merlinkraemer/lockr#staying-awake-with-the-lid-closed
    EOS
  end

  test do
    assert_path_exists prefix/"Lockr.app/Contents/MacOS/Lockr"
  end
end
