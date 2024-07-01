// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@deri-labs/core/contracts/PositionManager.sol";

contract ZkdxPositionManager is PositionManager {

    constructor(address _vault, address _priceFeed, uint256 _minLiquidationFee) PositionManager(_vault, _priceFeed, _minLiquidationFee) {}
}
