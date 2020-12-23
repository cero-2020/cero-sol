// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

import "./services/Randomize.sol";

contract CeroFactory is Randomize {

    struct Cero {
        string name;
        uint8 lvl;
        uint16 strenght;
        uint16 protection;
        uint16 agility;
        uint16 magic;
        uint parent1;
        uint parent2;
        bool isChild;
        uint64 birthday;
        uint64 lastFight;
        uint32 cooldown;
    }

    // Contain all ceroes
    Cero[] public ceroes;

    // Mapping between Cero number and owner address
    mapping(uint => address) public ceroesToOwner;

    // Mapping between owner and Cero count for this owner
    mapping (address => uint) public ownerToCeroesCount;


    constructor() {
        _createCero(msg.sender, 'This is first Cero', 0, 0, 0, 0, 0, 0, 0, false);
    }

    // Create a Cero
    function createCero() public {
        createRandomCero();
    }

    // Create a first Cero
    function createFirstCero() public {
        require(ownerToCeroesCount[msg.sender] == 0, 'This address already have Cero!');
        createRandomCero();
    }

    // Create a random Cero
    function createRandomCero() internal {

        uint ceroType = random(3);

        if (ceroType == 0) {
            _createBaseCero(msg.sender, 'Warrior', 6, 6, 2, 0);
        }
        if (ceroType == 1) {
            _createBaseCero(msg.sender, 'Thief', 6, 2, 6, 0);
        }
        if (ceroType == 2) {
            _createBaseCero(msg.sender, 'Wizard', 0, 2, 6, 6);
        }
    }

    // Create a Cero lvl 1 with base parameters
    function _createBaseCero(address _owner, string memory _name, uint16 _stB, uint16 _prB, uint16 _agB, uint16 _maB) internal {
        uint16 st = uint16(_stB + random(3));
        uint16 pr = uint16(_prB + random(3));
        uint16 ag = uint16(_agB + random(3));
        uint16 ma = uint16(_maB + random(3));

        uint warriorPoint = st + pr;
        uint thiefPoint = st + ag;
        uint wizardPoint = ag + ma;

        if (warriorPoint > wizardPoint || thiefPoint > wizardPoint) {
            ma = 0;
        } else {
            st = 0;
        }

        _createCero(_owner, _name, 1, st, pr, ag, ma, 0, 0, true);
    }

    function _createCero(
        address _owner,
        string memory _name,
        uint8 _lvl,
        uint16 _st,
        uint16 _pr,
        uint16 _ag,
        uint16 _ma,
        uint _parent1,
        uint _parent2,
        bool _isChild
    ) internal {
        Cero memory cero = Cero({
            name: _name,
            lvl: _lvl,
            strenght: _st,
            protection: _pr,
            agility: _ag,
            magic: _ma,
            parent1: _parent1,
            parent2: _parent2,
            isChild: _isChild,
            birthday: uint64(block.timestamp),
            lastFight: 0,
            cooldown: _getCooldown(_lvl)
        });

        ceroes.push(cero);
        ownerToCeroesCount[_owner]++;

        uint256 newCeroNum = ceroes.length - 1;
        ceroesToOwner[newCeroNum] = _owner;
    }

    function _getCooldown(uint8 _lvl) private returns (uint32) {
        if (_lvl == 0 ) {
            return 0;
        }
        if (_lvl == 1 || _lvl == 2) {
            return 1;
        }
        return _getCooldown(_lvl - 1) + _getCooldown(_lvl -2);
    }
}
