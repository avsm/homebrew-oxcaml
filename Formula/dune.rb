class Dune < Formula
  desc "Developer preview of the Dune build system with package management"
  homepage "https://preview.dune.build"
  url "https://github.com/ocaml/dune.git", tag: "3.17.0"
  version "3.17.0"
  license "LGPL-2.1-only" => { with: "OCaml-LGPL-linking-exception" }

  bottle do
    root_url "https://github.com/avsm/homebrew-oxcaml/releases/download/dune-3.17+dev-2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fbfbed7c1db67175eee795863b1c526dcf70a26e66900fe21a4a184343fe3c48"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8bd1abaa8d5a767aa51e8e53f5f40ecfbdd3070b34ce81eb4a1c00477dd58daa"
  end

  depends_on "ocaml"

  def install
    system "ocaml", "boot/configure.ml", "--pkg-build-progress", "enable", "--lock-dev-tool", "enable"
    system "ocaml", "boot/bootstrap.ml"
    system "./_boot/dune.exe", "build", "dune.install", "--release", "--profile", "dune-bootstrap"
    bin.install "_build/default/bin/dune.exe" => "dunex"
  end
end
