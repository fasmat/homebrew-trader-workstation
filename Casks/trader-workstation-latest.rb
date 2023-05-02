# typed: false
# frozen_string_literal: true

cask "trader-workstation-latest" do
  version "10.22.1l"
  sha256 :no_check

  url "https://download2.interactivebrokers.com/installers/tws/latest-standalone/tws-latest-standalone-macosx-x64.dmg"
  name "Trader Workstation Latest"
  desc "Latest Standalone Trader Workstation"
  homepage "https://www.interactivebrokers.com/"

  livecheck do
    url "https://download2.interactivebrokers.com/installers/tws/latest-standalone/version.json"
    regex(/"buildVersion"\s*:\s*"(\d+(?:\.\d+)+[a-z]*)"/i)
  end

  conflicts_with cask: ["trader-workstation", "trader-workstation-stable", "trader-workstation-beta"]

  installer script: {
    executable: "#{staged_path}/Trader Workstation #{version.major_minor} Installer.app/Contents/MacOS/JavaApplicationStub",
    args:       ["-q"],
  }

  uninstall quit:   "com.install4j.5889-6375-8446-2021.22",
            script: {
              executable: "#{appdir}/Trader Workstation #{version.major_minor}/Trader Workstation #{version.major_minor} Uninstaller.app/Contents/MacOS/JavaApplicationStub",
              args:       ["-q"],
            }

  caveats do
    depends_on_java "7+"
  end
end
