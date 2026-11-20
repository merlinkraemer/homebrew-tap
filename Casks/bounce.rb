cask "bounce" do
  version "1.0.1"
  sha256 "f714e043f5a6742d26d01189c18ebcedd5f9dea3966124b828e06c74bae1ea68"

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
