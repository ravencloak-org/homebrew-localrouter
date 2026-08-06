class Localrouter < Formula
  # Update `version` and each `sha256` on every release.
  # Release automation replaces the SHA256_* placeholders with the real
  # checksums of the matching `localrouter-<os>-<arch>` asset for the tag.
  desc "Headless core for LocalRouter"
  homepage "https://github.com/ravencloak-org/LocalRouter"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-darwin-arm64"
      sha256 "63e550a762be335e6d094053c1917265fcc97958c117bd81ac1459bbcf8611d2"

      def install
        bin.install "localrouter-darwin-arm64" => "localrouter"
      end
    end
    on_intel do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-darwin-x64"
      sha256 "9c5fb6540f50681245d78c4d6e4af1e0b96ce060fb5994876a4690e22cf0ba22"

      def install
        bin.install "localrouter-darwin-x64" => "localrouter"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-linux-arm64"
      sha256 "ed691615b19c1ef1b8547f90f10b28b773d975e7e324af911df3906c051cf2ed"

      def install
        bin.install "localrouter-linux-arm64" => "localrouter"
      end
    end
    on_intel do
      url "https://github.com/ravencloak-org/LocalRouter/releases/download/v#{version}/localrouter-linux-x64"
      sha256 "a72b6508962b5120688d1df20a2dae0cddd13943c3dde2d48940cc1d7cc51579"

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
