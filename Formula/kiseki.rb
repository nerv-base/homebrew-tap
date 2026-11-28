# typed: false
# frozen_string_literal: true

class Kiseki < Formula
  desc "Universal anime-aesthetic terminal theming engine (Rust single binary)"
  homepage "https://kisekiterm.dev"
  version "2.0.0-beta.2"
  license "MIT"

  depends_on "oh-my-posh"
  depends_on "fastfetch"
  depends_on "zsh-syntax-highlighting"
  depends_on "zsh-autosuggestions"

  on_macos do
    on_arm do
      url "https://kisekiterm.dev/releases/v2.0.0-beta.2/kiseki-v2.0.0-beta.2-aarch64-apple-darwin.tar.gz"
      mirror "https://kiseki-dl.nerv-base.com/releases/v2.0.0-beta.2/kiseki-v2.0.0-beta.2-aarch64-apple-darwin.tar.gz"
      mirror "https://github.com/nerv-base/kiseki-terminal/releases/download/v2.0.0-beta.2/kiseki-v2.0.0-beta.2-aarch64-apple-darwin.tar.gz"
      sha256 "93537744cc88fbef6bf3536b12020af29ab989112af48cc987ac841bd10966d4"
    end

    on_intel do
      url "https://kisekiterm.dev/releases/v2.0.0-beta.2/kiseki-v2.0.0-beta.2-x86_64-apple-darwin.tar.gz"
      mirror "https://kiseki-dl.nerv-base.com/releases/v2.0.0-beta.2/kiseki-v2.0.0-beta.2-x86_64-apple-darwin.tar.gz"
      mirror "https://github.com/nerv-base/kiseki-terminal/releases/download/v2.0.0-beta.2/kiseki-v2.0.0-beta.2-x86_64-apple-darwin.tar.gz"
      sha256 "22d6bc8adc9e3a5a86ae72c6042907004dd00047c2fba6d23906da32ba798d4a"
    end
  end

  on_linux do
    on_arm do
      url "https://kisekiterm.dev/releases/v2.0.0-beta.2/kiseki-v2.0.0-beta.2-aarch64-unknown-linux-musl.tar.gz"
      mirror "https://kiseki-dl.nerv-base.com/releases/v2.0.0-beta.2/kiseki-v2.0.0-beta.2-aarch64-unknown-linux-musl.tar.gz"
      mirror "https://github.com/nerv-base/kiseki-terminal/releases/download/v2.0.0-beta.2/kiseki-v2.0.0-beta.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "97413272c605ded33456e3c0da29db049e0349aa2a2c2fb896b7a5c1a4d3bbcb"
    end

    on_intel do
      url "https://kisekiterm.dev/releases/v2.0.0-beta.2/kiseki-v2.0.0-beta.2-x86_64-unknown-linux-musl.tar.gz"
      mirror "https://kiseki-dl.nerv-base.com/releases/v2.0.0-beta.2/kiseki-v2.0.0-beta.2-x86_64-unknown-linux-musl.tar.gz"
      mirror "https://github.com/nerv-base/kiseki-terminal/releases/download/v2.0.0-beta.2/kiseki-v2.0.0-beta.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "12e7580204e7b1849e7ce624f976997188930a2f79a83cb106d7951ae4bff45e"
    end
  end

  def install
    bin.install "kiseki"
    pkgshare.install "NOTICE", "LICENSE.zsh-syntax-highlighting", "LICENSE.zsh-autosuggestions"
    generate_completions_from_executable(bin/"kiseki", "completions")
  end

  def caveats
    <<~EOS
      Run the interactive setup wizard to attach Kiseki to your terminal and shell:
        kiseki init
    EOS
  end

  test do
    assert_match "kiseki", shell_output("#{bin}/kiseki --version")
  end
end
