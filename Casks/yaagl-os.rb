cask "yaagl-os" do
  version "0.3.10"
  sha256 "60c91e9bf160a12f6d0242c2371ee79d4acdb24b32a67786e62d301c76194ba6"

  url "https://github.com/yaagl/yet-another-anime-game-launcher/releases/download/#{version}/Yaagl.OS.app.tar.gz"
  name "Yet another anime game launcher (Yaagl)"
  desc "Genshin Impact game launcher"
  homepage "https://github.com/yaagl/yet-another-anime-game-launcher"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Yaagl OS.app"

  postflight do
    system "/usr/bin/xattr", "-drs", "com.apple.quarantine", "#{appdir}/Yaagl OS.app"
  end

  zap trash: [
    "~/Library/Application Support/Yaagl OS",
    "~/Library/Caches/com.3shain.yaagl.os",
    "~/Library/WebKit/com.3shain.yaagl.os",
  ]
end
