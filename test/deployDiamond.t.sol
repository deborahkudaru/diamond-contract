// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../contracts/interfaces/IDiamondCut.sol";
import "../contracts/facets/DiamondCutFacet.sol";
import "../contracts/facets/DiamondLoupeFacet.sol";
import "../contracts/facets/OwnershipFacet.sol";
import "forge-std/Test.sol";
import "../contracts/Diamond.sol";
import "../contracts/facets/NumberFacet.sol";

contract DiamondDeployer is Test, IDiamondCut {
    Diamond diamond;
    DiamondCutFacet dCutFacet;
    DiamondLoupeFacet dLoupe;
    OwnershipFacet ownerF;
    NumberFacet numberF;

    INumberFacet number;

    function setUp() public {
        dCutFacet = new DiamondCutFacet();
        diamond = new Diamond(address(this), address(dCutFacet));
        dLoupe = new DiamondLoupeFacet();
        ownerF = new OwnershipFacet();
        numberF = new NumberFacet();

        FacetCut[] memory cut = new FacetCut[](3);

        cut[0] = FacetCut({
            facetAddress: address(dLoupe),
            action: FacetCutAction.Add,
            functionSelectors: generateSelectors("DiamondLoupeFacet")
        });

        cut[1] = FacetCut({
            facetAddress: address(ownerF),
            action: FacetCutAction.Add,
            functionSelectors: generateSelectors("OwnershipFacet")
        });

        cut[2] = FacetCut({
            facetAddress: address(numberF),
            action: FacetCutAction.Add,
            functionSelectors: generateSelectors("NumberFacet")
        });

        IDiamondCut(address(diamond)).diamondCut(cut, address(0x0), "");

        number = INumberFacet(address(diamond));
    }

    function testSetAndGetNumber() public {
        number.setNumber(10);
        uint256 num = number.getNumber();
        assertEq(num, 10, "Number not set correctly");
    }

    // function testSetAndGetName() public {
    //     number.setName("A");
    //     string memory name = number.getName();
    //     assertEq(name, "A", "Name not set correctly");
    // }

    // function testSetAndGetNumMap() public {
    //     number.setNumMap("key", 10);
    //     uint256 value = number.getNumMap("key");
    //     assertEq(value, 10, "NumMap not set correctly");
    // }

    // function testSetAndGetOwner() public {
    //     number.setOwner(address(this));
    //     address owner = number.getOwner();
    //     assertEq(owner, address(this), "Owner not set correctly");
    // }

    // function testSetAndGetBalance() public {
    //     number.setBalance(10);
    //     uint256 balance = number.getBalance();
    //     assertEq(balance, 10, "Balance not set correctly");
    // }

    // function testSetAndGetActive() public {
    //     number.setActive(true);
    //     bool isActive = number.getActive();
    //     assertEq(isActive, true, "Active status not set correctly");
    // }

    // function testSetAndGetCreatedAt() public {
    //     uint256 timestamp = block.timestamp;
    //     number.setCreatedAt(timestamp);
    //     uint256 createdAt = number.getCreatedAt();
    //     assertEq(createdAt, timestamp, "CreatedAt not set correctly");
    // }

    // function testResetA() public {
    //     number.resetA();
    //     uint256 num = number.getNumber();
    //     assertEq(num, 0, "A was not reset correctly");
    // }

    function testResetB() public {
        number.resetB();
        uint256 balance = number.getBalance();
        assertEq(balance, 0, "B was not reset correctly");
    }

    function generateSelectors(
        string memory _facetName
    ) internal returns (bytes4[] memory selectors) {
        string[] memory cmd = new string[](3);
        cmd[0] = "node";
        cmd[1] = "scripts/genSelectors.js";
        cmd[2] = _facetName;
        bytes memory res = vm.ffi(cmd);
        selectors = abi.decode(res, (bytes4[]));
    }

    function diamondCut(
        FacetCut[] calldata _diamondCut,
        address _init,
        bytes calldata _calldata
    ) external override {}
}

interface INumberFacet {
    function setNumber(uint256 _number) external;
    function getNumber() external view returns (uint256);
    function setName(string calldata _name) external;
    function getName() external view returns (string memory);
    function setNumMap(string calldata key, uint256 value) external;
    function getNumMap(string calldata key) external view returns (uint256);
    function setOwner(address _owner) external;
    function getOwner() external view returns (address);
    function setBalance(uint256 _balance) external;
    function getBalance() external view returns (uint256);
    function setActive(bool _active) external;
    function getActive() external view returns (bool);
    function setCreatedAt(uint256 _timestamp) external;
    function getCreatedAt() external view returns (uint256);
    function resetA() external;
    function resetB() external;
}
