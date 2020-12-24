// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;


interface ICeroFactory {

    /**
     * @notice createFirstCero Create only one Cero for account
     */
    function createFirstCero() external;
}
