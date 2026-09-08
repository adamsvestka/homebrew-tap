cask "yaagl-os" do
  version "0.3.18"
  sha256 "096aec685ddd0001f91b1d6228581b9054c01598c39d017f0b8de8bec1c46be7"

  url "https://github.com/yaagl/yet-another-anime-game-launcher/releases/download/#{version}/Yaagl.OS.app.tar.gz"
  name "Yet another anime game launcher (Yaagl)"
  desc "Genshin Impact game launcher"
  homepage "https://github.com/yaagl/yet-another-anime-game-launcher"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Yaagl OS.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-drs", "com.apple.quarantine", "{{appdir}}/Yaagl OS.app"]
  end

  zap trash: [
    "~/Library/Application Support/Yaagl OS",
    "~/Library/Caches/com.3shain.yaagl.os",
    "~/Library/WebKit/com.3shain.yaagl.os",
  ]
end
