#!/bin/bash

LOCALDIR=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`
TOOLS_DIR="$LOCALDIR/tools"
PREB_DIR="$LOCALDIR/prebuilt"

git submodule update --init --recursive
git pull --recurse-submodules
git clone https://github.com/OniiGSIs/vendor_vndk "$PREB_DIR"/vendor_vndk
if [[ -d "$TOOLS_DIR/Firmware_extractor" ]]; then
    git -C "$TOOLS_DIR"/Firmware_extractor fetch origin
    git -C "$TOOLS_DIR"/Firmware_extractor reset --hard origin/master
else
    git clone -q https://github.com/AndroidDumps/Firmware_extractor "$TOOLS_DIR"/Firmware_extractor
fi
