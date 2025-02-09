#!/bin/bash
cwd=$(pwd)
set -euo pipefail
mkdir -p ~/workspace
cd ~/workspace
test -e chizever-config || git clone https://github.com/jeffreychizever/chizever-config
cd chizever-config
./setup.sh
# delete the loader, unless it was executed from within the package for testing purposes.
echo $cwd | grep -q chizever-config || rm $cwd/loader.sh
