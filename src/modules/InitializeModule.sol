// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {VaultStorage} from '../VaultStorage.sol';
import { Initializable } from '@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol';

contract InitializeModule is Initializable {

    function initialize(address owner) external initializer {
        VaultStorage.s().owner = owner;
    }
    
}
