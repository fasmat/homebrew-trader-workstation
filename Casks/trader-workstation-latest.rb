# typed: false
# frozen_string_literal: true

cask "trader-workstation-latest" do
  version "981.2p"
  sha256 :no_check

  url "https://download2.interactivebrokers.com/installers/tws/latest-standalone/tws-latest-standalone-macosx-x64.dmg"
  name "Trader Workstation Latest"
  desc "Latest Standalone Trader Workstation"
  homepage "https://www.interactivebrokers.com/"

  conflicts_with cask: "trader-workstation",
                 cask: "trader-workstation-beta"

  caveats do
    depends_on_java "7+"
  end

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
