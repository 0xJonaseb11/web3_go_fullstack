// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import { SimpleStorage } from "./SimpleStorage";

contract ExtraStorage is SimpleStorage {

function store(uint256 _favoriteNumber) public override {
    favoriteNumber = favoriteNumber + 5;
}