// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract Challenge02Test is Test {
  address target;

  function setUp() public {
    target = HuffDeployer.deploy("challenges/Challenge02");
  }

  function testChallenge(uint256 n) public {
    (bool s, bytes memory d) = target.call(abi.encode(n));
    assertEq(s, true);

    // just check last byte since this is a bool
    bool result = d[31] == 0x01;
    assertEq(result, n % 2 == 0);
  }
}
