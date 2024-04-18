// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Mailbox {

    // state variables
    address public owner;
    mapping(address => string) private messages;
    mapping(address => uint256) private lastMessageTime;

    // define a list of banned words
    string[] private bannedWords = ["spam", "sale", "promotion"];

    // events
    event MessageSent(address indexed sender, string message);
    event MessageRead(address indexed recipient);

    // initilize contract
    constructor() {
        owner = msg.sender;
    }

    // permissions
    modifier onlyOwner() {
        require(msg.sender == owner, "only owner can call this function");
        _;
    }

    // send message
    function sendMessage(address _recipient, string memory _message) external {
        require(bytes(_message).length > 0, "Message should not be empty");
        // check if message contains banned words
        require(!containsBannedWords(_message), "Message contains banned words");
        // Rate limiting: Allow only one message per 10 minutes
        require(block.timestamp - lastMessageTime[msg.sender] >= 10 minutes, "Rate limit exceeded");
        messages[_recipient] = _message;
        // Update last message time
        lastMessageTime[msg.sender] = block.timestamp;
        emit MessageSent(msg.sender, _message);
    }

    function readMessage() external returns (string memory) {
        string memory message = messages[msg.sender];
        emit MessageRead(msg.sender);
        return message;
    }

    // function to check if message contains banned words
    function containsBannedWords(string memory _message) private view returns(bool) {
        for (uint256 i = 0; i < bannedWords.length; i++) {
            if(bytes(_message).length >= bytes(bannedWords[i]).length && 
            keccak256(abi.encodePacked(_message)) == keccak256(abi.encodePacked(bannedWords[i]))) {
            return true;
        }
      }
      return false;
    }

    // withdraw funds in caze any sent
    function withdraw() external onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
}