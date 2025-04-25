// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {VaultStorage} from '../VaultStorage.sol';

contract ResolverModule {

    function balanceOf(address account) external view returns (uint256) {
        // use $
        VaultStorage.VaultDS storage $ = VaultStorage.s();
        return $.balances[account];
    }

    function getOwner() external view returns (address) {
        // direct read without $
        return VaultStorage.s().owner;
    }
    
}
