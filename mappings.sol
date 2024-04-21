// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Map {
    //mappings are based on hashing indexes
    mapping(uint => string) public roll_no;

    function setter(uint key, string memory value) public {
        roll_no[key] = value;
    }
}
