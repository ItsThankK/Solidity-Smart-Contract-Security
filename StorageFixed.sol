/// SPDX-License-Identifier: MIT

/// @audit Updated Compiler version to 0.8.18
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

    /// Fixed initialization by use a constructor function.
    constructor() {
        owner = msg.sender;
    }

    function store(uint256 amount) public {

        /// Fixed uninitialized storage pointer from "Storage str" to "Storage memory str"
        Storage memory str;

        str.user = msg.sender;
        str.amount = amount;
        storages[msg.sender] = str;
    }

    function getStore() public view returns (address, uint256) {

        /// Fixed uninitialized storage pointer from "Storage str" to "Storage storage str"
        Storage storage str = storages[msg.sender];

        return (str.user, str.amount);
    }

    function getOwner() public view returns (address) {
        return owner;
    }
}//@audit  Added lincense
// SPDX-License-Identifier: MIT

// @audit Outdated Compiler version changed from `^0.4.23` to `^0.8.18`
pragma solidity ^0.8.18;

/**
 * @title Secured/Audited Contract
 * @author Marcellus Ifeanyi
 * @notice This is the Audited Contract that fixes the bugs identified in the `StorageVictim.sol` contract
 */

contract StorageSecured {
    address immutable owner;

    struct Storage {
        address user;
        uint256 amount;
    }

    mapping(address => Storage) storages;

    //@audit fix the owner initialization by changing `StorageVictim(){}` to use the `constructor(){}` function.
    constructor() {
        owner = msg.sender;
    }

    function store(uint256 amount) public {
        //@audit fixed uninitialized storage pointer from `Storage str` to `Storage memory str`
        Storage memory str;

        str.user = msg.sender;

        str.amount = amount;

        storages[msg.sender] = str;
    }

    function getStore() public view returns (address, uint256) {
        //@audit fixed uninitialized storage pointer from `Storage str` to ` Storage storage str`

        Storage storage str = storages[msg.sender];

        return (str.user, str.amount);
    }

    function getOwner() public view returns (address) {
        return owner;
    }
}