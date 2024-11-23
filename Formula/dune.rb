class Dune < Formula
  desc "Developer preview of the Dune build system with package management"
  homepage "https://preview.dune.build"
  url "https://github.com/ocaml/dune.git", branch: "main"
  version "3.17+dev-2"
  license "LGPL-2.1-only" => { with: "OCaml-LGPL-linking-exception" }

  bottle do
    root_url "https://github.com/avsm/homebrew-oxcaml/releases/download/dune-3.17+dev"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "322901b53dbfdbe442e6e1493cc93a036e1f3fc84a696adf9ff7d9125703c383"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4f0389e68db4e2d72f47afbe03adc7a5d20556db467b41ab5695657134adca20"
  end

  depends_on "ocaml"

  def install
    system "ocaml", "boot/configure.ml", "--pkg-build-progress", "enable", "--lock-dev-tool", "enable"
    system "ocaml", "boot/bootstrap.ml"
    system "./_boot/dune.exe", "build", "dune.install", "--release", "--profile", "dune-bootstrap"
    bin.install "_build/default/bin/dune.exe" => "dunex"
  end
end
