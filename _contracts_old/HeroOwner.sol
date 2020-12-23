//// SPDX-License-Identifier: GPL-3.0
//pragma solidity ^0.5.16;
//
//import "./HeroBase.sol";
//
//contract HeroOwner is HeroBase {
//
//  function isHeroOwner(uint256 _heroNum, address _heroOwner) internal view returns (bool) {
//    return heroesNumberToOwner[_heroNum] == _heroOwner;
//  }
//
//  function getHeroOwner(uint256 _heroNum) external view returns (address heroOwner) {
//    heroOwner = heroesNumberToOwner[_heroNum];
//    require(heroOwner != address(0));
//  }
//}
