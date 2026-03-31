cask "brogue-ce" do
  arch arm: "arm64", intel: "x86_64"

  version "1.15.1"
  sha256 arm:   "e95b954312f215f30a8c791dc622d4590cec29820382c4ddf914391c56fe889d",
         intel: "7bb8c6b27e7c2b4e04472c8e9798d0a10714bc73f567ea30e0e477a4f69770d7"

  url "https://github.com/tmewett/BrogueCE/releases/download/v#{version}/BrogueCE-#{version}-macos-#{arch}.zip"
  name "Brogue CE"
  desc "Roguelike game"
  homepage "https://github.com/tmewett/BrogueCE"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "BrogueCE-macos/Brogue CE.app"

  postflight do
    system "/usr/bin/xattr", "-drs", "com.apple.quarantine", "#{appdir}/Brogue CE.app"
  end

  zap trash: [
    "~/Library/Application Support/Brogue/Brogue CE"
  ]
end
