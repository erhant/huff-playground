# Huff Playground

> Huff is a low-level programming language designed for developing highly optimized smart contracts that run on the Ethereum Virtual Machine (EVM). Huff does not hide the inner workings of the EVM and instead exposes its programming stack to the developer for manual manipulation.

This repository is a playground for Huff.

For more Huffing, see:

- [Huff by Example](https://docs.huff.sh/get-started/huff-by-example/#introduction)
- [Awesome Huff](https://github.com/devtooligan/awesome-huff)
- [Huffmate](https://github.com/pentagonxyz/huffmate)

## Usage

- `forge install` will install required packages.
- `forge build` will compile the Huff code under `src` folder.
- `forge test` will run tests under `test` folder.
  - `--match-contract <contract-name>` option will run test contracts with the matching names.
