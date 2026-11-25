cask "mytoken" do
  version "0.6.0"
  sha256 "a387e81e0bf2f46de21f158b274438e29cbb46105defe1504dabeed6264e1113"

  url "https://github.com/nerv-base/mytoken/releases/download/v#{version}/mytoken-#{version}-darwin-universal.dmg"
  name "MyToken!!!!!"
  desc "Local spend and plan-quota dashboard for AI coding tools"
  homepage "https://github.com/nerv-base/mytoken"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "mytoken.app"
  binary "#{appdir}/mytoken.app/Contents/MacOS/mytoken"

  uninstall quit: "dev.zzstar.mytoken"

  zap trash: [
    "~/Library/Application Support/MyToken",
    "~/Library/Caches/dev.zzstar.mytoken",
    "~/Library/Preferences/dev.zzstar.mytoken.plist",
    "~/Library/Saved Application State/dev.zzstar.mytoken.savedState",
  ]
end
