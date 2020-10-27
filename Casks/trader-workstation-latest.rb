# typed: false
# frozen_string_literal: true

cask "trader-workstation-latest" do
  version "981.2b"
  sha256 "746f20d1f0e7f1afa254ef0ade8c03390eb5e14c0b00b4f55aa5c44f9c87b9e9"

  url "https://download2.interactivebrokers.com/installers/tws/latest-standalone/tws-latest-standalone-macosx-x64.dmg"
  name "Trader Workstation"
  desc "Trader Workstation Standalone"
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
