// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {VaultStorage} from '../VaultStorage.sol';

contract WithdrawModule {

    function withdraw(uint256 amount) external {
        VaultStorage.s().balances[msg.sender] -= amount;
    }
    
}
