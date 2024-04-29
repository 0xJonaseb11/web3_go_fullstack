// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DigitalWallet {
    
    struct Wallet {
        uint256 id;
        uint256 balance;
    }

    mapping(address => Wallet) public wallets;
    event BalanceUpdated(address indexed walletOwner, uint256 newBalance);

    constructor() {
        wallets[msg.sender] = Wallet(1, 100);
    }
}