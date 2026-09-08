cask "luma" do
  arch arm: "arm64", intel: "x86_64"

  version "1.2.3"
  sha256 arm:   "496c35baa36f983ab580b3b28e4bc1a021785cba04c645c99ec5a3e142565000",
         intel: "4ab60ca82d900626913df7e11dc6d048788a6b6bf51d405cfb63cc67baebdbef"

  url "https://github.com/frida/luma/releases/download/#{version}/Luma-#{version}-#{arch}.dmg"
  name "luma"
  desc "Interactive dynamic instrumentation app built on Frida"
  homepage "https://luma.frida.re/"

  livecheck do
    url :url
    strategy :girhub_latest
  end

  depends_on macos: :sequoia

  app "Luma.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-drs", "com.apple.quarantine", "{{appdir}}/Luma.app"]
  end

  zap trash: [
    "~/Library/Application Support/re.frida.Luma",
    "~/Library/Caches/re.frida.Luma",
    "~/Library/HTTPStorages/re.frida.Luma",
    "~/Library/Preferences/re.frida.Luma.plist",
    "~/Library/WebKit/re.frida.Luma",
  ]
end
