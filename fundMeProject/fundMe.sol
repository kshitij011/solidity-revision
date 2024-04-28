// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint public minDollar = 5;
    function fund() public payable {
        //require keyword checks that the minimum amount that has to be sent is 1*10**18 wei
        // 1 ETH = 1000000000000000000 = 1 * 10 ** 18
        //if value is less than 1 ETH, the transaction is reverted, we can add a message to send a message

        //for value of dollar:

        require(msg.value >= minDollar, "didn't send enough Dollar");
    }

    function getPrice() public {
        // Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
    }

    function getVersion() public view returns (uint) {
        return
            AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
                .version();
    }
}
