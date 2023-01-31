// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract Challenge01Test is Test {
  Challenge01 target;

  function setUp() public {
    target = Challenge01(HuffDeployer.deploy("challenges/Challenge01"));
  }

  function testChallenge() public {
    assertEq(target.call(), block.number);
  }
}

interface Challenge01 {
  function call() external view returns (uint256);
}
