cask "alef-term" do
  version "0.1.2"
  sha256 "7d57af140754d9d8bcceffadbd51d47d76c2091a501432ad12accc00f9ef9bab"

  url "https://github.com/almodhfer/alef-term/releases/download/v#{version}/Alef-v#{version}-macos-arm64.zip"
  name "Alef"
  desc "Arabic-first terminal emulator"
  homepage "https://github.com/almodhfer/alef-term"

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Alef.app"
  binary "#{appdir}/Alef.app/Contents/MacOS/alef-term"

  # The app is not signed with an Apple developer certificate, so clear the
  # download flag that would otherwise make macOS refuse to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Alef.app"]
  end

  zap trash: "~/.config/alef-term"
end
