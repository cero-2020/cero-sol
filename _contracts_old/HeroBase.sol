//// SPDX-License-Identifier: GPL-3.0
//pragma solidity ^0.5.16;
//
//contract HeroBase {
//
//  // @param soul Main parameters
//  // @param name Card name
//  // @param birthday Date when hero was created
//  // @param parent1 Parent identifier
//  // @param parent2 Parent identifier
//  // @param isExist If true, card steel exist
//  struct Hero {
//    string soul;
//    uint256 birthday;
//    uint256 parent1;
//    uint256 parent2;
//    bool isExist;
//    uint256 lastFight;
//  }
//
//  // Contain all heroes
//  Hero[] heroes;
//
//  // Contain mapping between hero number and owner address
//  mapping(uint256 => address) heroesNumberToOwner;
//
//  // Create a Hero
//  function createHero(string memory _soul, address _owner, uint256 _parent1, uint256 _parent2, bool isNoParent) public returns (uint256) {
//    if (true == isNoParent) {
//      _parent1 = 0;
//      _parent2 = 0;
//    } else {
//      address heroOwnerParent1 = heroesNumberToOwner[_parent1];
//      address heroOwnerParent2 = heroesNumberToOwner[_parent2];
//      require(heroOwnerParent1 == heroOwnerParent2, 'Wrong heroes owner!');
//
//      if (false == heroes[_parent1].isExist || false == heroes[_parent2].isExist) {
//        require(false, 'Parent Hero not existed!');
//      }
//
//      heroes[_parent1].isExist = false;
//      heroes[_parent2].isExist = false;
//    }
//
//    Hero memory hero = Hero({
//    soul: _soul,
//    birthday: now,
//    parent1: _parent1,
//    parent2: _parent2,
//    isExist: true,
//    lastFight: 0
//    });
//
//    // Get new Hero number
//    uint256 newHeroNum = heroes.push(hero) - 1;
//    // Put new Hero number to mapping with his owner
//    heroesNumberToOwner[newHeroNum] = _owner;
//
//    return newHeroNum;
//  }
//
//  // Get Heroes total count
//  function getHeroesCount() external view returns (uint256 count) {
//    count = heroes.length;
//  }
//
//  // Get a Hero data by unique number
//  function getHeroInfo(uint256 _heroNum) external view returns (
//    string memory soul,
//    uint256 birthday,
//    uint256 parent1,
//    uint256 parent2,
//    bool isExist,
//    uint256 lastFight
//  ) {
//    soul = heroes[_heroNum].soul;
//    birthday = heroes[_heroNum].birthday;
//    parent1 = heroes[_heroNum].parent1;
//    parent2 = heroes[_heroNum].parent2;
//    isExist = heroes[_heroNum].isExist;
//    lastFight = heroes[_heroNum].lastFight;
//  }
//
//  function getHeroesOwner() external view returns (
//    uint256[] memory heroNum,
//    address[] memory heroOwner
//  ) {
//    heroNum = new uint256[](heroes.length);
//    heroOwner = new address[](heroes.length);
//
//    for (uint256 i = 0; i < heroes.length; i++) {
//      heroNum[i] = i;
//      heroOwner[i] = heroesNumberToOwner[i];
//    }
//  }
//}
