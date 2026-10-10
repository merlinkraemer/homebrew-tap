cask "lockr" do
  version "1.2.0"
  sha256 "958ca3455480f99c8e1e849786a597dd0c290709b8a799b231b01b25fd0f1d11"

  url "https://github.com/merlinkraemer/lockr/releases/download/v#{version}/Lockr-#{version}.zip"
  name "Lockr"
  desc "Minimal lock screen that keeps the computer awake"
  homepage "https://github.com/merlinkraemer/lockr"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Lockr.app"
  binary "#{appdir}/Lockr.app/Contents/MacOS/Lockr", target: "lockr"

  # The login agent relaunches the new version after the old one quits.
  uninstall quit: "com.merlinkraemer.lockr"

  zap trash: "~/Library/Preferences/com.merlinkraemer.lockr.plist"

  caveats <<~EOS
    Open Lockr once and grant Accessibility when asked. After that, Cmd-Shift-/
    locks and Lockr starts in the background at login.

    Before uninstalling, run `lockr --disable` to remove the login agent.
  EOS
end
