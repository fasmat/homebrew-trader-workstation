# typed: false
# frozen_string_literal: true

cask "trader-workstation" do
  version "978.2q"
  sha256 :no_check

  url "https://download2.interactivebrokers.com/installers/tws/stable-standalone/tws-stable-standalone-macosx-x64.dmg"
  name "Trader Workstation"
  desc "Stable Standalone Trader Workstation"
  homepage "https://www.interactivebrokers.com/"

  conflicts_with cask: ["trader-workstation-latest", "trader-workstation-beta"]

  installer script: {
    executable: "#{staged_path}/Trader Workstation #{version.major} Installer.app/Contents/MacOS/JavaApplicationStub",
    args:       ["-q"],
  }

  uninstall quit:   "com.install4j.5889-6375-8446-2021.22",
            script: {
              executable: "#{appdir}/Trader Workstation #{version.major}/Trader Workstation #{version.major} Uninstaller.app/Contents/MacOS/JavaApplicationStub",
              args:       ["-q"],
            }

  caveats do
    depends_on_java "7+"
  end
end
