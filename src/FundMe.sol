// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FundMe {

    function fund() public payable {

        uint256 public minimumUsd = 50;
        // Want to be able to set a minimum fund amount in USD
        require(msg.value > minimumUsd, "Didn't send enough funds");
        


        
    }

    function withdraw() {}
}