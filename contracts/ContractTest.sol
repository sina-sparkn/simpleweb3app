//SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract ContractTest {
    constructor() payable {}

    uint256 totalSalams;

    event newSalam(
        address indexed salamkon,
        string indexed message,
        uint256 indexed numberOfSalams,
        uint256 timestamp
    );

    struct salamkona {
        address salamkon;
        string message;
        uint256 numberOfSalams;
        uint256 timestamp;
    }

    salamkona[] salamkonha;

    mapping(address => uint256) addressToNumber;

    function Salam(string memory message) public {
        totalSalams += 1;
        addressToNumber[msg.sender] += 1;

        console.log("%s said Salam with massage : %s", msg.sender, message);

        salamkonha.push(
            salamkona(
                msg.sender,
                message,
                addressToNumber[msg.sender],
                block.timestamp
            )
        );

        emit newSalam(
            msg.sender,
            message,
            addressToNumber[msg.sender],
            block.timestamp
        );

        uint256 prize = 0.1 ether;
        require(prize <= address(this).balance);
        (bool success, ) = (msg.sender).call{value: prize}("");
        require(success, "sending ETH was not successful!");
    }

    function getTotalSalams() public view returns (uint256) {
        console.log("you have total of %d salams!", totalSalams);
        return (totalSalams);
    }

    function getAllSalamkona() public view returns (salamkona[] memory) {
        return salamkonha;
    }

    function getUsersSalams(address user) public view returns (uint256) {
        return addressToNumber[user];
    }
}
