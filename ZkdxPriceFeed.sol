// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@deri-labs/core/contracts/PriceFeed.sol";

contract ZkdxPriceFeed is PriceFeed {

    constructor(uint256 _validTime) PriceFeed(_validTime) {}
}