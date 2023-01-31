// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract SimpleAddTest is Test {
  SimpleAdd public simpleAdd;

  function setUp() public {
    simpleAdd = SimpleAdd(HuffDeployer.deploy("simple/SimpleAdd"));
  }

  function testAddition(uint256 a, uint256 b) public {
    uint c;
    unchecked {
      c = a + b; // need unchecked due to overflow/underflow
    }
    assertEq(simpleAdd.add(a, b), c);
  }
}

interface SimpleAdd {
  function add(uint256, uint256) external returns (uint256);
}
