// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@deri-labs/core/contracts/Vault.sol";

contract ZkdxVault is Vault {

    constructor(
        address _priceFeed,
        uint256 _maxLeverage,
        uint256 _marginFeeBasisPoints,
        uint256 _longFundingRate,
        uint256 _shortFundingRate,
        uint256 _minProfitBasisPoints,
        uint256 _minProfitTime
    ) Vault (_priceFeed, _maxLeverage, _marginFeeBasisPoints, _longFundingRate, _shortFundingRate, _minProfitBasisPoints, _minProfitTime){}
}
