# typed: false
# frozen_string_literal: true

cask "trader-workstation-beta" do
  version "10.10.2d"
  sha256 :no_check

  url "https://download2.interactivebrokers.com/installers/tws/beta/tws-beta-macosx-x64.dmg"
  name "Trader Workstation Beta"
  desc "Beta Trader Workstation"
  homepage "https://www.interactivebrokers.com/"

  livecheck do
    url "https://download2.interactivebrokers.com/installers/tws/beta/version.json"
    regex(/"buildVersion"\s*:\s*"(\d+(?:\.\d+)+[a-z]*)"/i)
  end

  auto_updates true
  conflicts_with cask: ["trader-workstation", "trader-workstation-stable", "trader-workstation-latest"]

  installer script: {
    executable: "#{staged_path}/Trader Workstation Installer.app/Contents/MacOS/JavaApplicationStub",
    args:       ["-q"],
  }

  uninstall quit:   "com.install4j.5889-6375-8446-2021.22",
            script: {
              executable: "#{appdir}/Trader Workstation/Trader Workstation Uninstaller.app/Contents/MacOS/JavaApplicationStub",
              args:       ["-q"],
            }

  caveats do
    depends_on_java "7+"
  end
end
