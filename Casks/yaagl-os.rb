cask "yaagl-os" do
  version "0.3.12"
  sha256 "5cdfa7029b094fbf685ba9c8759165c0f15c849c96745e3ce087b9882180fcc6"

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
