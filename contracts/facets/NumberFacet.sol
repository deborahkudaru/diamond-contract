// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "../libraries/LibAppStorage.sol";

contract NumberFacet {
    function setNumber(uint256 _num) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.a.num = _num;
    }

    function setName(string memory _name) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.a.name = _name;
    }

    function setNumMap(string memory _key, uint256 _value) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.a.numMap[_key] = _value;
    }

    function setOwner(address _owner) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.b.owner = _owner;
    }

    function setBalance(uint256 _balance) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.b.balance = _balance;
    }

    function setActive(bool _isActive) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.c.isActive = _isActive;
    }

    function setCreatedAt(uint256 _timestamp) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.c.createdAt = _timestamp;
    }

    function resetA() external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.a.num = 0;
        s.a.name = "A";
    }

    function resetB() external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.b.owner = address(0);
        s.b.balance = 0;
    }
}
