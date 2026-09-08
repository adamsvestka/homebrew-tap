cask "mdmpatcher-enhanced" do
  version "1.0"
  sha256 "5aa4464160aa9d1496ded6452b8cd84bc5a658b9bf77a0b920cd0704476ddceb"

  url "https://github.com/fled-dev/MDMPatcher-Enhanced/releases/download/v#{version}/MDMPatcher-Enhanced_v#{version}.dmg"
  name "MDMPatcher Enhanced"
  desc "Patch MDM configuration on iOS devices"
  homepage "https://github.com/fled-dev/MDMPatcher-Enhanced"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "MDMPatcher Enhanced.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-drs", "com.apple.quarantine", "{{appdir}}/MDMPatcher Enhanced.app"]
  end
end
