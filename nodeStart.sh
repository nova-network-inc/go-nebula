#!/bin/bash

# This script will start a Nebula Testnet node in your machine. You will still have
# to set up your sync enode with your validator key to connect to the mainnet.
# This script requires elevated access privileged (CHMOD 777).

# Welcome Message
echo "Welcome to Nebula Testnet!"
echo ""
echo "Starting 1/2 - Configuring the network genesis block..."
nebula --datadir .dag init nebulatestnet
echo ""

# Starting Nebula Testnet
echo "Starting 2/2 - Starting your Nebula Testnet node..."
nebula --datadir .dag --networkid "87" --config "nebulatestnet.toml" --nodiscover --maxpeers "1" --syncmode "snap" --ipcdisable --miner.etherbase "0x000000000000000000000000000000000000dEaD"
