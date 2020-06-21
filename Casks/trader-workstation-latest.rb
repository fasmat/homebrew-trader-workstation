cask 'trader-workstation-latest' do
  version '979.4v'
  sha256 '668f089b24dcd03ded197a18a0f9880bd4728c93485041a50c6aa4be71854a68'

  url 'https://download2.interactivebrokers.com/installers/tws/latest-standalone/tws-latest-standalone-macosx-x64.dmg'
  name 'Trader Workstation'
  homepage 'https://www.interactivebrokers.com/'

  conflicts_with cask: 'trader-workstation'

  installer script: {
                      executable: "#{staged_path}/Trader Workstation #{version.major} Installer.app/Contents/MacOS/JavaApplicationStub",
                      args:       ['-q'],
                    }

  uninstall quit:   'com.install4j.5889-6375-8446-2021.22',
            script: {
                      executable: "#{ENV['HOME']}/Applications/Trader Workstation #{version.major}/Trader Workstation #{version.major} Uninstaller.app/Contents/MacOS/JavaApplicationStub",
                      args:       ['-q'],
                    }
end
