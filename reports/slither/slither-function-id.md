```
'npx hardhat compile --force' running
Compiling 28 files with 0.8.4
Compilation finished successfully

Solidity 0.8.4 is not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.

Learn more at https://hardhat.org/reference/solidity-support"


INFO:Printers:
Bezier:
+------+----+
| Name | ID |
+------+----+
+------+----+

Bondzier:
+------------------------------------------------------------------------------------+------------+
|                                        Name                                        |     ID     |
+------------------------------------------------------------------------------------+------------+
| init(uint128,bool,uint256,uint256,uint256[6],address,uint256,string,address,bytes) | 0x7856b76f |
|                                   constructor()                                    | 0x90fa17bb |
|                                       step()                                       | 0xe25fe175 |
|                                    available()                                     | 0x48a0d754 |
|                                  priceN(uint256)                                   | 0x7f7d1a21 |
|                                    nextPrice()                                     | 0xef9089d6 |
|                                       buy()                                        | 0xa6f2ae3a |
| init(uint128,bool,uint256,uint256,uint256[6],address,uint256,string,address,bytes) | 0x7856b76f |
|                                       uri()                                        | 0xeac989f8 |
|                               tokenContractAddress()                               | 0x82edaf94 |
|                                   OwnerAddress()                                   | 0x7f17b05d |
|                                    p0(uint256)                                     | 0x0cc70726 |
|                                    p1(uint256)                                     | 0xe28756b4 |
|                                    p2(uint256)                                     | 0xce427bcc |
|                                    p3(uint256)                                     | 0x154cf101 |
|                                        n()                                         | 0x2e52d606 |
|                                      total()                                       | 0x2ddbd13a |
|                                       amnt()                                       | 0x04b1909e |
|                                     endTime()                                      | 0x3197cbb6 |
|                                      nonce()                                       | 0xaffed0e0 |
|                                        h()                                         | 0xb8c9d365 |
|                                  isNonFungible()                                   | 0x9ba78b39 |
|                                       data()                                       | 0x73d4a13a |
+------------------------------------------------------------------------------------+------------+

Bondzier1155:
+------------------------------------------------------------------+------------+
|                               Name                               |     ID     |
+------------------------------------------------------------------+------------+
|                 register(string,address,uint128)                 | 0xb8ce9127 |
|               mint(address,uint256,uint256,bytes)                | 0x731133e9 |
|                  burn(address,uint256,uint256)                   | 0xf5298aca |
|              burnBatch(address,uint256[],uint256[])              | 0x6b20c454 |
|                       constructor(string)                        | 0xd52b6b8d |
|                    supportsInterface(bytes4)                     | 0x01ffc9a7 |
|                           uri(uint256)                           | 0x0e89341c |
|                    balanceOf(address,uint256)                    | 0x00fdd58e |
|               balanceOfBatch(address[],uint256[])                | 0x4e1273f4 |
|                 setApprovalForAll(address,bool)                  | 0xa22cb465 |
|                isApprovedForAll(address,address)                 | 0xe985e9c5 |
|     safeTransferFrom(address,address,uint256,uint256,bytes)      | 0xf242432a |
| safeBatchTransferFrom(address,address,uint256[],uint256[],bytes) | 0x2eb2c2d6 |
|                           uri(uint256)                           | 0x0e89341c |
|                    balanceOf(address,uint256)                    | 0x00fdd58e |
|               balanceOfBatch(address[],uint256[])                | 0x4e1273f4 |
|                 setApprovalForAll(address,bool)                  | 0xa22cb465 |
|                isApprovedForAll(address,address)                 | 0xe985e9c5 |
|     safeTransferFrom(address,address,uint256,uint256,bytes)      | 0xf242432a |
| safeBatchTransferFrom(address,address,uint256[],uint256[],bytes) | 0x2eb2c2d6 |
|                    supportsInterface(bytes4)                     | 0x01ffc9a7 |
|                    supportsInterface(bytes4)                     | 0x01ffc9a7 |
|                    supportsInterface(bytes4)                     | 0x01ffc9a7 |
|                  getRoleMember(bytes32,uint256)                  | 0x9010d07c |
|                   getRoleMemberCount(bytes32)                    | 0xca15c873 |
|                    grantRole(bytes32,address)                    | 0x2f2ff15d |
|                   revokeRole(bytes32,address)                    | 0xd547741f |
|                  renounceRole(bytes32,address)                   | 0x36568abe |
|                    supportsInterface(bytes4)                     | 0x01ffc9a7 |
|                     hasRole(bytes32,address)                     | 0x91d14854 |
|                      getRoleAdmin(bytes32)                       | 0x248a9ca3 |
|                    grantRole(bytes32,address)                    | 0x2f2ff15d |
|                   revokeRole(bytes32,address)                    | 0xd547741f |
|                  renounceRole(bytes32,address)                   | 0x36568abe |
|                     hasRole(bytes32,address)                     | 0x91d14854 |
|                      getRoleAdmin(bytes32)                       | 0x248a9ca3 |
|                    grantRole(bytes32,address)                    | 0x2f2ff15d |
|                   revokeRole(bytes32,address)                    | 0xd547741f |
|                  renounceRole(bytes32,address)                   | 0x36568abe |
|                  getRoleMember(bytes32,uint256)                  | 0x9010d07c |
|                   getRoleMemberCount(bytes32)                    | 0xca15c873 |
|                       constructor(string)                        | 0xd52b6b8d |
|                 register(string,address,uint128)                 | 0xb8ce9127 |
|               mint(address,uint256,uint256,bytes)                | 0x731133e9 |
|           mintBatch(address,uint256[],uint256[],bytes)           | 0x1f7fdffa |
|                    supportsInterface(bytes4)                     | 0x01ffc9a7 |
|                       DEFAULT_ADMIN_ROLE()                       | 0xa217fddf |
|                          MINTER_ROLE()                           | 0xd5391393 |
+------------------------------------------------------------------+------------+

BondzierFactory:
+--------------------------------------------------------------------------------------+------------+
|                                         Name                                         |     ID     |
+--------------------------------------------------------------------------------------+------------+
|                             constructor(address,address)                             | 0x4525f804 |
|                                 allContractsLength()                                 | 0x5067e5b6 |
|                               predictAddress(bytes32)                                | 0x9c76b654 |
| createBondzier(bool,uint256,uint256,uint256[6],address,uint256,string,bytes32,bytes) | 0xd9e1bcc7 |
|                              bondzierContractAddress()                               | 0x677132db |
|                                tokenContractAddress()                                | 0x82edaf94 |
|                                  contracts(uint256)                                  | 0x474da79a |
|                                       nonce()                                        | 0xaffed0e0 |
+--------------------------------------------------------------------------------------+------------+

Clones:
+------+----+
| Name | ID |
+------+----+
+------+----+

Address:
+------+----+
| Name | ID |
+------+----+
+------+----+

ERC1155Holder:
+-------------------------------------------------------------------+------------+
|                                Name                               |     ID     |
+-------------------------------------------------------------------+------------+
|                     supportsInterface(bytes4)                     | 0x01ffc9a7 |
|      onERC1155Received(address,address,uint256,uint256,bytes)     | 0xf23a6e61 |
| onERC1155BatchReceived(address,address,uint256[],uint256[],bytes) | 0xbc197c81 |
|                     supportsInterface(bytes4)                     | 0x01ffc9a7 |
|                     supportsInterface(bytes4)                     | 0x01ffc9a7 |
|      onERC1155Received(address,address,uint256,uint256,bytes)     | 0xf23a6e61 |
| onERC1155BatchReceived(address,address,uint256[],uint256[],bytes) | 0xbc197c81 |
+-------------------------------------------------------------------+------------+

ERC165Checker:
+------+----+
| Name | ID |
+------+----+
+------+----+

ERC165Storage:
+---------------------------+------------+
|            Name           |     ID     |
+---------------------------+------------+
| supportsInterface(bytes4) | 0x01ffc9a7 |
| supportsInterface(bytes4) | 0x01ffc9a7 |
| supportsInterface(bytes4) | 0x01ffc9a7 |
+---------------------------+------------+

EnumerableSet:
+------+----+
| Name | ID |
+------+----+
+------+----+

Pausable:
+----------+------------+
|   Name   |     ID     |
+----------+------------+
| paused() | 0x5c975abb |
+----------+------------+

Strings:
+------+----+
| Name | ID |
+------+----+
+------+----+

PRBMathCommon:
+------+----+
| Name | ID |
+------+----+
+------+----+

PRBMathUD60x18:
+------+----+
| Name | ID |
+------+----+
+------+----+

INFO:Slither:. analyzed (30 contracts)
INFO:Slither:Use https://crytic.io/ to get access to additional detectors and Github integration
```