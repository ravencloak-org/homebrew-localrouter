class Localrouter < Formula
  # Update `version` and each `sha256` on every release.
  # Release automation replaces the SHA256_* placeholders with the real
  # checksums of the matching `localrouter-<os>-<arch>` asset for the tag.
  desc "Headless core for LocalRouter"
  homepage "https://github.com/ravencloak-org/LocalRouter"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-darwin-arm64"
      sha256 "f6c589ba12f37800043dd05625c9b774453607fcb5c33adb3d52785ca1200c23"

      def install
        bin.install "localrouter-darwin-arm64" => "localrouter"
      end
    end
    on_intel do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-darwin-x64"
      sha256 "b4f3338bb23cf4dde1bdcae734e2951e783f3e6189ca30e8c663163d40a6d8ea"

      def install
        bin.install "localrouter-darwin-x64" => "localrouter"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-linux-arm64"
      sha256 "66da98ff9c0567e6a8ffc591a62f5e72a6da9b5a1504023df443be0e6c5f15eb"

      def install
        bin.install "localrouter-linux-arm64" => "localrouter"
      end
    end
    on_intel do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-linux-x64"
      sha256 "7990654a44c05418e0857f11b263ed4323f70d52bcd5e3eeb0f6b2acfd0b4bdf"

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
