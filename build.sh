#!/bin/bash
# Build Nova Network using Golang.
echo "Building Nebula Testnet..."
make nebulatestnet-full

# Rename 'geth' to 'novanetwork' inside the 'build/bin' folder.
sudo mv build/bin/geth build/bin/nebula
