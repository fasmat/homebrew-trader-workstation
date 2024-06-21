# typed: false
# frozen_string_literal: true

cask "trader-workstation-beta" do
  arch arm: "arm", intel: "x64"
  os = on_arch_conditional arm: "macos", intel: "macosx"

  version "10.30.1b"
  sha256 :no_check

  url "https://download2.interactivebrokers.com/installers/tws/beta/tws-beta-#{os}-#{arch}.dmg"
  name "Trader Workstation Beta"
  desc "Beta of Trader Workstation"
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

  uninstall_preflight do
    ohai "Stopping all running instances of Trader Workstation prior to uninstall"
    system_command "/usr/bin/pkill", args: ["-f", "#{appdir}/Trader Workstation/Trader Workstation.app"]
  rescue RuntimeError
    ohai "No running instances of Trader Workstation found"
  end

  uninstall quit:   "com.install4j.5889-6375-8446-2021",
            script: {
              executable: "#{appdir}/Trader Workstation/Trader Workstation Uninstaller.app/Contents/MacOS/JavaApplicationStub",
              args:       ["-q"],
            }

  zap trash: [
    "#{appdir}/Trader Workstation",
    "~/Jts",
    "~/Library/Application Support/Trader Workstation",
  ]
end
