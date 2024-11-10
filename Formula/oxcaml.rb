class Oxcaml < Formula
  desc "Oxidized OCaml compiler and developer tools"
  homepage "https://github.com/oxcaml"
  url "https://github.com/avsm/homebrew-oxcaml.git", branch: "main"
  version "5.2.0+pre1-3"
  license "LGPL-2.1-only" => { with: "OCaml-LGPL-linking-exception" }

  bottle do
    root_url "https://github.com/avsm/homebrew-oxcaml/releases/download/oxcaml-5.2.0+pre1-2"
    sha256 arm64_sequoia: "5050045e2bbe73988caeb4ba36759c3d946dea853a98896b2425ba7c12fee9b9"
    sha256 x86_64_linux:  "a6cd03f2aaecaaad6f3dacbaafd3afa98a8c71dc116ab3e724544f4e00ebf3c7"
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
