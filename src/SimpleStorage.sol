// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {

    // EVM, Ethereum Virtual Machine
    // Avalanche, Fantom, Polygon
    
    // state variables
    uint256 favoriteNumber;
    // Person public person = Person({favoriteNumber: 5, name: "Jonas"});

    /**
    * Mapping is a data structure where a key is "mapped" to a sinlge value
    * When mapping is used, everything is initialized to zero
     */
    mapping(string => uint256) public nameToFavoriteNumber; 


    struct People {
        uint256 favoriteNumber;
        string name;
    }
    
    // uint256[] public favoriteNumbersList;
    People[] public people;

    // store value
    function store(uint256 _favoriteNumber) public {
     favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
     return favoriteNumber;
    }

    // let's add people to our array
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        People memory   newPerson = People({favoriteNumber: _favoriteNumber, name: _name}); // same as below
        people.push(People(_favoriteNumber, _name));
        people.push(newPerson);

        // another option with mapping
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // calldata, memory and storage
    /**
    * Memory and calldata
    * Mean that data will only exist for short time
    * before execution and after execution, will nolonger there
    *
    * With calldata, you cannot alter variable ie cannot be overridden
    * while with memory, it is possible and safe
    *
    * Storage means data will even be available even after function execution
    */

}


