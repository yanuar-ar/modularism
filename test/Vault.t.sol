// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {InitializeModule} from "../src/modules/InitializeModule.sol";
import {DepositModule} from "../src/modules/DepositModule.sol";
import {WithdrawModule} from "../src/modules/WithdrawModule.sol";
import {ResolverModule} from "../src/modules/ResolverModule.sol";
import {Vault} from "../src/Vault.sol";
import {Modularity} from "../src/Modularity.sol";

contract VaultTest is Test {
    Vault public vault;

    function setUp() public {
       // deploy modules
        Modularity.Modules memory modules = Modularity.Modules({
            initialize: address(new InitializeModule()),
            deposit: address(new DepositModule()),
            withdraw: address(new WithdrawModule()),
            resolver: address(new ResolverModule())
        });
        // deploy vault
        vault = new Vault(modules);
        // initialize vault
        vault.initialize(address(this));
    }

    function test_deposit_withdraw_owner() public {
        vault.deposit(100);
        assertEq(vault.balanceOf(address(this)), 100);

        vault.withdraw(50);
        assertEq(vault.balanceOf(address(this)), 50);

        assertEq(vault.getOwner(), address(this));
    }
}
