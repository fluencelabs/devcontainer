#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail

mkdir -p fluence || true
git clone --depth 1 https://github.com/fluencelabs/examples.git fluence/examples
git clone --depth 1 https://github.com/fluencelabs/aqua-playground.git fluence/aqua-playground
git clone --depth 1 https://github.com/fluencelabs/fluentpad.git fluence/fluentpad

echo "Source code to learn from:"
echo "\t AIR + Rust examples:\t fluence/examples"
echo "\t Aqua + Typescript examples:\t fluence/aqua-playground"
echo "\t Frontend + backend project written in Aqua:\t fluence/fluentpad"
