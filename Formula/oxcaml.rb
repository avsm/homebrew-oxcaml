class Oxcaml < Formula
  desc "Oxidized OCaml compiler and developer tools"
  homepage "https://github.com/oxcaml"
  url "https://github.com/avsm/homebrew-oxcaml.git", branch: "main"
  version "5.2.0+pre1"
  license "LGPL-2.1-only" => { with: "OCaml-LGPL-linking-exception" }

  bottle do
    root_url "https://github.com/avsm/homebrew-oxcaml/releases/download/oxcaml-5.2.0+with-extensions"
    sha256 arm64_sequoia: "c9b4a3c5aaad1a06b31269da735ebf58f01bd8f9aadb39681b31a2cafcd6d229"
    sha256 x86_64_linux:  "df4d8c24da8b721147dd480abf160ae8fc642e082cb5bf52be02f0f50ce82b6c"
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
