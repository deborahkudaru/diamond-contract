// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "../libraries/LibAppStorage.sol";

contract NumberFacet {
    LibAppStorage.A s;
    LibAppStorage.B b;
    LibAppStorage.C c;

    function setNumber(uint256 _num) external {
        s.num = _num;
    }

    function setName(string memory _name) external {
        s.name = _name;
    }

    function setNumMap(string memory _key, uint256 _value) external {
        s.numMap[_key] = _value;
    }

    function setOwner(address _owner) external {
        b.owner = _owner;
    }

    function setBalance(uint256 _balance) external {
        b.balance = _balance;
    }

    function setActive(bool _isActive) external {
        c.isActive = _isActive;
    }

    function setCreatedAt(uint256 _timestamp) external {
        c.createdAt = _timestamp;
    }

    function resetA() external {
        s.num = 0;
        s.name = "A";
    }

    function resetB() external {
        b.owner = address(0);
        b.balance = 0;
    }
}
