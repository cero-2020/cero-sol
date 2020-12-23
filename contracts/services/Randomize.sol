// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract Randomize {
    uint randomNum = 1;

    function random(uint _max) internal returns (uint result) {
        result = uint(keccak256(abi.encodePacked(block.number, block.difficulty, block.timestamp, randomNum))) % _max;
        randomNum++;
    }
}
