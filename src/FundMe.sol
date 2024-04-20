// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface";
contract FundMe {


        uint256 public minimumUsd = 50 * 1e18;

        address[] public funders;

        mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {

        // Want to be able to set a minimum fund amount in USD
        require(msg.value > minimumUsd, "Didn't send enough funds");     
        funders.push(msg.sender);   
        addressToAmountFunded[msg.sender] = msg.value;
    }

    

    function withdraw() private {}
}