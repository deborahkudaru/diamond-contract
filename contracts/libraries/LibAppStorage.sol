// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

library LibAppStorage {
    struct AppStorage {
        A a;
        B b;
        C c;
    }

    struct A {
        uint256 num;
        string name;
        mapping(string => uint256) numMap;
    }

    struct B {
        address owner;
        uint256 balance;
    }

    struct C {
        bool isActive;
        uint256 createdAt;
    }

    function appStorage() internal pure returns (AppStorage storage s) {
        bytes32 position = keccak256("diamond.storage.app");
        assembly {
            s.slot := position
        }
    }
}
