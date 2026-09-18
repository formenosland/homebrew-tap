class Skillsync < Formula
  desc "One skill store for every AI coding agent"
  homepage "https://github.com/formenosland/skillsync"
  url "https://github.com/formenosland/skillsync/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "7f2dfd2058d325b0984bc52cb4198873767ad50a4b1b8c7c073ac6e73a5506ff"
  license "MIT"
  head "https://github.com/formenosland/skillsync.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/skillsync"
  end

  def caveats
    <<~EOS
      Link agent views once:
        skillsync init
      brew uninstall skillsync removes only the CLI.
      It does not unlink agents or delete the skills store, config, or other
      library files under ~/.local/share/skillsync.
      To unlink agents: skillsync uninstall
      To erase store/config: skillsync uninstall --purge
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skillsync --version")
  end
end
