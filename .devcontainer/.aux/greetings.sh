#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail

echo -e '
=========
Welcome to the Fluence devcontainer!
To download example projects, run ./.devcontainer/.aux/download_examples.sh
Available tools:
    $ marine           – build wasm from Rust
    $ marine repl      – run wasm services locally
    $ aqua-cli         – compile Aqua to AIR + Typescript
    $ fldist           – deploy & query services
    
Have fun!
'
