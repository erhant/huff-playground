// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import {Test} from "forge-std/Test.sol";

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
