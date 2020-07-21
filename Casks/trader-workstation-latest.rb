cask 'trader-workstation-latest' do
  version '979.4y'
  sha256 'ce3e477eb27077d0f90a165617fd724c0c679aae46f8d7bfb680920e93c92d7f'

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
