// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


library VaultStorage {


    struct VaultDS {
        // Vault configuration
        address owner;
        mapping(address => uint256) balances;
    }

    // keccak256(abi.encode(uint256(keccak256("centuari.labs.vault")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant STORAGE_SLOT = 0xfbb55bebef210ae15b3cca3df6e694a950708d93886cdfea434bc7a9d1992000;

    function s() internal pure returns (VaultDS storage ds) {
        bytes32 slot = STORAGE_SLOT;
        assembly {
            ds.slot := slot
        }
    }
}
