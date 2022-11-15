#!/bin/bash

# This script will start a Nebula Testnet node in your machine. You will still have
# to set up your sync enode with your validator key to connect to the mainnet.
# This script requires elevated access privileged (chmod 755).

# Welcome Message
echo "Welcome to Nebula Testnet!"
echo ""
echo "Starting 1/2 - Configuring the network genesis block..."
nebula --datadir .dag init nebulatestnet
echo ""

# Starting Nebula Testnet
echo "Starting 2/2 - Starting your Nebula Testnet RPC node..."
nebula --datadir .dag --networkid "87" --config "nebulatestnet.toml" --rpc.allow-unprotected-txs --nodiscover --maxpeers "1" --syncmode "full" --ipcdisable --graphql --graphql.corsdomain "*" --graphql.vhosts "*" --http.port "8545" --http --http.addr "0.0.0.0" --http.corsdomain "*" --http.vhosts "*" --http.api "eth,net,web3"  --ws --ws.addr "0.0.0.0" --ws.origins "*" --ws.api "eth,net,web3" --miner.etherbase "0x000000000000000000000000000000000000dEaD"
