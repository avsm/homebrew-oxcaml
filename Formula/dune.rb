class Dune < Formula
  desc "Dune developer preview"
  homepage "https://preview.dune.build"
  url "https://github.com/ocaml/dune.git", branch: "main"
  version "3.17+dev"
  license "LGPL-2.1-only" => { with: "OCaml-LGPL-linking-exception" }

  depends_on "ocaml"

  def install
    system "ocaml", "boot/configure.ml", "--pkg-build-progress", "enable", "--lock-dev-tool", "enable"
    system "ocaml", "boot/bootstrap.ml"
    system "./_boot/dune.exe", "build", "dune.install", "--release", "--profile", "dune-bootstrap"
    bin.install "_build/default/bin/dune.exe" => "dunex"
  end
end
