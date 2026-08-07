class Localrouter < Formula
  # Update `version` and each `sha256` on every release.
  # Release automation replaces the SHA256_* placeholders with the real
  # checksums of the matching `localrouter-<os>-<arch>` asset for the tag.
  desc "Headless core for LocalRouter"
  homepage "https://github.com/ravencloak-org/LocalRouter"
  version "0.1.10"

  on_macos do
    on_arm do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-darwin-arm64"
      sha256 "6adf3f14cfa052c8d4429c236a92131c9f9b79afc57b53e55a10964638f8f338"

      def install
        bin.install "localrouter-darwin-arm64" => "localrouter"
      end
    end
    on_intel do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-darwin-x64"
      sha256 "44ab9eb43739ca8b455d24f222b060f8183f28acc022e1ba0ed4f340bf83b009"

      def install
        bin.install "localrouter-darwin-x64" => "localrouter"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-linux-arm64"
      sha256 "74ca58f78ead229bbf9e4a233a0429b027dc80322cf16b11738b628a2043e0bb"

      def install
        bin.install "localrouter-linux-arm64" => "localrouter"
      end
    end
    on_intel do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-linux-x64"
      sha256 "394b5eed814cb54480947b1467570bbfdeed6530258e3ebbbfd141a9ec9baa33"

      def install
        bin.install "localrouter-linux-x64" => "localrouter"
      end
    end
  end

  def caveats
    <<~EOS
      LocalRouter requires the Claude CLI to be installed and logged in:
        https://docs.anthropic.com/en/docs/claude-code

      Run the core with:
        localrouter
    EOS
  end

  test do
    assert_match "localrouter", shell_output("#{bin}/localrouter --version", 0)
  end
end
