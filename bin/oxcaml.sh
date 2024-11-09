#!/bin/bash -e

ROOT=${1:-%%PREFIX%%}

export OPAMROOT="${ROOT}/.opam"
export OPAMYES=1

if [[ ! -d "${ROOT}" ]]; then
  echo Initialising opam for OxCaml
  mkdir -p "${ROOT}"
  opam init -n --bare
  opam switch create oxcaml --empty
  opam repo add with-extensions "https://github.com/janestreet/opam-repository.git#with-extensions"
  opam install -y ocaml-variants.5.2.0+flambda2 ocaml-lsp-server
fi
