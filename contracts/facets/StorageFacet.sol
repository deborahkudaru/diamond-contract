// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "../libraries/LibAppStorage.sol";

contract AdvancedStorageFacet {
    function setUsername(string memory _username) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.userProfile.username = _username;
    }

    function setUserWallet(address _wallet) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.userProfile.walletAddress = _wallet;
    }

    function setUserReputation(uint256 _reputation) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.userProfile.reputation = _reputation;
    }

    function setProductPrice(uint256 _price) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.productDetails.price = _price;
    }

    function setMarketplaceSales(uint256 _totalSales) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.marketplaceStats.totalSales = _totalSales;
    }

    function setTransactionDetails(address _sender, address _recipient, uint256 _amount) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.transactionLog.sender = _sender;
        s.transactionLog.recipient = _recipient;
        s.transactionLog.amount = _amount;
    }

    function setSecurityGuardian(address _guardian) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.securitySettings.guardianAddress = _guardian;
    }

    function setNetworkConfiguration(uint256 _networkId, bool _isMainnet) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.networkConfig.networkId = _networkId;
        s.networkConfig.isMainnet = _isMainnet;
    }

    function setTokenomicsSupply(uint256 _totalSupply) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.tokenomics.totalTokenSupply = _totalSupply;
    }

    function setGameStateLevel(uint256 _level) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.gameState.level = _level;
    }

    function setEnvironmentalData(int256 _temperature, uint256 _humidity) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.appStorage();
        s.environmentData.temperature = _temperature;
        s.environmentData.humidity = _humidity;
    }
}