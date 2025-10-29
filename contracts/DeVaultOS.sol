// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title DeVaultOS - A minimal decentralized vault operating system
/// @author
/// @notice Stores user data hashes with basic access control and ownership transfer

contract DeVaultOS {
    /// @dev structure to hold each user's stored hash
    mapping(address => bytes32) private vaults;

    /// @notice store encrypted or hashed data
    /// @param dataHash bytes32 hash representing user's encrypted data
    function storeData(bytes32 dataHash) external {
        vaults[msg.sender] = dataHash;
    }

    /// @notice view the stored data hash of a specific address
    /// @param owner address of the vault owner
    /// @return dataHash stored hash for the given owner
    function getData(address owner) external view returns (bytes32) {
        return vaults[owner];
    }

    /// @notice transfer vault ownership (data) to another address
    /// @param newOwner address to receive ownership of stored data
    function transferOwnership(address newOwner) external {
        require(vaults[msg.sender] != 0, "No data found");
        require(newOwner != address(0), "Invalid address");
        vaults[newOwner] = vaults[msg.sender];
        delete vaults[msg.sender];
    }
}
