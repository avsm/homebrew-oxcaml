class Oxcaml < Formula
  desc "Oxidized OCaml compiler and developer tools"
  homepage "https://github.com/oxcaml"
  url "https://github.com/avsm/homebrew-oxcaml.git", branch: "main"
  version "5.2.0+pre1"
  license "LGPL-2.1-only" => { with: "OCaml-LGPL-linking-exception" }

  bottle do
    root_url "https://github.com/avsm/homebrew-oxcaml/releases/download/oxcaml-5.2.0+pre1"
    rebuild 1
    sha256 arm64_sequoia: "69e8adf3c555130368efb5ba80612fc701a9294347cf5f91b85ceef4a8648cdf"
    sha256 x86_64_linux:  "58a49e7d53a5c9e9ed7edb95f536ae800df97db6cd81a0b88c2addf5dba33781"
  end

  depends_on "autoconf"
  depends_on "gpatch"
  depends_on "opam"

  def install
    inreplace "bin/oxcaml.sh", "%%PREFIX%%", "#{prefix}/opam"
    system "bash", "bin/oxcaml.sh"
    inreplace "bin/oxpam", "%%PREFIX%%", "#{prefix}/opam"
    bin.install "bin/oxpam"
  end
end
