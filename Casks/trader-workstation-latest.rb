cask 'trader-workstation-latest' do
  version '979.5b'
  sha256 '2a3f8f374e266afbf3920b8ff2458e4e043e5c930d6216bb00075c3e0d1f54fe'

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
