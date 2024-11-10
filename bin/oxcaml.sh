#!/bin/bash

ROOT=${1:-%%PREFIX%%}

export OPAMROOT="${ROOT}"
export OPAMYES=1
set -ex

if [[ ! -d "${ROOT}" ]]
then
  echo Initialising opam for OxCaml
  mkdir -p "${ROOT}"
  opam init -n --bare --disable-sandboxing
  opam switch create oxcaml --empty
  #  opam repo add with-extensions "https://github.com/janestreet/opam-repository.git#with-extensions"
  #  remove once https://github.com/janestreet/opam-repository/pull/34 is merged
  opam repo add with-extensions "https://github.com/avsm/janestreet-opam-repository.git#with-extensions"
  opam install -v ocaml-variants.5.2.0+flambda2 ocaml-lsp-server
  opam clean -rsc --logs
fi
