//SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract newContract {
    constructor() {
        console.log("sina");
    }

    mapping(string => uint256) numToUser;

    uint256 totalSalams;

    function Salam(string memory userName) public {
        numToUser[userName] += 1;
        totalSalams += 1;
        console.log("%s aka %s said Salam", msg.sender, userName);
    }

    function getTotalSalams() public view returns (uint256) {
        console.log("you have total of %d salams!", totalSalams);
        return (totalSalams);
    }

    function getUserSalams(string memory userName) public view {
        if (numToUser[userName] == 1) {
            console.log("the user %s have said salam once!", userName);
        } else if (numToUser[userName] == 2) {
            console.log("the user %s have said salam twice!", userName);
        } else {
            console.log(
                "the user %s have said salam %d times",
                userName,
                numToUser[userName]
            );
        }
    }

    // todo make a small change to this SC then continue OK?
    // *I think I've done it!
}
