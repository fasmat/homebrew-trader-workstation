# typed: false
# frozen_string_literal: true

cask "trader-workstation-latest" do
  arch arm: "arm", intel: "x64"
  os = on_arch_conditional arm: "macos", intel: "macosx"

  version "10.32.1f"
  sha256 :no_check

  url "https://download2.interactivebrokers.com/installers/tws/latest-standalone/tws-latest-standalone-#{os}-#{arch}.dmg"
  name "Trader Workstation Latest"
  desc "Standalone of Trader Workstation Latest"
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

  uninstall_preflight do
    ohai "Stopping all running instances of Trader Workstation prior to uninstall"
    system_command "/usr/bin/pkill", args: ["-f", "#{appdir}/Trader Workstation #{version.major_minor}/Trader Workstation.app"]
  rescue RuntimeError
    ohai "No running instances of Trader Workstation found"
  end

  uninstall quit:   "com.install4j.5889-6375-8446-2021",
            script: {
              executable: "#{appdir}/Trader Workstation #{version.major_minor}/Trader Workstation #{version.major_minor} Uninstaller.app/Contents/MacOS/JavaApplicationStub",
              args:       ["-q"],
            }

  zap trash: [
    "#{appdir}/Trader Workstation #{version.major_minor}",
    "~/Jts",
    "~/Library/Application Support/Trader Workstation #{version.major_minor}",
  ]
end
