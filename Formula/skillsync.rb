class Skillsync < Formula
  desc "One skill store for every AI coding agent"
  homepage "https://github.com/formenosland/skillsync"
  url "https://github.com/formenosland/skillsync/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "95f4c309a676622f968661b2cf025288135dad1943a6eb3ca15ebad39a9d86bc"
  license "MIT"
  head "https://github.com/formenosland/skillsync.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "git"

  def install
    libexec.install "bin", "registry"
    chmod 0755, libexec/"bin/skillsync"
    bin.install_symlink libexec/"bin/skillsync"
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
