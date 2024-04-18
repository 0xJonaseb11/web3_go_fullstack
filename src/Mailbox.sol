// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Mailbox {

    // state variables
    address public owner;
    mapping(address => string) private messages;

    // events
    event MessageSent(address indexed sender, string message);
    event MessageRead(address indexed recipient);

    // initilize contract
    constructor() {
        owner = msg.sender;
    }

    // permissions
    modifier onlyOwner() {
        require(msg.sender = owner), "only owner can call this contract");
        _;
    }

    // send message
    function sendMessage(address _recipient, string memory _message) external {
        require(bytes(_message).length > 0, "Message should not be empty");
        messages[_recipient] = _message;
        emit MessageSent(msg.sender, _message);

    }
}