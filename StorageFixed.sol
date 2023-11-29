/// SPDX-License-Identifier: MIT

/// Updated Compiler version to 0.8.18
pragma solidity 0.8.18;

/**
 * @title StorageFixed Contract
 * @author Neibagha Kingsway ThankGod
 * @notice  Audited Contract that fixes all vunerabilities in the StorageVictim.sol contract
 */

contract StorageFixed {
    
    /// Owner is assigned once
    address immutable owner;

    struct Storage {
        address user;
        uint256 amount;
    }

    mapping(address => Storage) storages;

    /// Fixed initialization by using a constructor function.
    constructor() {
        owner = msg.sender;
    }

    function storeAmount(uint256 amount) public {

        /// Fixed uninitialized storage pointer by adding memory keyword
        Storage memory str = Storage(msg.sender, 0); ///Initilised local variable here! 

        str.user = msg.sender;
        str.amount = amount;
        storages[msg.sender] = str;
    }

    function getStoreAmount() public view returns (address, uint256) {

        /// Fixed uninitialized storage pointer by adding storage keyword
        Storage storage str = storages[msg.sender];

        return (str.user, str.amount);
    }

    function getOwner() public view returns (address) {
        return owner;
    }
}