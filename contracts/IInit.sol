// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

interface IInit {
     function init( uint128 _nonce, bool _isNonFungible,  uint256 _amnt,  uint256 _total, uint256[6] memory _points,  address _owneraddress,  uint256 _endTime,  string memory _uri,  address _tokenContractAddress, bytes memory _data) external;
}
