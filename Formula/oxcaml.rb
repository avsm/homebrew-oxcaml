class Oxcaml < Formula
  desc "Oxidized OCaml extensions from Jane Street"
  homepage "https://oxcaml.org/"
  url "https://oi.ci.dev/repo/src/oxcaml-5.2.0minus31-3416edee6.tar.gz"
  version "5.2.0minus31"
  sha256 "688b5a03c04e834b5a4166a2963ee16f67019c2130baa83cfef73d5562fdde5a"
  license "LGPL-2.1-or-later"

  keg_only "it provides a parallel OCaml toolchain that conflicts with the `ocaml` formula"

  depends_on "autoconf" => :build
  depends_on "gnu-tar" => :build
  depends_on "m4" => :build
  depends_on "rsync" => :build
  depends_on "zstd"

  def install
    system "make", "PREFIX=#{prefix}", "JOBS=#{ENV.make_jobs}"
    system "make", "install", "PREFIX=#{prefix}", "JOBS=#{ENV.make_jobs}"
  end

  def caveats
    <<~EOS
      oxcaml is keg-only and is not linked into #{HOMEBREW_PREFIX}, to
      avoid clashing with the `ocaml` formula. To use this toolchain add
      it to your PATH, or use the `oi` tool:

        export PATH="#{opt_bin}:$PATH"
    EOS
  end

  test do
    assert_match "5.2", shell_output("#{bin}/ocaml -version")
    (testpath/"hello.ml").write 'let () = print_string "hello"'
    system bin/"ocamlopt", "-o", "hello", "hello.ml"
    assert_equal "hello", shell_output("./hello")
  end
end
