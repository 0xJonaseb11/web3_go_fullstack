// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    
    // state variables
    uint256 favoriteNumber;
    Person public person = Person({favoriteNumber: 5, name: "Jonas"});


    struct People {
        uint256 favoriteNumber;
        string name;
    }
}

// store value
function store(uint256 _favoriteNumber) public {
    favoritenumber = _favoriteNumber;
}

function retrieve() public view return(uint256) {
    return favoriteNumber;
}