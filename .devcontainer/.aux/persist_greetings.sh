#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail

# WHERE could be /etc/bash.bashrc
WHERE="$1"
GREETINGS="$(bash greetings.sh)"

echo -e '\n#Fluence greetings text' >>"$WHERE"
echo "echo -e '$GREETINGS'" >>"$WHERE"
