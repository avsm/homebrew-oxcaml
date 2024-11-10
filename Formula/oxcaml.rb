class Oxcaml < Formula
  desc "Oxidized OCaml compiler and developer tools"
  homepage "https://github.com/oxcaml"
  url "https://github.com/avsm/homebrew-oxcaml.git", branch: "main"
  version "5.2.0+pre1-2"
  license "LGPL-2.1-only" => { with: "OCaml-LGPL-linking-exception" }

  bottle do
    root_url "https://github.com/avsm/homebrew-oxcaml/releases/download/oxcaml-5.2.0+pre1-1"
    sha256 arm64_sequoia: "af9443d53fb7bb2861632f3ea89334fc82d3029117fa7f08255ce8e23b2daba1"
    sha256 x86_64_linux:  "ff6c09f261abda58caeaca875722ef8534939ecf1e487b921a8ffb540128af3e"
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
