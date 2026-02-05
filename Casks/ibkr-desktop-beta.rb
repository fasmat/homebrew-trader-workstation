# typed: false
# frozen_string_literal: true

cask "ibkr-desktop-beta" do
  arch arm: "arm", intel: "x64"
  os = on_arch_conditional arm: "macos", intel: "macosx"

  version "2.0e"
  sha256 :no_check

  url "https://download2.interactivebrokers.com/installers/ntws/beta-standalone/ntws-beta-standalone-#{os}-#{arch}.dmg"
  name "IBKR Desktop Beta"
  desc "Beta of IBKR Desktop"
  homepage "https://www.interactivebrokers.com/"

  livecheck do
    url "https://download2.interactivebrokers.com/installers/ntws/beta-standalone/version.json"
    regex(/"buildVersion"\s*:\s*"(\d+(?:\.\d+)+[a-z]*)"/i)
  end

  auto_updates true

  installer script: {
    executable: "#{staged_path}/IBKR Desktop Installer.app/Contents/MacOS/JavaApplicationStub",
    args:       ["-q"],
  }

  uninstall_preflight do
    ohai "Stopping all running instances of IBKR Desktop prior to uninstall"
    system_command "/usr/bin/pkill", args: ["-f", "#{appdir}/IBKR Desktop/IBKR Desktop.app"]
  rescue RuntimeError
    ohai "No running instances of IBKR Desktop found"
  end

  uninstall script: {
    executable: "#{appdir}/IBKR Desktop/IBKR Desktop Uninstaller.app/Contents/MacOS/JavaApplicationStub",
    args:       ["-q"],
  }

  zap trash: [
    "#{appdir}/IBKR Desktop",
    "~/Jts",
    "~/Library/Application Support/IBKR Desktop",
  ]
end
