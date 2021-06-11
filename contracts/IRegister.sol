// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

interface IRegister {
    function register(string memory uri, address c, uint128 nonce) external;
}
