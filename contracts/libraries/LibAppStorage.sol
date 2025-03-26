// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

library LibAppStorage {
    struct AppStorage {
        UserProfile userProfile;
        ProductDetails productDetails;
        MarketplaceStats marketplaceStats;
        TransactionLog transactionLog;
        SecuritySettings securitySettings;
        NetworkConfiguration networkConfig;
        TokenomicsInfo tokenomics;
        GameState gameState;
        SocialMetrics socialMetrics;
        EnvironmentalData environmentData;
    }

    struct UserProfile {
        string username;
        address walletAddress;
        uint256 reputation;
        bool isVerified;
    }

    struct ProductDetails {
        string productName;
        uint256 price;
        uint256 totalSupply;
        address manufacturer;
    }

    struct MarketplaceStats {
        uint256 totalSales;
        uint256 averageListingPrice;
        uint256 lastSaleTimestamp;
    }

    struct TransactionLog {
        address sender;
        address recipient;
        uint256 amount;
        bytes32 transactionHash;
    }

    struct SecuritySettings {
        bool multiFactorEnabled;
        uint256 lastPasswordChange;
        address guardianAddress;
    }

    struct NetworkConfiguration {
        uint256 networkId;
        bool isMainnet;
        uint256 gasLimit;
    }

    struct TokenomicsInfo {
        uint256 totalTokenSupply;
        uint256 circulatingSupply;
        uint256 burnRate;
    }

    struct GameState {
        uint256 playerScore;
        uint256 level;
        bool isGameActive;
    }

    struct SocialMetrics {
        uint256 followers;
        uint256 posts;
        uint256 engagement;
    }

    struct EnvironmentalData {
        int256 temperature;
        uint256 humidity;
        uint256 airQualityIndex;
    }

    function appStorage() internal pure returns (AppStorage storage s) {
        bytes32 position = keccak256("diamond.storage.advanced");
        assembly {
            s.slot := position
        }
    }
}
