// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SafeMathTester {
    uint8 public bigNumber = 255; // unchecked || checked
    /**
    * Unchecked means when a number is at its maximum and you tend to 
    * increment it, it resets to zero - which is not a good idea
    * In version below 0.8.0, it remains unchecked unlike above version 0.8.0
     */

     function add() public {
        unchecked {
            bigNumber = bigNumber + 1;
        } // gas effecient
       
     }

}