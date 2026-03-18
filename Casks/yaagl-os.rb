cask "yaagl-os" do
  version "0.3.9"
  sha256 "72996c756d1268196b4edebc2ef59eb4835dff0989ad968f17524605c9cbf2d5"

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
