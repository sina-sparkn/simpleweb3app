//SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract ContractTest {
    uint256 totalSalams;
    uint256 private seed;

    constructor() payable {
        seed = (block.timestamp + block.difficulty) % 100;
    }

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
    mapping(address => uint256) cooldownPerAddress;

    function Salam(string memory message) public {
        require(
            cooldownPerAddress[msg.sender] + 15 minutes < block.timestamp,
            "wait and try 15 minutes later"
        );

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

        seed = (seed + block.difficulty + block.timestamp) % 100;
        console.log("this seed is : %d", seed);

        if (seed <= 30) {
            console.log("%s has won", msg.sender);
            uint256 prize = 0.1 ether;
            require(
                prize <= address(this).balance,
                "contract does not have enough balance!"
            );
            (bool success, ) = (msg.sender).call{value: prize}("");
            require(success, "sending was not successful");
        }

        cooldownPerAddress[msg.sender] = block.timestamp;

        emit newSalam(
            msg.sender,
            message,
            addressToNumber[msg.sender],
            block.timestamp
        );
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
