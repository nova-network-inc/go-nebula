# Nebula Testnet

Nova Network is a open-source DAG programable smart contracts platform built for decentralised and enterprise-level applications, in one highly scalable ecosystem. Nova Network is home to digital money, decentralised infrastructure, and applications, ready and built to scale for global usage and adoption. It is compatible and interoperable with Ethereum and other EVM networks, and Solidity is natively compatible, making it easy and quick for Ethereum developers to build, deploy, or fork from existing open-source infrastructure built on other networks.

For automated building and using of Nova Network, please refer to our Node Management Software available at https://github.com/nova-network-inc/nova-network-node-manager.

## Building Nova Network

Building Nova Network will require you to have previously installed Go (v16+) and a C compiler. Once the dependencies have been installed, you can run:

```shell
make novanetwork
```

And if you prefer to build the full suite of tools, you can use:

```shell
make novanetwork-full
```

You can also build the development tools suite by running:

```shell
make novanetwork-devtools
```

## Running Nova Network

Enumerating all available flags is outside of the scope of this tutorial, but we have listed a few and common parameters you can use to get your Nova Network up and running.

### Hardware Requirements

Minimum Requirements:

* CPU With 2+ Cores
* 4GB RAM
* 500GB of free storage to sync with Nova Network
* 8 MBit/sec download Internet service

Recommended Specs:

* Fast CPU With 4+ Cores
* 16GB+ RAM
* High Performance SSD with at least 1TB free space
* 25+ MBit/sec download Internet service

### Starting a Nova Network Node

Before running the start command, please make sure you have downloaded or created your genesis file, and placed it within the main directory of Nova Network. Failing to do that will make impossible for you to start your node.

```shell
geth --datadir .nova-network-db init novanetwork && geth --datadir .nova-network-db --networkid "87"
```

You can replace, remove, or add your own flags to the command above.

## More Information

For more information, you can visit our documents library available at https://docs.novanetwork.io or reach out directly to our support team.

