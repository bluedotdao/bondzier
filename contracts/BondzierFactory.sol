//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.4;

import "./Clones.sol";
import "./IRegister.sol";
import "./IInit.sol";

  /**
  * @dev Creates new bondzier markets and keeps track of the deployed contracts
  */
contract BondzierFactory {

  address public bondzierContractAddress;
  address public tokenContractAddress;

  address[] public contracts;
  
  uint128 public nonce = 0;
  
  IRegister private bondzier1155;

  /**
  * @dev Event emmited when a new bondzier is created for easier discovery
  */
  event BondzierCreated(address newBondzierAddress);

  /**
  * @dev Constructor accepts two adress params: 
  * 
  * bondzierContractAddress: The address of the deployed Bondzier implementation contract. This contract will be cloned and initialised for each newly created Bondzier market.
  * 
  * tokenContractAddress: The address of a erc1155 contract that implements register and mint functions.  
  */
  constructor (address _bondzierContractAddress, address _tokenContractAddress) {
    require(_tokenContractAddress != address(0), "Token contract address must be non-zero.");
    require(_bondzierContractAddress != address(0), "Bondzier contract address must be non-zero.");
    
    bondzierContractAddress = _bondzierContractAddress;
    tokenContractAddress = _tokenContractAddress;
    bondzier1155 = IRegister(tokenContractAddress);
  }

  /**
  * @dev Returns how many bondzier markets have been created
  */
  function allContractsLength() external view returns (uint) {
        return contracts.length;
    }

  /**
  * @dev Predicts the address of the cloned bondzier contract
  */
  function predictAddress(bytes32 _salt) external view returns (address) {
    return Clones.predictDeterministicAddress(bondzierContractAddress, _salt); 
  }

  /**
  * @dev Creates new bondzier market, provided params. If the salt is not unique, will fail. See [init in Bondzier.sol](/docs/Bondzier.md#inituint128-_nonce-bool-_isnonfungible-uint256-_amnt-uint256-_total-uint2566-_points-address-_owneraddress-uint256-_endtime-string-_uri-address-_tokencontractaddress-bytes-_data-public)
  */
  function createBondzier(bool _isNonFungible, 
                          uint256 _amnt, 
                          uint256 _total, 
                          uint256[6] memory _points,  
                          address _owneraddress, 
                          uint256 _endTime, 
                          string memory _uri, 
                          bytes32 _salt,
                          bytes memory data
                         ) external returns (address) {

    address pa = this.predictAddress(_salt);
    uint128 _n = nonce;

    nonce += 1;
    contracts.push(pa);
    emit BondzierCreated(pa);

    bondzier1155.register(_uri, pa, _n);
    
    address clone = Clones.cloneDeterministic(bondzierContractAddress, _salt);
    IInit(pa).init(_n, _isNonFungible, _amnt, _total, _points, _owneraddress, _endTime, _uri, tokenContractAddress, data);
    return clone;
      
  }
}