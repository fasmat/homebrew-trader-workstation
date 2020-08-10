cask 'trader-workstation-latest' do
  version '979.4z'
  sha256 '63da684e47089d05dcaf1f27cb336da7b3c7cdafacf65e1de5b52bec91d4edfb'

  url 'https://download2.interactivebrokers.com/installers/tws/latest-standalone/tws-latest-standalone-macosx-x64.dmg'
  name 'Trader Workstation'
  homepage 'https://www.interactivebrokers.com/'

  conflicts_with cask: 'trader-workstation'

  installer script: {
    executable: "#{staged_path}/Trader Workstation #{version.major} Installer.app/Contents/MacOS/JavaApplicationStub",
    args: ['-q']
  }

  uninstall quit: 'com.install4j.5889-6375-8446-2021.22',
            script: {
              executable: "#{ENV['HOME']}/Applications/Trader Workstation #{version.major}/Trader Workstation #{version.major} Uninstaller.app/Contents/MacOS/JavaApplicationStub",
              args: ['-q']
            }
end
