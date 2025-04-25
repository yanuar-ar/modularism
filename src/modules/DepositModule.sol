// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {VaultStorage} from '../VaultStorage.sol';

contract DepositModule {

    function deposit(uint256 amount) external {
        VaultStorage.s().balances[msg.sender] += amount;
    }
    
}
