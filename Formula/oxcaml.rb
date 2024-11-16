class Oxcaml < Formula
  desc "Oxidized OCaml compiler and developer tools"
  homepage "https://github.com/oxcaml"
  url "https://github.com/avsm/homebrew-oxcaml.git", branch: "main"
  version "5.2.0+pre2"
  license "LGPL-2.1-only" => { with: "OCaml-LGPL-linking-exception" }

  bottle do
    root_url "https://github.com/avsm/homebrew-oxcaml/releases/download/oxcaml-5.2.0+pre1-3"
    sha256 arm64_sequoia: "1bc3618b63332e27da3ac8e58af194607c217424bc8be55a0219b39c3608ee9f"
    sha256 x86_64_linux:  "7b542a55a66771aad839b007f568d7b73438e0fd716d04693d853c55d75e1882"
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
