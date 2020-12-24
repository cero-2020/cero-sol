// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

import "./ICeroFactory.sol";
import "./HCeroFactory.sol";

contract CeroFactory is ICeroFactory, HCeroFactory {
    constructor() {
        _createCero(msg.sender, 'This is first Cero', 0, 0, 0, 0, 0, 0, 0, false);
    }

    // Create a Cero
    function createCero() public {
        _createRandomBaseCero();
    }

    // Create a first Cero
    function createFirstCero() public override {
        require(ownerToCeroesCount[msg.sender] == 0, 'This address already have a Cero!');
        _createRandomBaseCero();
    }
}
