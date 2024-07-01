// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@deri-labs/core/contracts/OrderBook.sol";

contract ZkdxOrderBook is OrderBook {

    using SafeERC20 for IERC20;

    uint256 public orderFeeBasisPoints;
    mapping(address => uint256) public orderFees;

    constructor(address _vault, uint256 _minExecutionFee) OrderBook(_vault, _minExecutionFee) {}

    function createIncreaseOrder(
        uint256 _collateralDelta,
        address _indexToken,
        uint256 _sizeDelta,
        address _collateralToken,
        bool _isLong,
        uint256 _triggerPrice,
        bool _triggerAboveThreshold
    ) public payable override {
        if (orderFeeBasisPoints > 0) {
            uint256 fee = (_collateralDelta * orderFeeBasisPoints) / 10000;
            IERC20(_collateralToken).transferFrom(msg.sender, address(this), fee);
            orderFees[_collateralToken] += fee;
            _collateralDelta -= fee;
        }
        super.createIncreaseOrder(
            _collateralDelta,
            _indexToken,
            _sizeDelta,
            _collateralToken,
            _isLong,
            _triggerPrice,
            _triggerAboveThreshold
        );
    }

    function setOrderFeeBasisPoints(uint256 _orderFeeBasisPoints) public onlyOwner {
        orderFeeBasisPoints = _orderFeeBasisPoints;
    }

    function withdrawOrderFee(address _token, address _receiver, uint256 _amount) public onlyOwner {
        IERC20(_token).safeTransfer(_receiver, _amount);
    }
}
