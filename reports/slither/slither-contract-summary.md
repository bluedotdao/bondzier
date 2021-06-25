```
'npx hardhat compile --force' running
Compiling 28 files with 0.8.4
Compilation finished successfully

Solidity 0.8.4 is not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.

Learn more at https://hardhat.org/reference/solidity-support"


INFO:Printers:
+ Contract Bezier (Most derived contract)
  - From Bezier
    - bezier(uint256[2],uint256[2],uint256[2],uint256[2],uint256) (internal)
    - bezierX(uint256,uint256,uint256,uint256,uint256) (internal)
    - bezierY(uint256,uint256,uint256,uint256,uint256) (internal)
    - pow(uint256,uint256) (internal)
    - precalc(uint256) (internal)

+ Contract Bondzier (Most derived contract)
  - From Bondzier
    - available() (external)
    - buy() (external)
    - constructor() (public)
    - init(uint128,bool,uint256,uint256,uint256[6],address,uint256,string,address,bytes) (external)
    - nextPrice() (public)
    - priceN(uint256) (external)
    - step() (public)

+ Contract Bondzier1155 (Most derived contract)
  - From ERC1155Burnable
    - burn(address,uint256,uint256) (public)
    - burnBatch(address,uint256[],uint256[]) (public)
  - From ERC1155
    - _asSingletonArray(uint256) (private)
    - _burn(address,uint256,uint256) (internal)
    - _burnBatch(address,uint256[],uint256[]) (internal)
    - _doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes) (private)
    - _doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes) (private)
    - _mint(address,uint256,uint256,bytes) (internal)
    - _mintBatch(address,uint256[],uint256[],bytes) (internal)
    - _safeBatchTransferFrom(address,address,uint256[],uint256[],bytes) (internal)
    - _safeTransferFrom(address,address,uint256,uint256,bytes) (internal)
    - _setURI(string) (internal)
    - balanceOf(address,uint256) (public)
    - balanceOfBatch(address[],uint256[]) (public)
    - isApprovedForAll(address,address) (public)
    - safeBatchTransferFrom(address,address,uint256[],uint256[],bytes) (public)
    - safeTransferFrom(address,address,uint256,uint256,bytes) (public)
    - setApprovalForAll(address,bool) (public)
    - uri(uint256) (public)
  - From Context
    - _msgData() (internal)
    - _msgSender() (internal)
  - From AccessControlEnumerable
    - _setupRole(bytes32,address) (internal)
    - getRoleMember(bytes32,uint256) (public)
    - getRoleMemberCount(bytes32) (public)
    - grantRole(bytes32,address) (public)
    - renounceRole(bytes32,address) (public)
    - revokeRole(bytes32,address) (public)
  - From AccessControl
    - _checkRole(bytes32,address) (internal)
    - _grantRole(bytes32,address) (private)
    - _revokeRole(bytes32,address) (private)
    - _setRoleAdmin(bytes32,bytes32) (internal)
    - getRoleAdmin(bytes32) (public)
    - hasRole(bytes32,address) (public)
  - From Bondzier1155
    - _beforeTokenTransfer(address,address,address,uint256[],uint256[],bytes) (internal)
    - constructor(string) (public)
    - mint(address,uint256,uint256,bytes) (external)
    - mintBatch(address,uint256[],uint256[],bytes) (external)
    - register(string,address,uint128) (external)
    - supportsInterface(bytes4) (public)

+ Contract BondzierFactory (Most derived contract)
  - From BondzierFactory
    - allContractsLength() (external)
    - constructor(address,address) (public)
    - createBondzier(bool,uint256,uint256,uint256[6],address,uint256,string,bytes32,bytes) (external)
    - predictAddress(bytes32) (external)

+ Contract Clones (Most derived contract)
  - From Clones
    - clone(address) (internal)
    - cloneDeterministic(address,bytes32) (internal)
    - predictDeterministicAddress(address,bytes32) (internal)
    - predictDeterministicAddress(address,bytes32,address) (internal)

+ Contract ERC1155
  - From Context
    - _msgData() (internal)
    - _msgSender() (internal)
  - From ERC1155
    - _asSingletonArray(uint256) (private)
    - _beforeTokenTransfer(address,address,address,uint256[],uint256[],bytes) (internal)
    - _burn(address,uint256,uint256) (internal)
    - _burnBatch(address,uint256[],uint256[]) (internal)
    - _doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes) (private)
    - _doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes) (private)
    - _mint(address,uint256,uint256,bytes) (internal)
    - _mintBatch(address,uint256[],uint256[],bytes) (internal)
    - _safeBatchTransferFrom(address,address,uint256[],uint256[],bytes) (internal)
    - _safeTransferFrom(address,address,uint256,uint256,bytes) (internal)
    - _setURI(string) (internal)
    - balanceOf(address,uint256) (public)
    - balanceOfBatch(address[],uint256[]) (public)
    - constructor(string) (public)
    - isApprovedForAll(address,address) (public)
    - safeBatchTransferFrom(address,address,uint256[],uint256[],bytes) (public)
    - safeTransferFrom(address,address,uint256,uint256,bytes) (public)
    - setApprovalForAll(address,bool) (public)
    - supportsInterface(bytes4) (public)
    - uri(uint256) (public)

+ Contract IERC1155
  - From IERC165
    - supportsInterface(bytes4) (external)
  - From IERC1155
    - balanceOf(address,uint256) (external)
    - balanceOfBatch(address[],uint256[]) (external)
    - isApprovedForAll(address,address) (external)
    - safeBatchTransferFrom(address,address,uint256[],uint256[],bytes) (external)
    - safeTransferFrom(address,address,uint256,uint256,bytes) (external)
    - setApprovalForAll(address,bool) (external)

+ Contract IERC1155Receiver
  - From IERC165
    - supportsInterface(bytes4) (external)
  - From IERC1155Receiver
    - onERC1155BatchReceived(address,address,uint256[],uint256[],bytes) (external)
    - onERC1155Received(address,address,uint256,uint256,bytes) (external)

+ Contract ERC1155Burnable
  - From ERC1155
    - _asSingletonArray(uint256) (private)
    - _beforeTokenTransfer(address,address,address,uint256[],uint256[],bytes) (internal)
    - _burn(address,uint256,uint256) (internal)
    - _burnBatch(address,uint256[],uint256[]) (internal)
    - _doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes) (private)
    - _doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes) (private)
    - _mint(address,uint256,uint256,bytes) (internal)
    - _mintBatch(address,uint256[],uint256[],bytes) (internal)
    - _safeBatchTransferFrom(address,address,uint256[],uint256[],bytes) (internal)
    - _safeTransferFrom(address,address,uint256,uint256,bytes) (internal)
    - _setURI(string) (internal)
    - balanceOf(address,uint256) (public)
    - balanceOfBatch(address[],uint256[]) (public)
    - constructor(string) (public)
    - isApprovedForAll(address,address) (public)
    - safeBatchTransferFrom(address,address,uint256[],uint256[],bytes) (public)
    - safeTransferFrom(address,address,uint256,uint256,bytes) (public)
    - setApprovalForAll(address,bool) (public)
    - supportsInterface(bytes4) (public)
    - uri(uint256) (public)
  - From Context
    - _msgData() (internal)
    - _msgSender() (internal)
  - From ERC1155Burnable
    - burn(address,uint256,uint256) (public)
    - burnBatch(address,uint256[],uint256[]) (public)

+ Contract IERC1155MetadataURI
  - From IERC1155
    - balanceOf(address,uint256) (external)
    - balanceOfBatch(address[],uint256[]) (external)
    - isApprovedForAll(address,address) (external)
    - safeBatchTransferFrom(address,address,uint256[],uint256[],bytes) (external)
    - safeTransferFrom(address,address,uint256,uint256,bytes) (external)
    - setApprovalForAll(address,bool) (external)
  - From IERC165
    - supportsInterface(bytes4) (external)
  - From IERC1155MetadataURI
    - uri(uint256) (external)

+ Contract IAccessControl
  - From IAccessControl
    - getRoleAdmin(bytes32) (external)
    - grantRole(bytes32,address) (external)
    - hasRole(bytes32,address) (external)
    - renounceRole(bytes32,address) (external)
    - revokeRole(bytes32,address) (external)

+ Contract AccessControl
  - From Context
    - _msgData() (internal)
    - _msgSender() (internal)
  - From AccessControl
    - _checkRole(bytes32,address) (internal)
    - _grantRole(bytes32,address) (private)
    - _revokeRole(bytes32,address) (private)
    - _setRoleAdmin(bytes32,bytes32) (internal)
    - _setupRole(bytes32,address) (internal)
    - getRoleAdmin(bytes32) (public)
    - grantRole(bytes32,address) (public)
    - hasRole(bytes32,address) (public)
    - renounceRole(bytes32,address) (public)
    - revokeRole(bytes32,address) (public)
    - supportsInterface(bytes4) (public)

+ Contract IAccessControlEnumerable
  - From IAccessControlEnumerable
    - getRoleMember(bytes32,uint256) (external)
    - getRoleMemberCount(bytes32) (external)

+ Contract AccessControlEnumerable
  - From AccessControl
    - _checkRole(bytes32,address) (internal)
    - _grantRole(bytes32,address) (private)
    - _revokeRole(bytes32,address) (private)
    - _setRoleAdmin(bytes32,bytes32) (internal)
    - getRoleAdmin(bytes32) (public)
    - hasRole(bytes32,address) (public)
  - From Context
    - _msgData() (internal)
    - _msgSender() (internal)
  - From AccessControlEnumerable
    - _setupRole(bytes32,address) (internal)
    - getRoleMember(bytes32,uint256) (public)
    - getRoleMemberCount(bytes32) (public)
    - grantRole(bytes32,address) (public)
    - renounceRole(bytes32,address) (public)
    - revokeRole(bytes32,address) (public)
    - supportsInterface(bytes4) (public)

+ Contract Address (Most derived contract)
  - From Address
    - _verifyCallResult(bool,bytes,string) (private)
    - functionCall(address,bytes) (internal)
    - functionCall(address,bytes,string) (internal)
    - functionCallWithValue(address,bytes,uint256) (internal)
    - functionCallWithValue(address,bytes,uint256,string) (internal)
    - functionDelegateCall(address,bytes) (internal)
    - functionDelegateCall(address,bytes,string) (internal)
    - functionStaticCall(address,bytes) (internal)
    - functionStaticCall(address,bytes,string) (internal)
    - isContract(address) (internal)
    - sendValue(address,uint256) (internal)

+ Contract Context
  - From Context
    - _msgData() (internal)
    - _msgSender() (internal)

+ Contract ERC1155Holder (Most derived contract)
  - From ERC1155Receiver
    - supportsInterface(bytes4) (public)
  - From ERC1155Holder
    - onERC1155BatchReceived(address,address,uint256[],uint256[],bytes) (public)
    - onERC1155Received(address,address,uint256,uint256,bytes) (public)

+ Contract ERC1155Receiver
  - From IERC1155Receiver
    - onERC1155BatchReceived(address,address,uint256[],uint256[],bytes) (external)
    - onERC1155Received(address,address,uint256,uint256,bytes) (external)
  - From ERC1155Receiver
    - supportsInterface(bytes4) (public)

+ Contract ERC165
  - From ERC165
    - supportsInterface(bytes4) (public)

+ Contract ERC165Checker (Most derived contract)
  - From ERC165Checker
    - _supportsERC165Interface(address,bytes4) (private)
    - getSupportedInterfaces(address,bytes4[]) (internal)
    - supportsAllInterfaces(address,bytes4[]) (internal)
    - supportsERC165(address) (internal)
    - supportsInterface(address,bytes4) (internal)

+ Contract ERC165Storage (Most derived contract)
  - From ERC165Storage
    - _registerInterface(bytes4) (internal)
    - supportsInterface(bytes4) (public)

+ Contract EnumerableSet (Most derived contract)
  - From EnumerableSet
    - _add(EnumerableSet.Set,bytes32) (private)
    - _at(EnumerableSet.Set,uint256) (private)
    - _contains(EnumerableSet.Set,bytes32) (private)
    - _length(EnumerableSet.Set) (private)
    - _remove(EnumerableSet.Set,bytes32) (private)
    - add(EnumerableSet.AddressSet,address) (internal)
    - add(EnumerableSet.Bytes32Set,bytes32) (internal)
    - add(EnumerableSet.UintSet,uint256) (internal)
    - at(EnumerableSet.AddressSet,uint256) (internal)
    - at(EnumerableSet.Bytes32Set,uint256) (internal)
    - at(EnumerableSet.UintSet,uint256) (internal)
    - contains(EnumerableSet.AddressSet,address) (internal)
    - contains(EnumerableSet.Bytes32Set,bytes32) (internal)
    - contains(EnumerableSet.UintSet,uint256) (internal)
    - length(EnumerableSet.AddressSet) (internal)
    - length(EnumerableSet.Bytes32Set) (internal)
    - length(EnumerableSet.UintSet) (internal)
    - remove(EnumerableSet.AddressSet,address) (internal)
    - remove(EnumerableSet.Bytes32Set,bytes32) (internal)
    - remove(EnumerableSet.UintSet,uint256) (internal)

+ Contract IERC165
  - From IERC165
    - supportsInterface(bytes4) (external)

+ Contract Pausable (Most derived contract)
  - From Context
    - _msgData() (internal)
    - _msgSender() (internal)
  - From Pausable
    - _pause() (internal)
    - _unpause() (internal)
    - constructor() (internal)
    - paused() (public)

+ Contract Strings (Most derived contract)
  - From Strings
    - toHexString(uint256) (internal)
    - toHexString(uint256,uint256) (internal)
    - toString(uint256) (internal)

+ Contract IInit
  - From IInit
    - init(uint128,bool,uint256,uint256,uint256[6],address,uint256,string,address,bytes) (external)

+ Contract IMinter
  - From IMinter
    - mint(address,uint256,uint256,bytes) (external)

+ Contract IRegister
  - From IRegister
    - register(string,address,uint128) (external)

+ Contract PRBMathCommon (Most derived contract)
  - From PRBMathCommon
    - exp2(uint256) (internal)
    - mostSignificantBit(uint256) (internal)
    - mulDiv(uint256,uint256,uint256) (internal)
    - mulDivFixedPoint(uint256,uint256) (internal)
    - sqrt(uint256) (internal)

+ Contract PRBMathUD60x18 (Most derived contract)
  - From PRBMathUD60x18
    - avg(uint256,uint256) (internal)
    - ceil(uint256) (internal)
    - div(uint256,uint256) (internal)
    - e() (internal)
    - exp(uint256) (internal)
    - exp2(uint256) (internal)
    - floor(uint256) (internal)
    - frac(uint256) (internal)
    - gm(uint256,uint256) (internal)
    - inv(uint256) (internal)
    - ln(uint256) (internal)
    - log10(uint256) (internal)
    - log2(uint256) (internal)
    - mul(uint256,uint256) (internal)
    - pi() (internal)
    - pow(uint256,uint256) (internal)
    - scale() (internal)
    - sqrt(uint256) (internal)

INFO:Slither:. analyzed (30 contracts)
INFO:Slither:Use https://crytic.io/ to get access to additional detectors and Github integration
```