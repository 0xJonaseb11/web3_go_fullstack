// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface";
contract FundMe {

    function fund() public payable {

        uint256 public minimumUsd = 50;
        // Want to be able to set a minimum fund amount in USD
        require(msg.value > minimumUsd, "Didn't send enough funds");        
    }

    function getPrice() public view returns(uint256) {
        // ABI
        //Address 
        AggregatorV3Interface priceFeed = AggregatorV3Interface(/**Address */); 
        // returns
        (/*uint80 roundId*/, int256  price, /*uint startedAt*/, /*uint timestamp*/, /*uint80 answeredInRound*/) = priceFeed.latestRoundData();
        // ETH in terms of USD
        // 3000.00000000
        return uint256(price * 1e10) // 1**10 == 10000000000 
    }

    function getVersion() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV2Interface(/**Address */);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        // Always multiply before you divide
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }


    function withdraw() {}
}