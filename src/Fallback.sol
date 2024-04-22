// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Fallback {
    uint256 public result;

    // receive()
    receive() external payable {
        result = 1;
    }

    // fallback
    Fallback() external payable {
        result = 2;
    }
}