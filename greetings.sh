#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail

echo -e '\n#Fluence greetings text' >>/etc/bash.bashrc
echo 'echo -e "\n=========\nWelcome to the Fluence devcontainer!"' >>/etc/bash.bashrc
echo 'echo -e "To download example projects, run /download_examples.sh"' >>/etc/bash.bashrc
echo 'echo -e "Available tools:"' >>/etc/bash.bashrc
echo 'echo -e "$ marine           – build wasm from Rust"' >>/etc/bash.bashrc
echo 'echo -e "$ marine repl      – run wasm services locally"' >>/etc/bash.bashrc
echo 'echo -e "$ aqua-cli         – compile Aqua to AIR + Typescript"' >>/etc/bash.bashrc
echo 'echo -e "$ fldist           – deploy & query services"' >>/etc/bash.bashrc
echo 'echo -e "\nHave fun!"' >>/etc/bash.bashrc
