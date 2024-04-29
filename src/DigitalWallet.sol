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

    function updateWalletBalance(address walletAddress, uint256 newBalance) public {
        require(walletAddress != address(0), "Invalid wallet address");
        // Get a reference to the wallet data in storage
        Wallet memory wallet = wallets[walletAddress];
        // Validate the wallet owner
        require(msg.sender == walletAddress, "Unauthorised update");
        // Update the wallet's balance
        wallet.balance = newBalance;
        // Emit an event to the balance update
        emit BalanceUpdated(walletAddress, newBalance);
    }
}