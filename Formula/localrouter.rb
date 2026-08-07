class Localrouter < Formula
  # Update `version` and each `sha256` on every release.
  # Release automation replaces the SHA256_* placeholders with the real
  # checksums of the matching `localrouter-<os>-<arch>` asset for the tag.
  desc "Headless core for LocalRouter"
  homepage "https://github.com/ravencloak-org/LocalRouter"
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-darwin-arm64"
      sha256 "bd61132a161aaed043679a50c756356e8109922dc16bb5a775d111ef3a363f18"

      def install
        bin.install "localrouter-darwin-arm64" => "localrouter"
      end
    end
    on_intel do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-darwin-x64"
      sha256 "41b12ae2d7739066c4db6b802b595660770492036909c82fbc69ea268454142f"

      def install
        bin.install "localrouter-darwin-x64" => "localrouter"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-linux-arm64"
      sha256 "30b8aefe5bdc0601bad2306f80dc5fa202384c2075c8174da9a75db52c17f1b8"

      def install
        bin.install "localrouter-linux-arm64" => "localrouter"
      end
    end
    on_intel do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-linux-x64"
      sha256 "3983d5d04c441dc74cce228dba81ea09bb7fd06287b9bda7dfd968701886fc76"

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
