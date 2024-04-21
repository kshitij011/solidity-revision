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

    //memory specifies that the variable that will occupy the memory will stay there for short amount of time.
    //value of variable specified with memory keyword can change the value but we cannot change the value of a variable with calldata
    // memory variables can be modified, calldata variables cannot be modified.
    function addPerson(string memory _name, uint _index) public {
        listOfPeople.push(Person(_name, _index));
    }
}
