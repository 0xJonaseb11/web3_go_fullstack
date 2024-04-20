// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface";

library PriceConverter {


    function getPrice() internal view returns(uint256) {
        // ABI
        //Address 
        AggregatorV3Interface priceFeed = AggregatorV3Interface(/**Address */); 
        // returns
        (/*uint80 roundId*/, int256  price, /*uint startedAt*/, /*uint timestamp*/, /*uint80 answeredInRound*/) = priceFeed.latestRoundData();
        // ETH in terms of USD
        // 3000.00000000
        return uint256(price * 1e10); // 1**10 == 10000000000 
    }

    function getVersion() internal view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV2Interface(/**Address */);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        // Always multiply before you divide
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }


}