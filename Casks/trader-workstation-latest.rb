# frozen_string_literal: true

cask "trader-workstation-latest" do
  version "980.4j"
  sha256 "7bc9ba3b9f0352f418ca0163e6d9de24f6986a6039655df65f2eb74b53e07fc6"

  url "https://download2.interactivebrokers.com/installers/tws/latest-standalone/tws-latest-standalone-macosx-x64.dmg"
  name "Trader Workstation"
  homepage "https://www.interactivebrokers.com/"

  conflicts_with cask: "trader-workstation"

  installer script: {
    executable: "#{staged_path}/Trader Workstation #{version.major} Installer.app/Contents/MacOS/JavaApplicationStub",
    args:       ["-q"],
  }

  uninstall quit:   "com.install4j.5889-6375-8446-2021.22",
            script: {
              executable: "#{appdir}/Trader Workstation #{version.major}/Trader Workstation #{version.major} Uninstaller.app/Contents/MacOS/JavaApplicationStub",
              args:       ["-q"],
            }
end
