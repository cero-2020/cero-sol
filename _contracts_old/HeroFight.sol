//// SPDX-License-Identifier: GPL-3.0
//pragma solidity ^0.5.16;
//
//import "./HeroOwner.sol";
//
//contract HeroFight is HeroOwner {
//
//  struct Fight {
//    uint256 hero1;
//    uint256 hero2;
//    uint256 winner;
//    uint256 time;
//  }
//
//  // Contain all fights
//  Fight[] fights;
//
//  function heroesFight(uint256 _hero1Num, uint256 _hero2Num, address _hero1Owner, bool isWinnerHero1, string memory soul) public returns (uint256) {
//    require(isHeroOwner(_hero1Num, _hero1Owner));
//
//    Hero memory hero = heroes[_hero1Num];
//
//    //uint256 lastFightDiff = now - hero.lastFight;
//    //require(lastFightDiff > 300, "Hero fight recently");
//
//    // Set winner of fight
//    uint256 winner = _hero1Num;
//
//    if (true == isWinnerHero1) {
//      require(bytes(soul).length != 0, 'Soul is empty');
//
//      createHero(soul, _hero1Owner, 0, 0, true);
//
//      heroes[_hero1Num].lastFight = now;
//
//    } else {
//      winner = _hero2Num;
//    }
//
//    Fight memory fight = Fight({
//      hero1: _hero1Num,
//      hero2: _hero2Num,
//      winner: winner,
//      time: now
//    });
//
//    // Get new Fight number
//    uint256 newFightNum= fights.push(fight) - 1;
//
//    return newFightNum;
//  }
//
//  function getFights() external view returns (
//    uint256[] memory hero1,
//    uint256[] memory hero2,
//    uint256[] memory winner,
//    uint256[] memory time
//  ) {
//    hero1 = new uint256[](fights.length);
//    hero2 = new uint256[](fights.length);
//    winner = new uint256[](fights.length);
//    time = new uint256[](fights.length);
//
//    for (uint256 i = 0; i < fights.length; i++) {
//      hero1[i] = fights[i].hero1;
//      hero2[i] = fights[i].hero2;
//      winner[i] = fights[i].winner;
//      time[i] = fights[i].time;
//    }
//  }
//}
