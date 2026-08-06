cask "localrouter" do
  # Update `version` and `sha256` on every release.
  # Release automation replaces 96aaa88d419060d546f5c93130112e3288f4ef678b2dd9da64e8eff88316cf8a with the real checksum of
  # LocalRouter-macos.zip for the tagged version.
  version "0.1.2"
  sha256 "96aaa88d419060d546f5c93130112e3288f4ef678b2dd9da64e8eff88316cf8a"

  url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/LocalRouter-macos.zip"
  name "LocalRouter"
  desc "Menu-bar app for LocalRouter"
  homepage "https://github.com/ravencloak-org/LocalRouter"

  depends_on macos: ">= :ventura"

  app "LocalRouter.app"

  caveats <<~EOS
    LocalRouter requires the Claude CLI to be installed and logged in:
      https://docs.anthropic.com/en/docs/claude-code

    The menu-bar app installed by this cask is the UI only. The headless
    core runs separately — install it with:
      brew install ravencloak-org/localrouter/localrouter
  EOS
end
