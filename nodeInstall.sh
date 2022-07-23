#!/bin/bash

# This script will install all the required packages for running a Nebula Testnet
# node, as well as setting all the necessary environment variables.
# This script requires elevated access privileged (CHMOD 777), please run:
# chmod 777 nodeInstall.sh before launching, and then bash nodeInstall.sh to start.

minRAM=8                 # Minimum RAM requirements in GB
minDisk=200              # Minimum Disk space requirements in GB
reqOS=Ubuntu             # Required OS
minOSver=20.04           # Minimum OS version

# Welcoming message.
echo "Welcome to Nebula Testnet Installation Script"
echo ""
echo "This script will install all dependencies required"
echo "for you to run a Nebula Testnet node."
echo ""

# Sanity Check 1 - Do we have enough free disk space?
echo "Minimum Requirements 1/4 - Checking your available disk space..."
currDisk=`df -H --output=avail "$PWD" | tail -n 1 | tr -d " " | tr -d "G"`
if [[ ${currDisk} -lt ${minDisk} ]]
then
  echo "Minimum Disk Space Required = ${minDisk}GB, Available ${currDisk}GB. Aborting."
  exit
else
  echo "You have enough available disk space to continue."
fi

echo ""

# Sanity Check 2 - Do we have enough RAM memory?
echo "Minimum Requirements 2/4 - Checking your available RAM..."
currRAM=`free -g | grep -oP '\d+' | head -n 1`
if [[ ${currRAM} -lt ${minRAM} ]]
then
  echo "Minimum RAM Required = ${minRAM}GB, Available ${currRAM}GB. Aborting."
  exit
else
  echo "You have enough RAM available to continue."
fi

""

# Sanity Check 3 - Do we have the correct OS?
echo "Minimum Requirements 3/4 - Checking your OS..."
currOS=`cat /etc/os-release | grep ^NAME= | tr -d "NAME=" | tr -d "\""`
if [[ ${currOS} != ${reqOS} ]]
then
  echo "Required OS is ${reqOS}, but current OS is ${currOS}. Aborting."
  exit
else
  echo "You are running a compatible OS."
fi

""

# Sanity Check 4 - Does the OS version meet minimum requirements?
echo "Minimum Requirements 4/4 - Checking your OS version..."
currOSver=`cat /etc/os-release | grep VERSION_ID | tr -d "VERSION_ID=" | tr -d "\""`
if (( $(echo "$currOSver < $minOSver" | bc -l) ))
then
  echo "Current OS version ${currOSver} does not meet minimum version ${minOSver} requirement. Aborting."
  exit
else
  echo "Your OS version is compatible."
fi

echo "Your machine has passed all the minimum requirements checks."
echo "Proceeding to the installation process..."
echo ""

# Sanity checks passed! Start installing packages.

# Install a backup instance of Go-Ethereum for dependencies.
echo "Installing 1/5 - Downloading dependencies..."
sudo apt-get upgrade
sudo apt-get update

# Install Golang to be able to build Go Nova.
echo "Installing 2/5 - Installing Golang..."
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt upgrade
sudo apt install golang-go
sudo apt install make

# Install Screen to be able to run the node on a detached screen.
echo "Installing 3/5 - Installing Screen..."
sudo apt install screen

# Download genesis block to start the network.
echo "Installing 4/5 - Downloading Genesis Block and TOML..."
wget https://novanetwork.io/download/271BD152B3C22467FA81F5F35B5EB9B6B9C2C827349E627B7B794DE8690707BA/nebulatestnet
wget https://novanetwork.io/download/271BD152B3C22467FA81F5F35B5EB9B6B9C2C827349E627B7B794DE8690707BA/nebulatestnet.toml

# Build Go Nova using Golang.
echo "Installing 5/5 - Building Go Nova..."
make novanetwork-full
sudo chmod 777 build/bin/geth
sudo mv build/bin/geth build/bin/nebula
sudo chmod 777 build/bin/nebula
sudo mv build/bin/nebula /usr/bin

# Cleanup the screen.
clear

# Display finished message.
echo "The installation script has finished. Thank you for installing Nebula Testnet."
echo "You can start your node by running the nodeStart.sh script."
echo ""
