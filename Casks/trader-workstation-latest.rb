cask 'trader-workstation-latest' do
  version '978,978.1t'
  sha256 '9daa2a465417d1748354aa7ebfa6e64232c4dfd4ae8f4ba718c9c739e62fd170'

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
