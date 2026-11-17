cask "bounce" do
  version "1.0.0"
  sha256 "36d34600a74c09a324ca4cda7ced07e4c6bc069f8abb62aba78e5184f93a9f37"

  url "https://github.com/merlinkraemer/bounce/releases/download/v#{version}/Bounce-#{version}.dmg"
  name "Bounce"
  desc "Music library for unfinished tracks, synced to your iPhone"
  homepage "https://onbounce.app"

  livecheck do
    url :url
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
