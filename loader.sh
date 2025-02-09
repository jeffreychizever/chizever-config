#!/bin/bash
cwd=$(pwd)
set -euo pipefail
mkdir -p ~/workspace
cd ~/workspace
test -e chizever-config || git clone https://github.com/jeffreychizever/chizever-config
cd chizever-config
./setup.sh
rm $cwd/loader.sh
