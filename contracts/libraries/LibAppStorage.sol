// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

library LibAppStorage {

   // NumberFacet struct
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

    // Random functions Facet struct
    

}