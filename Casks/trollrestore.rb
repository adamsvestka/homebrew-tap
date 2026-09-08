cask "trollrestore" do
  version "1.0"
  sha256 "47faf58d245729314046a6e56f920ddd42273db41daab8502bbff5ec5b81adfb"

  url "https://github.com/JJTech0130/TrollRestore/releases/download/#{version}/TrollRestore_macOS_arm64.zip"
  name "TrollRestore"
  desc "TrollStore installer for iOS 15.2 through 17.0"
  homepage "https://github.com/JJTech0130/TrollRestore"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  binary "TrollRestore"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-drs", "com.apple.quarantine", "{{staged_path}}/TrollRestore"]
  end

  zap trash: ""
end
