//SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract newContract {
    uint256 totalSalams;

    event newSalam(
        address indexed salamkon,
        string indexed message,
        uint256 timestamp
    );

    struct salamkona {
        address salamkon;
        string message;
        uint256 timestamp;
        string username;
        uint256 numberOfSalams;
    }

    salamkona[] salamkonha;

    mapping(string => uint256) nameToNumber;

    function Salam(string memory userName, string memory message) public {
        totalSalams += 1;
        nameToNumber[userName] += 1;

        console.log(
            "%s aka %s said Salam with massage : %s",
            msg.sender,
            userName,
            message
        );

        salamkonha.push(
            salamkona(
                msg.sender,
                message,
                block.timestamp,
                userName,
                nameToNumber[userName]
            )
        );

        emit newSalam(msg.sender, message, block.timestamp);
    }

    function getTotalSalams() public view returns (uint256) {
        console.log("you have total of %d salams!", totalSalams);
        return (totalSalams);
    }

    function getAllSalamkona() public view returns (salamkona[] memory) {
        return salamkonha;
    }

    function getusersSalams(string memory userName)
        public
        view
        returns (uint256)
    {
        return nameToNumber[userName];
    }
}
