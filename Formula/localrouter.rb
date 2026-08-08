class Localrouter < Formula
  # Update `version` and each `sha256` on every release.
  # Release automation replaces the SHA256_* placeholders with the real
  # checksums of the matching `localrouter-<os>-<arch>` asset for the tag.
  desc "Headless core for LocalRouter"
  homepage "https://github.com/ravencloak-org/LocalRouter"
  version "0.1.12"

  on_macos do
    on_arm do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-darwin-arm64"
      sha256 "19c7603a7e861fcb9d8107bb4b2cc2fd58957417985aaf27ea236f2240b89563"

      def install
        bin.install "localrouter-darwin-arm64" => "localrouter"
      end
    end
    on_intel do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-darwin-x64"
      sha256 "0acf59e97ab702759e468949e732ca560d32fc5b7c72f6f04ca742b991f9c225"

      def install
        bin.install "localrouter-darwin-x64" => "localrouter"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-linux-arm64"
      sha256 "06ebb8d9bdd1627bdee7e89516cd1efcd58901e6eec63dee160c6b2f75cee89a"

      def install
        bin.install "localrouter-linux-arm64" => "localrouter"
      end
    end
    on_intel do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-linux-x64"
      sha256 "8e0ec1f9b7b3d2818b1d40d917c44e260539fdff5fb432718cf125c4be8866f7"

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
