## `BondzierFactory`



Creates new bondzier markets and keeps track of the deployed contracts


### `constructor(address _bondzierContractAddress, address _tokenContractAddress)` (public)





### `allContractsLength() → uint256` (external)



Returns how many bondzier markets have been creaetes

### `predictAddress(bytes32 _salt) → address` (public)



Provided with salt, predicts the address of the cloned bondzier contract

### `createBondzier(bool _isNonFungible, uint256 _amnt, uint256 _total, uint256[6] _points, address _owneraddress, uint256 _endTime, string _uri, bytes32 _salt, bytes data) → address` (public)



Creates new bondzier market, provided params. If the salt is not unique, will fail. See [init in Bondzier.sol](/docs/Bezier.md##inituint128-_nonce-bool-_isnonfungible-uint256-_amnt-uint256-_total-uint2566-_points-address-_owneraddress-uint256-_endtime-string-_uri-address-_tokencontractaddress-bytes-_data-public) for more details


### `BondzierCreated(address newBondzierAddress)`



Event emmited when a new bondzier is created for easier discovery

