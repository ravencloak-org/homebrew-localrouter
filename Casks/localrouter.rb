cask "localrouter" do
  # Update `version` and `sha256` on every release.
  # Release automation replaces e3b3ad91851cf0648cd0f9ad05ca5ea54ab6753de3a165d06d8de7cf78576e7a with the real checksum of
  # LocalRouter-macos.zip for the tagged version.
  version "0.1.5"
  sha256 "e3b3ad91851cf0648cd0f9ad05ca5ea54ab6753de3a165d06d8de7cf78576e7a"

  url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/LocalRouter-macos.zip"
  name "LocalRouter"
  desc "Menu-bar app for LocalRouter"
  homepage "https://github.com/ravencloak-org/LocalRouter"

  depends_on macos: :ventura

  app "LocalRouter.app"

  caveats <<~EOS
    LocalRouter requires the Claude CLI to be installed and logged in:
      https://docs.anthropic.com/en/docs/claude-code

    The menu-bar app installed by this cask is the UI only. The headless
    core runs separately — install it with:
      brew install ravencloak-org/localrouter/localrouter
  EOS
end
