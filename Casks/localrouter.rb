cask "localrouter" do
  # Update `version` and `sha256` on every release.
  # Release automation replaces 5e771e2157ef6d29f16fd5de31a53638898790bd6de40efa33dbb59541a05ab4 with the real checksum of
  # LocalRouter-macos.zip for the tagged version.
  version "0.1.7"
  sha256 "5e771e2157ef6d29f16fd5de31a53638898790bd6de40efa33dbb59541a05ab4"

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
