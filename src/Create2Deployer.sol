/**
 * Submitted for verification at Etherscan.io on 2023-02-20
 */

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Create2Deployer {
    event Deploy(address addr);

    function deploy(bytes memory bytecode, uint256 _salt) external {
        address addr;
        assembly {
            addr := create2(0, add(bytecode, 0x20), mload(bytecode), _salt)
            if iszero(extcodesize(addr)) { revert(0, 0) }
        }

        emit Deploy(addr);
    }
}
