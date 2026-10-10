cask "alef-term" do
  version "0.1.0"
  sha256 "2eb9cb02e08538614d9afb8944df16ff6bc063d04c3672d92dee4156a7391ce8"

  url "https://github.com/almodhfer/alef-term/releases/download/v#{version}/Alef-v#{version}-macos-arm64.zip"
  name "Alef"
  desc "Arabic-first terminal emulator"
  homepage "https://github.com/almodhfer/alef-term"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "Alef.app"
  binary "#{appdir}/Alef.app/Contents/MacOS/alef-term"

  # The app is not signed with an Apple developer certificate, so clear the
  # download flag that would otherwise make macOS refuse to open it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Alef.app"]
  end

  zap trash: "~/.config/alef-term"
end
