cask "bounce" do
  version "1.0.2"
  sha256 "43382a44b2cfa0d03919cd47c29af44d3bd5245ab392a97e89a2cbaa17ab7572"

  url "https://onbounce.app/api/download?src=brew&v=#{version}"
  name "Bounce"
  desc "Music library for unfinished tracks, synced to your iPhone"
  homepage "https://onbounce.app"

  livecheck do
    url "https://github.com/merlinkraemer/bounce"
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Bounce.app"

  uninstall quit: "com.merlinkraemer.bounce.sender"

  zap trash: [
    "~/Library/Application Support/Bounce",
    "~/Library/Caches/com.merlinkraemer.bounce.sender",
    "~/Library/HTTPStorages/com.merlinkraemer.bounce.sender",
    "~/Library/Preferences/com.merlinkraemer.bounce.sender.plist",
  ]
end
