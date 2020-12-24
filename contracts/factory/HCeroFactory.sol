// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

import "../services/NameGenerator.sol";

contract HCeroFactory is NameGenerator {
    /**
     * @param name
     */
    struct Cero {
        string name;
        uint8 lvl;
        uint16 strength;
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

    /**
     * @notice Contain Ceroes data
     */
    Cero[] public ceroes;

    /**
     * @notice Contain "Cero number" => "owner address"
     */
    mapping(uint => address) public ceroesToOwner;

    /**
     * @notice Contain "owner address" => "ceroes count for address"
     */
    mapping (address => uint) public ownerToCeroesCount;

    /**
     * @notice Create random Cero lvl1
     */
    function _createRandomBaseCero() internal {
        uint ceroType = random(3);
        if (ceroType == 0) {
            _createBaseCero(msg.sender, _getCeroName(), 6, 6, 2, 0);
        }
        if (ceroType == 1) {
            _createBaseCero(msg.sender, _getCeroName(), 6, 2, 6, 0);
        }
        if (ceroType == 2) {
            _createBaseCero(msg.sender, _getCeroName(), 0, 2, 6, 6);
        }
    }

    /**
     * @notice Create Cero lvl1 by params
     */
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

    /**
     * @notice Create Cero by params
     */
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
            strength: _st,
            protection: _pr,
            agility: _ag,
            magic: _ma,
            parent1: _parent1,
            parent2: _parent2,
            isChild: _isChild,
            birthday: uint64(block.timestamp),
            lastFight: 0,
            cooldown: _getCooldown(_lvl) * 60
        });

        ceroes.push(cero);
        ownerToCeroesCount[_owner]++;

        uint256 newCeroNum = ceroes.length - 1;
        ceroesToOwner[newCeroNum] = _owner;
    }

    /**
     * @notice Calculate cooldown by Cero lvl
     * @return cooldown in minutes
     */
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
