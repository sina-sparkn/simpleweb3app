//SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract newContract {
    constructor() {
        console.log("sina is back baby!");
    }

    event newSalam(
        address indexed salamkon,
        string indexed message,
        uint256 timestamp
    );

    struct salamkona {
        address salamkon;
        string message;
        uint256 timestamp;
    }

    salamkona[] salamkonha;

    mapping(string => uint256) numToUser;

    uint256 totalSalams;

    function Salam(string memory userName, string memory message) public {
        numToUser[userName] += 1;
        totalSalams += 1;
        console.log(
            "%s aka %s said Salam with massage : %s",
            msg.sender,
            userName,
            message
        );

        salamkonha.push(salamkona(msg.sender, message, block.timestamp));

        emit newSalam(msg.sender, message, block.timestamp);
    }

    function getTotalSalams() public view returns (uint256) {
        console.log("you have total of %d salams!", totalSalams);
        return (totalSalams);
    }

    function getAllSalamkona() public view returns (salamkona[] memory) {
        return salamkonha;
    }

    function getUserSalams(string memory userName)
        public
        view
        returns (uint256)
    {
        return numToUser[userName];
    }
}
