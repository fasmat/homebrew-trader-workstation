# typed: false
# frozen_string_literal: true

cask "trader-workstation-latest" do
  version "981.2h"
  sha256 :no_check

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
