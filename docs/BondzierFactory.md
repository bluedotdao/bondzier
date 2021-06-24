## `BondzierFactory`



Creates new bondzier markets and keeps track of the deployed contracts


### `constructor(address _bondzierContractAddress, address _tokenContractAddress)` (public)



Constructor accepts two adress params: 

bondzierContractAddress: The address of the deployed Bondzier implementation contract. This contract will be cloned and initialised for each newly created Bondzier market.

tokenContractAddress: The address of a erc1155 contract that implements register and mint functions.

### `allContractsLength() → uint256` (external)



Returns how many bondzier markets have been created

### `predictAddress(bytes32 _salt) → address` (external)



Predicts the address of the cloned bondzier contract

### `createBondzier(bool _isNonFungible, uint256 _amnt, uint256 _total, uint256[6] _points, address _owneraddress, uint256 _endTime, string _uri, bytes32 _salt, bytes data)` (external)



Creates new bondzier market, provided params. If the salt is not unique, will fail. See [init in Bondzier.sol](/docs/Bondzier.md#inituint128-_nonce-bool-_isnonfungible-uint256-_amnt-uint256-_total-uint2566-_points-address-_owneraddress-uint256-_endtime-string-_uri-address-_tokencontractaddress-bytes-_data-public


### `BondzierCreated(address newBondzierAddress)`



Event emmited when a new bondzier is created for easier discovery

