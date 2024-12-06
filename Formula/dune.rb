class Dune < Formula
  desc "Developer preview of the Dune build system with package management"
  homepage "https://preview.dune.build"
  url "https://github.com/ocaml/dune.git", tag: "3.17.0"
  license "LGPL-2.1-only" => { with: "OCaml-LGPL-linking-exception" }

  bottle do
    root_url "https://github.com/avsm/homebrew-oxcaml/releases/download/dune-3.17.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "471e3e840202aade916122b0081f191c8ec74ba2d6ff2a6ea0bb9966e7d4d8d0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f5d8e2d9adb4ce06241f476998540cff12b34d15af4fc344e82728562e34e075"
  end

  depends_on "ocaml"

  def install
    system "ocaml", "boot/configure.ml", "--pkg-build-progress", "enable", "--lock-dev-tool", "enable"
    system "ocaml", "boot/bootstrap.ml"
    system "./_boot/dune.exe", "build", "dune.install", "--release", "--profile", "dune-bootstrap"
    bin.install "_build/default/bin/dune.exe" => "dunex"
  end
end
