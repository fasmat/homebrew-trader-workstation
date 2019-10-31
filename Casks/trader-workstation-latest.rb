cask 'trader-workstation-latest' do
  version '978,978.1d'
  sha256 'c5d2e3cb8ea9871fa653945005aa77146205145f7f55faa0b72b52db1de977bf'

  url 'https://download2.interactivebrokers.com/installers/tws/latest-standalone/tws-latest-standalone-macosx-x64.dmg'
  name 'Trader Workstation'
  homepage 'https://www.interactivebrokers.com/'

  conflicts_with cask: 'trader-workstation'

  installer script: {
                      executable: "#{staged_path}/Trader Workstation #{version.before_comma} Installer.app/Contents/MacOS/JavaApplicationStub",
                      args:       ['-q'],
                    }

  uninstall quit:   'com.install4j.5889-6375-8446-2021.22',
            script: {
                      executable: "#{ENV['HOME']}/Applications/Trader Workstation #{version.before_comma}/Trader Workstation #{version.before_comma} Uninstaller.app/Contents/MacOS/JavaApplicationStub",
                      args:       ['-q'],
                    }
end
