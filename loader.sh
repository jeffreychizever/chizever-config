#!/bin/bash
cwd=$(pwd)
set -euo pipefail
mkdir -p ~/workplace
cd ~/workplace
git clone TODO
cd chizever-config
./setup.sh
rm $cwd/loader.sh
