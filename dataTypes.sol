//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract simpleStorage {
    //Basic storage types in solidity:

    //Boolean: True or False

    //uitn: stores a number ranging from . We can specify how many bytes we want to use to store a number
    //eg: uint256, uint128, ...,  uint64, uint16, uint8

    //int: stores a number ranging from . We can specify int same as uint
    //byte: stores a number

    //address: stores an address (senders or receivers 64 digit wallet address )

    //string/byte: stirngs inside are the byte objects specifically for text
    //bytes store string in their hexa-decimal format.

    bool hasFavoriteNumber = true;

    uint8 n = 8;
    uint favoriteNumber = 88;

    int8 neg = -8;
    int nega = -88;
    int negative = 245;

    string name = "name";

    address myAdd = 0x8C937303351Bc71fe685aC90878E57E7D68cfe12;

    bytes32 myText = "cat"; //bytes and bytes32 are different. Largest byte is 32
}
