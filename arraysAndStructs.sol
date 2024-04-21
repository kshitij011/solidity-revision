// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Arrays {
    //Arrays in solidiy are same as that in JS or any other programming language
    uint[] public favoriteNumbers;

    struct Person {
        //the person struct has become a datatype now
        string name;
        uint index;
    }

    Person public myFriend = Person("Seven", 7);

    Person[] public listOfPeople;

    function addPerson(string memory _name, uint _index) public {
        listOfPeople.push(Person(_name, _index));
    }
}
