#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail

git clone --depth 1 https://github.com/fluencelabs/examples.git examples || true
git clone --depth 1 https://github.com/fluencelabs/aqua-playground.git aqua-playground || true
git clone --depth 1 https://github.com/fluencelabs/fluentpad.git fluentpad || true

echo '
=======
Source code to learn from:
    fluence/examples         –  AIR + Rust examples                      
    fluence/aqua-playground  –  Aqua + Typescript examples              
    fluence/fluentpad        -  Frontend + backend project written in Aqua
'
