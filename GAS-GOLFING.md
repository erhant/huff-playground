# Gas Golfing

In this file, I plan to collect some gas optimization tricks. These are mostly at Huff-level or Yul-level, rather than Solidity-level.

- **Pushing a Zero**: Normally you can write `0x0` in Huff, which will translate into `PUSH1 0x0`, costing 3 gas via PUSH1. However, if you have not called any external function so far, `RETURNDATASIZE` will result in `0x0` too, and it only costs 2 gas.

- **Efficiently Killing the Gas**: Suppose you would like to consume all gas in a call. Do you write an infinite loop? Well, there are much more efficient ways to kill the gas:
  - `mstore(not(0), 1)` will try to store `0x01` at the latest slot of memory: `0xFFFF..FF`. However, doing that will increase the memory cap, which is costly! It will finish all the gas in no time.
  - `mload(not(0))` serves the same purpose, as loading from that place will do the same memory cap increase.
  - You can also cause gas consumption via calling any invalid opcode, or just `INVALID`.
