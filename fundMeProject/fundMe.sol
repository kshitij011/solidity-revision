// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint public minDollar = 5 * (10 ** 18); // which is 5 * 1e18

    address[] public funders;

    mapping(address funder => uint amountFunded) public addressToAmountFunded;

    function fund() public payable {
        //require keyword checks that the minimum amount that has to be sent is 1*10**18 wei
        // 1 ETH = 1000000000000000000 wei = 1 * 10 ** 18
        //if value is less than 1 ETH, the transaction is reverted, we can add a message to send a message

        //for value of dollar:
        //msg.value has 18 decimal places

        require(
            getConversionRate(msg.value) >= minDollar,
            "didn't send enough Dollar"
        );
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] =
            addressToAmountFunded[msg.sender] +
            msg.value;
    }

    function getPrice() public view returns (uint) {
        // Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        (, int256 price, , , ) = priceFeed.latestRoundData();
        //price of ETH in terms of USD:
        //2000.00000000
        //this has 8 decimal zeros but in terms of ETH (in fund function ) it has 18 decimal zeros to match it we multiply USD price by 1 ** 10

        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint) {
        uint ethPrice = getPrice();
        //in solidity we always multiply first because only whole numbers work in solidity(1/2 gives 0)
        uint ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getVersion() public view returns (uint) {
        return
            AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
                .version();
    }
}
