// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface";

import { PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundMe {

    using PriceConverter for uint256;


        uint256 public constant MINIMUM_USD = 50 * 1e18;

        address[] public funders;

        address public immutable i_owner;

        mapping(address => uint256) public addressToAmountFunded;

        constructor() {
            i_owner = msg.sender;
        }

        modifier onlyOwner() {
            require(i_owner == msg.sender, "Only owner can call this function");
           

            /// alternative
            if (msg.sender != i_owner) {
                revert NotOwner();
            }
             _;
        }

    function fund() public payable {

        // Want to be able to set a minimum fund amount in USD
        require(msg.value.getConversionRate() > MINIMUM_USD, "Didn't send enough funds");     
        funders.push(msg.sender);   
        addressToAmountFunded[msg.sender] = msg.value;
    }
    function withdraw() public onlyOwner {
        /** starting index, ending index, step amount */
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // reset array
        funders = new address[](0); 

        // Actually withdraw funds

        // transfer
        payable(msg.sender).transfer(address(this).balance);
        // send
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Send Failed");
        
        // call -- Recommended
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("")
        require(callSucess, "Call Failed");



    }
}