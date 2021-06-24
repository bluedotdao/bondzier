// SPDX-License-Identifier: MIT

pragma solidity 0.8.4;

interface IMinter {
    function mint(address to, uint256 id, uint256 amount, bytes memory data) external;
}
