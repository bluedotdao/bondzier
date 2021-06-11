//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "./Clones.sol";
import "./IRegister.sol";
import "./IInit.sol";

contract BondzierFactory {

  address public bondzierContractAddress;
  address public tokenContractAddress;

  address[] public contracts;
  
  uint128 public nonce = 0;
  
  IRegister private bezier1155;

  event BondzierCreated(address newBondzierAddress);

  constructor (address _bondzierContractAddress, address _tokenContractAddress) {
    bondzierContractAddress = _bondzierContractAddress;
    tokenContractAddress = _tokenContractAddress;
    bezier1155 = IRegister(tokenContractAddress);
  }

  function allContractsLength() external view returns (uint) {
        return contracts.length;
    }

  function predictAddress(bytes32 _salt) public view returns (address) {
    return Clones.predictDeterministicAddress(bondzierContractAddress, _salt); 
  }

  function createBondzier(bool _isNonFungible, 
                          uint256 _amnt, 
                          uint256 _total, 
                          uint256[6] memory _points,  
                          address _owneraddress, 
                          uint256 _endTime, 
                          string memory _uri, 
                          bytes32 _salt,
                          bytes memory data
                         ) public returns (address) {
    address clone = Clones.cloneDeterministic(bondzierContractAddress, _salt);
    IInit(clone).init(nonce, _isNonFungible, _amnt, _total, _points, _owneraddress, _endTime, _uri, tokenContractAddress, data);
    contracts.push(clone);
    bezier1155.register(_uri, clone, nonce);
    emit BondzierCreated(clone);
    nonce += 1;
    return clone;
  }
}