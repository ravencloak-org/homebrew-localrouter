cask "localrouter" do
  # Update `version` and `sha256` on every release.
  # Release automation replaces 30d810f84ca514f1a9b70008b17b55ddbb0e9c8272e40a14575b77cb32a6823c with the real checksum of
  # LocalRouter-macos.zip for the tagged version.
  version "0.1.8"
  sha256 "30d810f84ca514f1a9b70008b17b55ddbb0e9c8272e40a14575b77cb32a6823c"

  url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/LocalRouter-macos.zip"
  name "LocalRouter"
  desc "Menu-bar app for LocalRouter"
  homepage "https://github.com/ravencloak-org/LocalRouter"

  depends_on macos: :ventura

  app "LocalRouter.app"

  # The app is ad-hoc signed, not notarized. Strip the download quarantine so Gatekeeper
  # lets it launch directly instead of blocking it as an "unidentified developer".
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/LocalRouter.app"]
  end

  caveats <<~EOS
    LocalRouter requires the Claude CLI to be installed and logged in:
      https://docs.anthropic.com/en/docs/claude-code

    The menu-bar app installed by this cask is the UI only. The headless
    core runs separately — install it with:
      brew install ravencloak-org/localrouter/localrouter
  EOS
end
