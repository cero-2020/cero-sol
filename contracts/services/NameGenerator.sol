// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

import "./Randomize.sol";

/**
 * @title NameGenerator
 */
contract NameGenerator is Randomize {

    /**
     * @notice Contain available names
     */
    string[] public name1;
    string[] public name2;

    constructor() {
        name1.push("Bomb");
        name1.push("Chronic");
        name1.push("Epic");
        name1.push("Catastrophic");
        name1.push("Amusing");
        name1.push("Madden");
        name1.push("Melancholic");
        name1.push("Tattered");
        name1.push("Crying");
        name1.push("Compulsive");
        name1.push("Thirsty");
        name1.push("Exhausted");
        name1.push("Throbbing");
        name1.push("Obstinate");
        name1.push("Disapproving");

        name2.push("devil");
        name2.push("hairline");
        name2.push("kid");
        name2.push("daddy");
        name2.push("director");
        name2.push("amanita");
        name2.push("hump");
        name2.push("mandarin");
        name2.push("horse");
        name2.push("smoke");
        name2.push("bike");
        name2.push("sock");
        name2.push("nose");
        name2.push("rooster");
        name2.push("drink");
    }

    /**
     * @notice Generate random name for Cero
     */
    function _getCeroName() internal returns (string memory) {
        uint name1Num = random(name1.length);
        uint name2Num = random(name2.length);
        return string(abi.encodePacked(name1[name1Num], " ", name2[name2Num]));
    }
}
