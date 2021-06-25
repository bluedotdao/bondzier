```
'npx hardhat compile --force' running
Compiling 28 files with 0.8.4
Compilation finished successfully

Solidity 0.8.4 is not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.

Learn more at https://hardhat.org/reference/solidity-support"


INFO:Printers:
Contract Bezier
Contract vars: ['THREE']
Inheritance:: []
 
+-------------------------------------------------------------+------------+-----------+-----------+-----------+--------------------+---------------------------------------------------------------------+
|                           Function                          | Visibility | Modifiers |    Read   |   Write   |   Internal Calls   |                            External Calls                           |
+-------------------------------------------------------------+------------+-----------+-----------+-----------+--------------------+---------------------------------------------------------------------+
|                     pow(uint256,uint256)                    |  internal  |     []    |     []    |     []    |         []         |                     ['PRBMathUD60x18.pow(t,e)']                     |
|                       precalc(uint256)                      |  internal  |     []    | ['THREE'] |     []    |      ['pow']       | ['THREE.mul(pow(1e18 - t,2)).mul(t)', 'THREE.mul(pow(1e18 - t,2))'] |
|                                                             |            |           |           |           |                    |     ['THREE.mul(1e18 - t)', 'THREE.mul(1e18 - t).mul(pow(t,2))']    |
| bezier(uint256[2],uint256[2],uint256[2],uint256[2],uint256) |  internal  |     []    |     []    |     []    | ['pow', 'precalc'] |        ['pow(t,3).mul(p3[0])', 'pow(1e18 - t,3).mul(p0[1])']        |
|                                                             |            |           |           |           |                    |                   ['a.mul(p1[0])', 'a.mul(p1[1])']                  |
|                                                             |            |           |           |           |                    |               ['b.mul(p2[1])', 'pow(t,3).mul(p3[1])']               |
|                                                             |            |           |           |           |                    |            ['pow(1e18 - t,3).mul(p0[0])', 'b.mul(p2[0])']           |
|       bezierY(uint256,uint256,uint256,uint256,uint256)      |  internal  |     []    |     []    |     []    | ['pow', 'precalc'] |              ['pow(1e18 - t,3).mul(p0y)', 'a.mul(p1y)']             |
|                                                             |            |           |           |           |                    |                 ['b.mul(p2y)', 'pow(t,3).mul(p3y)']                 |
|       bezierX(uint256,uint256,uint256,uint256,uint256)      |  internal  |     []    |     []    |     []    | ['pow', 'precalc'] |              ['pow(1e18 - t,3).mul(p0x)', 'a.mul(p1x)']             |
|                                                             |            |           |           |           |                    |                 ['b.mul(p2x)', 'pow(t,3).mul(p3x)']                 |
|            slitherConstructorConstantVariables()            |  internal  |     []    |     []    | ['THREE'] |         []         |                                  []                                 |
+-------------------------------------------------------------+------------+-----------+-----------+-----------+--------------------+---------------------------------------------------------------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract Bondzier
Contract vars: ['uri', 'tokenContractAddress', 'OwnerAddress', 'p0', 'p1', 'p2', 'p3', 't', 'n', 'total', 'amnt', 'endTime', 'nonce', 'h', 'isNonFungible', 'm', 'data']
Inheritance:: ['IInit']
 
+------------------------------------------------------------------------------------+------------+-----------+------------------------------+-----------------------------------+---------------------------------------+------------------------------------------------------------------------------+
|                                      Function                                      | Visibility | Modifiers |             Read             |               Write               |             Internal Calls            |                                External Calls                                |
+------------------------------------------------------------------------------------+------------+-----------+------------------------------+-----------------------------------+---------------------------------------+------------------------------------------------------------------------------+
| init(uint128,bool,uint256,uint256,uint256[6],address,uint256,string,address,bytes) |  external  |     []    |              []              |                 []                |                   []                  |                                      []                                      |
|                                   constructor()                                    |   public   |     []    |              []              |               ['t']               |                   []                  |                                      []                                      |
|                                       step()                                       |   public   |     []    |          ['total']           |                 []                |                   []                  |                     ['PRBMathUD60x18.inv(total - 1e18)']                     |
|                                    available()                                     |  external  |     []    |        ['n', 'total']        |                 []                |                   []                  |                                      []                                      |
|                                  priceN(uint256)                                   |  external  |     []    |         ['p0', 'p1']         |                 []                |    ['step', 'require(bool,string)']   | ['_n.mul(step())', 'Bezier.bezierY(p0[1],p1[1],p2[1],p3[1],_n.mul(step()))'] |
|                                                                                    |            |           |         ['p2', 'p3']         |                                   |                                       |                         ['PRBMathUD60x18.frac(_n)']                          |
|                                                                                    |            |           |          ['total']           |                                   |                                       |                                                                              |
|                                    nextPrice()                                     |   public   |     []    |         ['n', 'p0']          |                 []                |    ['step', 'require(bool,string)']   |  ['n.mul(step())', 'Bezier.bezierY(p0[1],p1[1],p2[1],p3[1],n.mul(step()))']  |
|                                                                                    |            |           |         ['p1', 'p2']         |                                   |                                       |                                                                              |
|                                                                                    |            |           |       ['p3', 'total']        |                                   |                                       |                                                                              |
|                                       buy()                                        |  external  |     []    |   ['OwnerAddress', 'amnt']   |             ['h', 'n']            | ['require(bool,string)', 'nextPrice'] |   ['OwnerAddress.call{value: price}()', 'm.mint(msg.sender,id,amnt,data)']   |
|                                                                                    |            |           |     ['data', 'endTime']      |                                   |                                       |                     ['msg.sender.call{value: change}()']                     |
|                                                                                    |            |           |    ['h', 'isNonFungible']    |                                   |                                       |                                                                              |
|                                                                                    |            |           |          ['m', 'n']          |                                   |                                       |                                                                              |
|                                                                                    |            |           | ['nonce', 'block.timestamp'] |                                   |                                       |                                                                              |
|                                                                                    |            |           | ['msg.sender', 'msg.value']  |                                   |                                       |                                                                              |
| init(uint128,bool,uint256,uint256,uint256[6],address,uint256,string,address,bytes) |  external  |     []    |        ['t', 'total']        |      ['OwnerAddress', 'amnt']     |        ['require(bool,string)']       |                       ['PRBMathUD60x18.frac(_total)']                        |
|                                                                                    |            |           |     ['block.timestamp']      |        ['data', 'endTime']        |                                       |                                                                              |
|                                                                                    |            |           |                              |       ['h', 'isNonFungible']      |                                       |                                                                              |
|                                                                                    |            |           |                              |             ['m', 'n']            |                                       |                                                                              |
|                                                                                    |            |           |                              |          ['nonce', 'p0']          |                                       |                                                                              |
|                                                                                    |            |           |                              |            ['p1', 'p2']           |                                       |                                                                              |
|                                                                                    |            |           |                              |            ['p3', 't']            |                                       |                                                                              |
|                                                                                    |            |           |                              | ['tokenContractAddress', 'total'] |                                       |                                                                              |
|                                                                                    |            |           |                              |              ['uri']              |                                       |                                                                              |
+------------------------------------------------------------------------------------+------------+-----------+------------------------------+-----------------------------------+---------------------------------------+------------------------------------------------------------------------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract Bondzier1155
Contract vars: ['_roles', 'DEFAULT_ADMIN_ROLE', '_roleMembers', '_balances', '_operatorApprovals', '_uri', 'MINTER_ROLE']
Inheritance:: ['IRegister', 'IMinter', 'ERC1155Burnable', 'ERC1155', 'IERC1155MetadataURI', 'IERC1155', 'AccessControlEnumerable', 'AccessControl', 'ERC165', 'IERC165', 'IAccessControl', 'Context', 'IAccessControlEnumerable']
 
+----------------------------------------------------------------------------------------+------------+------------------------------+---------------------------------------+---------------------------------------+-----------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|                                        Function                                        | Visibility |          Modifiers           |                  Read                 |                 Write                 |                          Internal Calls                         |                                                                                      External Calls                                                                                     |
+----------------------------------------------------------------------------------------+------------+------------------------------+---------------------------------------+---------------------------------------+-----------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|                            register(string,address,uint128)                            |  external  |              []              |                   []                  |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                          mint(address,uint256,uint256,bytes)                           |  external  |              []              |                   []                  |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                             burn(address,uint256,uint256)                              |   public   |              []              |                   []                  |                   []                  |                ['_burn', 'require(bool,string)']                |                                                                                            []                                                                                           |
|                                                                                        |            |                              |                                       |                                       |                ['isApprovedForAll', '_msgSender']               |                                                                                                                                                                                         |
|                         burnBatch(address,uint256[],uint256[])                         |   public   |              []              |                   []                  |                   []                  |              ['_burnBatch', 'require(bool,string)']             |                                                                                            []                                                                                           |
|                                                                                        |            |                              |                                       |                                       |                ['isApprovedForAll', '_msgSender']               |                                                                                                                                                                                         |
|                                  constructor(string)                                   |   public   |              []              |                   []                  |                   []                  |                           ['_setURI']                           |                                                                                            []                                                                                           |
|                               supportsInterface(bytes4)                                |   public   |              []              |                   []                  |                   []                  |                 ['supportsInterface', 'type()']                 |                                                                                            []                                                                                           |
|                                      uri(uint256)                                      |   public   |              []              |                ['_uri']               |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                               balanceOf(address,uint256)                               |   public   |              []              |             ['_balances']             |                   []                  |                     ['require(bool,string)']                    |                                                                                            []                                                                                           |
|                          balanceOfBatch(address[],uint256[])                           |   public   |              []              |                   []                  |                   []                  |              ['require(bool,string)', 'balanceOf']              |                                                                            ['new uint256[](accounts.length)']                                                                           |
|                            setApprovalForAll(address,bool)                             |   public   |              []              |                   []                  |         ['_operatorApprovals']        |              ['require(bool,string)', '_msgSender']             |                                                                                            []                                                                                           |
|                           isApprovedForAll(address,address)                            |   public   |              []              |         ['_operatorApprovals']        |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                safeTransferFrom(address,address,uint256,uint256,bytes)                 |   public   |              []              |                   []                  |                   []                  |          ['_safeTransferFrom', 'require(bool,string)']          |                                                                                            []                                                                                           |
|                                                                                        |            |                              |                                       |                                       |                ['isApprovedForAll', '_msgSender']               |                                                                                                                                                                                         |
|            safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)            |   public   |              []              |                   []                  |                   []                  |        ['_safeBatchTransferFrom', 'require(bool,string)']       |                                                                                            []                                                                                           |
|                                                                                        |            |                              |                                       |                                       |                ['isApprovedForAll', '_msgSender']               |                                                                                                                                                                                         |
|                _safeTransferFrom(address,address,uint256,uint256,bytes)                |  internal  |              []              |             ['_balances']             |             ['_balances']             |              ['require(bool,string)', '_msgSender']             |                                                                                            []                                                                                           |
|                                                                                        |            |                              |                                       |                                       |    ['_beforeTokenTransfer', '_doSafeTransferAcceptanceCheck']   |                                                                                                                                                                                         |
|                                                                                        |            |                              |                                       |                                       |                      ['_asSingletonArray']                      |                                                                                                                                                                                         |
|           _safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)            |  internal  |              []              |             ['_balances']             |             ['_balances']             | ['_beforeTokenTransfer', '_doSafeBatchTransferAcceptanceCheck'] |                                                                                            []                                                                                           |
|                                                                                        |            |                              |                                       |                                       |              ['require(bool,string)', '_msgSender']             |                                                                                                                                                                                         |
|                                    _setURI(string)                                     |  internal  |              []              |                   []                  |                ['_uri']               |                                []                               |                                                                                            []                                                                                           |
|                          _mint(address,uint256,uint256,bytes)                          |  internal  |              []              |             ['_balances']             |             ['_balances']             |              ['require(bool,string)', '_msgSender']             |                                                                                            []                                                                                           |
|                                                                                        |            |                              |                                       |                                       |    ['_beforeTokenTransfer', '_doSafeTransferAcceptanceCheck']   |                                                                                                                                                                                         |
|                                                                                        |            |                              |                                       |                                       |                      ['_asSingletonArray']                      |                                                                                                                                                                                         |
|                     _mintBatch(address,uint256[],uint256[],bytes)                      |  internal  |              []              |             ['_balances']             |             ['_balances']             | ['_beforeTokenTransfer', '_doSafeBatchTransferAcceptanceCheck'] |                                                                                            []                                                                                           |
|                                                                                        |            |                              |                                       |                                       |              ['require(bool,string)', '_msgSender']             |                                                                                                                                                                                         |
|                             _burn(address,uint256,uint256)                             |  internal  |              []              |             ['_balances']             |             ['_balances']             |          ['_beforeTokenTransfer', '_asSingletonArray']          |                                                                                            []                                                                                           |
|                                                                                        |            |                              |                                       |                                       |              ['require(bool,string)', '_msgSender']             |                                                                                                                                                                                         |
|                        _burnBatch(address,uint256[],uint256[])                         |  internal  |              []              |             ['_balances']             |             ['_balances']             |         ['_beforeTokenTransfer', 'require(bool,string)']        |                                                                                            []                                                                                           |
|                                                                                        |            |                              |                                       |                                       |                          ['_msgSender']                         |                                                                                                                                                                                         |
|        _beforeTokenTransfer(address,address,address,uint256[],uint256[],bytes)         |  internal  |              []              |                   []                  |                   []                  |                                []                               |                                                                                            []                                                                                           |
|     _doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes)      |  private   |              []              |                   []                  |                   []                  |                        ['revert(string)']                       |                                               ['IERC1155Receiver(to).onERC1155Received(operator,from,id,amount,data)', 'to.isContract()']                                               |
| _doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes) |  private   |              []              |                   []                  |                   []                  |                        ['revert(string)']                       |                                            ['to.isContract()', 'IERC1155Receiver(to).onERC1155BatchReceived(operator,from,ids,amounts,data)']                                           |
|                               _asSingletonArray(uint256)                               |  private   |              []              |                   []                  |                   []                  |                                []                               |                                                                                   ['new uint256[](1)']                                                                                  |
|                                      uri(uint256)                                      |  external  |              []              |                   []                  |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                               balanceOf(address,uint256)                               |  external  |              []              |                   []                  |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                          balanceOfBatch(address[],uint256[])                           |  external  |              []              |                   []                  |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                            setApprovalForAll(address,bool)                             |  external  |              []              |                   []                  |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                           isApprovedForAll(address,address)                            |  external  |              []              |                   []                  |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                safeTransferFrom(address,address,uint256,uint256,bytes)                 |  external  |              []              |                   []                  |                   []                  |                                []                               |                                                                                            []                                                                                           |
|            safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)            |  external  |              []              |                   []                  |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                               supportsInterface(bytes4)                                |  external  |              []              |                   []                  |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                               supportsInterface(bytes4)                                |   public   |              []              |                   []                  |                   []                  |                            ['type()']                           |                                                                                            []                                                                                           |
|                                      _msgSender()                                      |  internal  |              []              |             ['msg.sender']            |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                                       _msgData()                                       |  internal  |              []              |              ['msg.data']             |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                               supportsInterface(bytes4)                                |   public   |              []              |                   []                  |                   []                  |                 ['supportsInterface', 'type()']                 |                                                                                            []                                                                                           |
|                             getRoleMember(bytes32,uint256)                             |   public   |              []              |            ['_roleMembers']           |                   []                  |                                []                               |                                                                             ['_roleMembers[role].at(index)']                                                                            |
|                              getRoleMemberCount(bytes32)                               |   public   |              []              |            ['_roleMembers']           |                   []                  |                                []                               |                                                                             ['_roleMembers[role].length()']                                                                             |
|                               grantRole(bytes32,address)                               |   public   |              []              |            ['_roleMembers']           |                   []                  |                          ['grantRole']                          |                                                                           ['_roleMembers[role].add(account)']                                                                           |
|                              revokeRole(bytes32,address)                               |   public   |              []              |            ['_roleMembers']           |                   []                  |                          ['revokeRole']                         |                                                                          ['_roleMembers[role].remove(account)']                                                                         |
|                             renounceRole(bytes32,address)                              |   public   |              []              |            ['_roleMembers']           |                   []                  |                         ['renounceRole']                        |                                                                          ['_roleMembers[role].remove(account)']                                                                         |
|                              _setupRole(bytes32,address)                               |  internal  |              []              |            ['_roleMembers']           |                   []                  |                          ['_setupRole']                         |                                                                           ['_roleMembers[role].add(account)']                                                                           |
|                               supportsInterface(bytes4)                                |   public   |              []              |                   []                  |                   []                  |                 ['supportsInterface', 'type()']                 |                                                                                            []                                                                                           |
|                                hasRole(bytes32,address)                                |   public   |              []              |               ['_roles']              |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                              _checkRole(bytes32,address)                               |  internal  |              []              |                   []                  |                   []                  |             ['revert(string)', 'abi.encodePacked()']            | ['Strings.toHexString(uint256(role),32)', 'abi.encodePacked(AccessControl: account ,Strings.toHexString(uint160(account),20), is missing role ,Strings.toHexString(uint256(role),32))'] |
|                                                                                        |            |                              |                                       |                                       |                           ['hasRole']                           |                                                                       ['Strings.toHexString(uint160(account),20)']                                                                      |
|                                 getRoleAdmin(bytes32)                                  |   public   |              []              |               ['_roles']              |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                               grantRole(bytes32,address)                               |   public   | ['getRoleAdmin', 'onlyRole'] |                   []                  |                   []                  |                  ['getRoleAdmin', '_grantRole']                 |                                                                                            []                                                                                           |
|                                                                                        |            |                              |                                       |                                       |                           ['onlyRole']                          |                                                                                                                                                                                         |
|                              revokeRole(bytes32,address)                               |   public   | ['getRoleAdmin', 'onlyRole'] |                   []                  |                   []                  |                 ['_revokeRole', 'getRoleAdmin']                 |                                                                                            []                                                                                           |
|                                                                                        |            |                              |                                       |                                       |                           ['onlyRole']                          |                                                                                                                                                                                         |
|                             renounceRole(bytes32,address)                              |   public   |              []              |                   []                  |                   []                  |             ['_revokeRole', 'require(bool,string)']             |                                                                                            []                                                                                           |
|                                                                                        |            |                              |                                       |                                       |                          ['_msgSender']                         |                                                                                                                                                                                         |
|                              _setupRole(bytes32,address)                               |  internal  |              []              |                   []                  |                   []                  |                          ['_grantRole']                         |                                                                                            []                                                                                           |
|                             _setRoleAdmin(bytes32,bytes32)                             |  internal  |              []              |               ['_roles']              |               ['_roles']              |                         ['getRoleAdmin']                        |                                                                                            []                                                                                           |
|                              _grantRole(bytes32,address)                               |  private   |              []              |               ['_roles']              |               ['_roles']              |                    ['hasRole', '_msgSender']                    |                                                                                            []                                                                                           |
|                              _revokeRole(bytes32,address)                              |  private   |              []              |               ['_roles']              |               ['_roles']              |                    ['hasRole', '_msgSender']                    |                                                                                            []                                                                                           |
|                                hasRole(bytes32,address)                                |  external  |              []              |                   []                  |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                                 getRoleAdmin(bytes32)                                  |  external  |              []              |                   []                  |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                               grantRole(bytes32,address)                               |  external  |              []              |                   []                  |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                              revokeRole(bytes32,address)                               |  external  |              []              |                   []                  |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                             renounceRole(bytes32,address)                              |  external  |              []              |                   []                  |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                             getRoleMember(bytes32,uint256)                             |  external  |              []              |                   []                  |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                              getRoleMemberCount(bytes32)                               |  external  |              []              |                   []                  |                   []                  |                                []                               |                                                                                            []                                                                                           |
|                                  constructor(string)                                   |   public   |              []              |         ['DEFAULT_ADMIN_ROLE']        |                   []                  |                        ['_setupRole', '']                       |                                                                                            []                                                                                           |
|                                                                                        |            |                              |                                       |                                       |                          ['_msgSender']                         |                                                                                                                                                                                         |
|                            register(string,address,uint128)                            |  external  |              []              | ['DEFAULT_ADMIN_ROLE', 'MINTER_ROLE'] |                   []                  |              ['grantRole', 'require(bool,string)']              |                                                                                            []                                                                                           |
|                                                                                        |            |                              |                                       |                                       |                    ['hasRole', '_msgSender']                    |                                                                                                                                                                                         |
|                          mint(address,uint256,uint256,bytes)                           |  external  |              []              |            ['MINTER_ROLE']            |                   []                  |                ['_mint', 'require(bool,string)']                |                                                                                            []                                                                                           |
|                                                                                        |            |                              |                                       |                                       |                    ['hasRole', '_msgSender']                    |                                                                                                                                                                                         |
|                      mintBatch(address,uint256[],uint256[],bytes)                      |  external  |              []              |            ['MINTER_ROLE']            |                   []                  |              ['_mintBatch', 'require(bool,string)']             |                                                                                            []                                                                                           |
|                                                                                        |            |                              |                                       |                                       |                    ['hasRole', '_msgSender']                    |                                                                                                                                                                                         |
|                               supportsInterface(bytes4)                                |   public   |              []              |                   []                  |                   []                  |                      ['supportsInterface']                      |                                                                                            []                                                                                           |
|        _beforeTokenTransfer(address,address,address,uint256[],uint256[],bytes)         |  internal  |              []              |                   []                  |                   []                  |                     ['_beforeTokenTransfer']                    |                                                                                            []                                                                                           |
|                         slitherConstructorConstantVariables()                          |  internal  |              []              |                   []                  | ['DEFAULT_ADMIN_ROLE', 'MINTER_ROLE'] |                       ['keccak256(bytes)']                      |                                                                                            []                                                                                           |
+----------------------------------------------------------------------------------------+------------+------------------------------+---------------------------------------+---------------------------------------+-----------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

+-------------------+------------+------+-------+------------------------------+----------------+
|     Modifiers     | Visibility | Read | Write |        Internal Calls        | External Calls |
+-------------------+------------+------+-------+------------------------------+----------------+
| onlyRole(bytes32) |  internal  |  []  |   []  | ['_checkRole', '_msgSender'] |       []       |
+-------------------+------------+------+-------+------------------------------+----------------+

INFO:Printers:
Contract BondzierFactory
Contract vars: ['bondzierContractAddress', 'tokenContractAddress', 'contracts', 'nonce', 'bondzier1155']
Inheritance:: []
 
+--------------------------------------------------------------------------------------+------------+-----------+---------------------------------------------+---------------------------------------------+--------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|                                       Function                                       | Visibility | Modifiers |                     Read                    |                    Write                    |      Internal Calls      |                                                                     External Calls                                                                    |
+--------------------------------------------------------------------------------------+------------+-----------+---------------------------------------------+---------------------------------------------+--------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|                             constructor(address,address)                             |   public   |     []    |           ['tokenContractAddress']          | ['bondzier1155', 'bondzierContractAddress'] | ['require(bool,string)'] |                                                                           []                                                                          |
|                                                                                      |            |           |                                             |           ['tokenContractAddress']          |                          |                                                                                                                                                       |
|                                 allContractsLength()                                 |  external  |     []    |                ['contracts']                |                      []                     |            []            |                                                                           []                                                                          |
|                               predictAddress(bytes32)                                |  external  |     []    |         ['bondzierContractAddress']         |                      []                     |            []            |                                         ['Clones.predictDeterministicAddress(bondzierContractAddress,_salt)']                                         |
| createBondzier(bool,uint256,uint256,uint256[6],address,uint256,string,bytes32,bytes) |  external  |     []    | ['bondzier1155', 'bondzierContractAddress'] |            ['contracts', 'nonce']           |            []            |                                   ['contracts.push(pa)', 'Clones.cloneDeterministic(bondzierContractAddress,_salt)']                                  |
|                                                                                      |            |           |            ['contracts', 'nonce']           |                                             |                          | ['bondzier1155.register(_uri,pa,_n)', 'IInit(pa).init(_n,_isNonFungible,_amnt,_total,_points,_owneraddress,_endTime,_uri,tokenContractAddress,data)'] |
|                                                                                      |            |           |       ['tokenContractAddress', 'this']      |                                             |                          |                                                             ['this.predictAddress(_salt)']                                                            |
|                            slitherConstructorVariables()                             |  internal  |     []    |                      []                     |                  ['nonce']                  |            []            |                                                                           []                                                                          |
+--------------------------------------------------------------------------------------+------------+-----------+---------------------------------------------+---------------------------------------------+--------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract Clones
Contract vars: []
Inheritance:: []
 
+------------------------------------------------------+------------+-----------+----------+-------+----------------------------------------------------------------------+----------------+
|                       Function                       | Visibility | Modifiers |   Read   | Write |                            Internal Calls                            | External Calls |
+------------------------------------------------------+------------+-----------+----------+-------+----------------------------------------------------------------------+----------------+
|                    clone(address)                    |  internal  |     []    |    []    |   []  |            ['mload(uint256)', 'mstore(uint256,uint256)']             |       []       |
|                                                      |            |           |          |       |     ['require(bool,string)', 'create(uint256,uint256,uint256)']      |                |
|         cloneDeterministic(address,bytes32)          |  internal  |     []    |    []    |   []  |            ['mload(uint256)', 'mstore(uint256,uint256)']             |       []       |
|                                                      |            |           |          |       | ['create2(uint256,uint256,uint256,uint256)', 'require(bool,string)'] |                |
| predictDeterministicAddress(address,bytes32,address) |  internal  |     []    |    []    |   []  |           ['keccak256(uint256,uint256)', 'mload(uint256)']           |       []       |
|                                                      |            |           |          |       |                     ['mstore(uint256,uint256)']                      |                |
|     predictDeterministicAddress(address,bytes32)     |  internal  |     []    | ['this'] |   []  |                   ['predictDeterministicAddress']                    |       []       |
+------------------------------------------------------+------------+-----------+----------+-------+----------------------------------------------------------------------+----------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract ERC1155
Contract vars: ['_balances', '_operatorApprovals', '_uri']
Inheritance:: ['IERC1155MetadataURI', 'IERC1155', 'ERC165', 'IERC165', 'Context']
 
+----------------------------------------------------------------------------------------+------------+-----------+------------------------+------------------------+-----------------------------------------------------------------+----------------------------------------------------------------------------------------------------+
|                                        Function                                        | Visibility | Modifiers |          Read          |         Write          |                          Internal Calls                         |                                           External Calls                                           |
+----------------------------------------------------------------------------------------+------------+-----------+------------------------+------------------------+-----------------------------------------------------------------+----------------------------------------------------------------------------------------------------+
|                                      uri(uint256)                                      |  external  |     []    |           []           |           []           |                                []                               |                                                 []                                                 |
|                               balanceOf(address,uint256)                               |  external  |     []    |           []           |           []           |                                []                               |                                                 []                                                 |
|                          balanceOfBatch(address[],uint256[])                           |  external  |     []    |           []           |           []           |                                []                               |                                                 []                                                 |
|                            setApprovalForAll(address,bool)                             |  external  |     []    |           []           |           []           |                                []                               |                                                 []                                                 |
|                           isApprovedForAll(address,address)                            |  external  |     []    |           []           |           []           |                                []                               |                                                 []                                                 |
|                safeTransferFrom(address,address,uint256,uint256,bytes)                 |  external  |     []    |           []           |           []           |                                []                               |                                                 []                                                 |
|            safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)            |  external  |     []    |           []           |           []           |                                []                               |                                                 []                                                 |
|                               supportsInterface(bytes4)                                |  external  |     []    |           []           |           []           |                                []                               |                                                 []                                                 |
|                               supportsInterface(bytes4)                                |   public   |     []    |           []           |           []           |                            ['type()']                           |                                                 []                                                 |
|                                      _msgSender()                                      |  internal  |     []    |     ['msg.sender']     |           []           |                                []                               |                                                 []                                                 |
|                                       _msgData()                                       |  internal  |     []    |      ['msg.data']      |           []           |                                []                               |                                                 []                                                 |
|                                  constructor(string)                                   |   public   |     []    |           []           |           []           |                           ['_setURI']                           |                                                 []                                                 |
|                               supportsInterface(bytes4)                                |   public   |     []    |           []           |           []           |                 ['supportsInterface', 'type()']                 |                                                 []                                                 |
|                                      uri(uint256)                                      |   public   |     []    |        ['_uri']        |           []           |                                []                               |                                                 []                                                 |
|                               balanceOf(address,uint256)                               |   public   |     []    |     ['_balances']      |           []           |                     ['require(bool,string)']                    |                                                 []                                                 |
|                          balanceOfBatch(address[],uint256[])                           |   public   |     []    |           []           |           []           |              ['require(bool,string)', 'balanceOf']              |                                 ['new uint256[](accounts.length)']                                 |
|                            setApprovalForAll(address,bool)                             |   public   |     []    |           []           | ['_operatorApprovals'] |              ['require(bool,string)', '_msgSender']             |                                                 []                                                 |
|                           isApprovedForAll(address,address)                            |   public   |     []    | ['_operatorApprovals'] |           []           |                                []                               |                                                 []                                                 |
|                safeTransferFrom(address,address,uint256,uint256,bytes)                 |   public   |     []    |           []           |           []           |            ['isApprovedForAll', '_safeTransferFrom']            |                                                 []                                                 |
|                                                                                        |            |           |                        |                        |              ['require(bool,string)', '_msgSender']             |                                                                                                    |
|            safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)            |   public   |     []    |           []           |           []           |          ['isApprovedForAll', '_safeBatchTransferFrom']         |                                                 []                                                 |
|                                                                                        |            |           |                        |                        |              ['require(bool,string)', '_msgSender']             |                                                                                                    |
|                _safeTransferFrom(address,address,uint256,uint256,bytes)                |  internal  |     []    |     ['_balances']      |     ['_balances']      |    ['_doSafeTransferAcceptanceCheck', 'require(bool,string)']   |                                                 []                                                 |
|                                                                                        |            |           |                        |                        |               ['_asSingletonArray', '_msgSender']               |                                                                                                    |
|                                                                                        |            |           |                        |                        |                     ['_beforeTokenTransfer']                    |                                                                                                    |
|           _safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)            |  internal  |     []    |     ['_balances']      |     ['_balances']      | ['_beforeTokenTransfer', '_doSafeBatchTransferAcceptanceCheck'] |                                                 []                                                 |
|                                                                                        |            |           |                        |                        |              ['require(bool,string)', '_msgSender']             |                                                                                                    |
|                                    _setURI(string)                                     |  internal  |     []    |           []           |        ['_uri']        |                                []                               |                                                 []                                                 |
|                          _mint(address,uint256,uint256,bytes)                          |  internal  |     []    |     ['_balances']      |     ['_balances']      |    ['_doSafeTransferAcceptanceCheck', 'require(bool,string)']   |                                                 []                                                 |
|                                                                                        |            |           |                        |                        |               ['_asSingletonArray', '_msgSender']               |                                                                                                    |
|                                                                                        |            |           |                        |                        |                     ['_beforeTokenTransfer']                    |                                                                                                    |
|                     _mintBatch(address,uint256[],uint256[],bytes)                      |  internal  |     []    |     ['_balances']      |     ['_balances']      | ['_beforeTokenTransfer', '_doSafeBatchTransferAcceptanceCheck'] |                                                 []                                                 |
|                                                                                        |            |           |                        |                        |              ['require(bool,string)', '_msgSender']             |                                                                                                    |
|                             _burn(address,uint256,uint256)                             |  internal  |     []    |     ['_balances']      |     ['_balances']      |          ['_beforeTokenTransfer', '_asSingletonArray']          |                                                 []                                                 |
|                                                                                        |            |           |                        |                        |              ['require(bool,string)', '_msgSender']             |                                                                                                    |
|                        _burnBatch(address,uint256[],uint256[])                         |  internal  |     []    |     ['_balances']      |     ['_balances']      |         ['_beforeTokenTransfer', 'require(bool,string)']        |                                                 []                                                 |
|                                                                                        |            |           |                        |                        |                          ['_msgSender']                         |                                                                                                    |
|        _beforeTokenTransfer(address,address,address,uint256[],uint256[],bytes)         |  internal  |     []    |           []           |           []           |                                []                               |                                                 []                                                 |
|     _doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes)      |  private   |     []    |           []           |           []           |                        ['revert(string)']                       |    ['to.isContract()', 'IERC1155Receiver(to).onERC1155Received(operator,from,id,amount,data)']     |
| _doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes) |  private   |     []    |           []           |           []           |                        ['revert(string)']                       | ['to.isContract()', 'IERC1155Receiver(to).onERC1155BatchReceived(operator,from,ids,amounts,data)'] |
|                               _asSingletonArray(uint256)                               |  private   |     []    |           []           |           []           |                                []                               |                                        ['new uint256[](1)']                                        |
+----------------------------------------------------------------------------------------+------------+-----------+------------------------+------------------------+-----------------------------------------------------------------+----------------------------------------------------------------------------------------------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract IERC1155
Contract vars: []
Inheritance:: ['IERC165']
 
+------------------------------------------------------------------+------------+-----------+------+-------+----------------+----------------+
|                             Function                             | Visibility | Modifiers | Read | Write | Internal Calls | External Calls |
+------------------------------------------------------------------+------------+-----------+------+-------+----------------+----------------+
|                    supportsInterface(bytes4)                     |  external  |     []    |  []  |   []  |       []       |       []       |
|                    balanceOf(address,uint256)                    |  external  |     []    |  []  |   []  |       []       |       []       |
|               balanceOfBatch(address[],uint256[])                |  external  |     []    |  []  |   []  |       []       |       []       |
|                 setApprovalForAll(address,bool)                  |  external  |     []    |  []  |   []  |       []       |       []       |
|                isApprovedForAll(address,address)                 |  external  |     []    |  []  |   []  |       []       |       []       |
|     safeTransferFrom(address,address,uint256,uint256,bytes)      |  external  |     []    |  []  |   []  |       []       |       []       |
| safeBatchTransferFrom(address,address,uint256[],uint256[],bytes) |  external  |     []    |  []  |   []  |       []       |       []       |
+------------------------------------------------------------------+------------+-----------+------+-------+----------------+----------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract IERC1155Receiver
Contract vars: []
Inheritance:: ['IERC165']
 
+-------------------------------------------------------------------+------------+-----------+------+-------+----------------+----------------+
|                              Function                             | Visibility | Modifiers | Read | Write | Internal Calls | External Calls |
+-------------------------------------------------------------------+------------+-----------+------+-------+----------------+----------------+
|                     supportsInterface(bytes4)                     |  external  |     []    |  []  |   []  |       []       |       []       |
|      onERC1155Received(address,address,uint256,uint256,bytes)     |  external  |     []    |  []  |   []  |       []       |       []       |
| onERC1155BatchReceived(address,address,uint256[],uint256[],bytes) |  external  |     []    |  []  |   []  |       []       |       []       |
+-------------------------------------------------------------------+------------+-----------+------+-------+----------------+----------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract ERC1155Burnable
Contract vars: ['_balances', '_operatorApprovals', '_uri']
Inheritance:: ['ERC1155', 'IERC1155MetadataURI', 'IERC1155', 'ERC165', 'IERC165', 'Context']
 
+----------------------------------------------------------------------------------------+------------+-----------+------------------------+------------------------+-------------------------------------------------------+----------------------------------------------------------------------------------------------------+
|                                        Function                                        | Visibility | Modifiers |          Read          |         Write          |                     Internal Calls                    |                                           External Calls                                           |
+----------------------------------------------------------------------------------------+------------+-----------+------------------------+------------------------+-------------------------------------------------------+----------------------------------------------------------------------------------------------------+
|                                  constructor(string)                                   |   public   |     []    |           []           |           []           |                      ['_setURI']                      |                                                 []                                                 |
|                               supportsInterface(bytes4)                                |   public   |     []    |           []           |           []           |            ['type()', 'supportsInterface']            |                                                 []                                                 |
|                                      uri(uint256)                                      |   public   |     []    |        ['_uri']        |           []           |                           []                          |                                                 []                                                 |
|                               balanceOf(address,uint256)                               |   public   |     []    |     ['_balances']      |           []           |                ['require(bool,string)']               |                                                 []                                                 |
|                          balanceOfBatch(address[],uint256[])                           |   public   |     []    |           []           |           []           |         ['balanceOf', 'require(bool,string)']         |                                 ['new uint256[](accounts.length)']                                 |
|                            setApprovalForAll(address,bool)                             |   public   |     []    |           []           | ['_operatorApprovals'] |         ['_msgSender', 'require(bool,string)']        |                                                 []                                                 |
|                           isApprovedForAll(address,address)                            |   public   |     []    | ['_operatorApprovals'] |           []           |                           []                          |                                                 []                                                 |
|                safeTransferFrom(address,address,uint256,uint256,bytes)                 |   public   |     []    |           []           |           []           |           ['isApprovedForAll', '_msgSender']          |                                                 []                                                 |
|                                                                                        |            |           |                        |                        |     ['_safeTransferFrom', 'require(bool,string)']     |                                                                                                    |
|            safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)            |   public   |     []    |           []           |           []           |           ['isApprovedForAll', '_msgSender']          |                                                 []                                                 |
|                                                                                        |            |           |                        |                        |   ['require(bool,string)', '_safeBatchTransferFrom']  |                                                                                                    |
|                _safeTransferFrom(address,address,uint256,uint256,bytes)                |  internal  |     []    |     ['_balances']      |     ['_balances']      |    ['require(bool,string)', '_beforeTokenTransfer']   |                                                 []                                                 |
|                                                                                        |            |           |                        |                        |    ['_msgSender', '_doSafeTransferAcceptanceCheck']   |                                                                                                    |
|                                                                                        |            |           |                        |                        |                 ['_asSingletonArray']                 |                                                                                                    |
|           _safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)            |  internal  |     []    |     ['_balances']      |     ['_balances']      | ['_msgSender', '_doSafeBatchTransferAcceptanceCheck'] |                                                 []                                                 |
|                                                                                        |            |           |                        |                        |    ['_beforeTokenTransfer', 'require(bool,string)']   |                                                                                                    |
|                                    _setURI(string)                                     |  internal  |     []    |           []           |        ['_uri']        |                           []                          |                                                 []                                                 |
|                          _mint(address,uint256,uint256,bytes)                          |  internal  |     []    |     ['_balances']      |     ['_balances']      |    ['require(bool,string)', '_beforeTokenTransfer']   |                                                 []                                                 |
|                                                                                        |            |           |                        |                        |    ['_msgSender', '_doSafeTransferAcceptanceCheck']   |                                                                                                    |
|                                                                                        |            |           |                        |                        |                 ['_asSingletonArray']                 |                                                                                                    |
|                     _mintBatch(address,uint256[],uint256[],bytes)                      |  internal  |     []    |     ['_balances']      |     ['_balances']      | ['_msgSender', '_doSafeBatchTransferAcceptanceCheck'] |                                                 []                                                 |
|                                                                                        |            |           |                        |                        |    ['_beforeTokenTransfer', 'require(bool,string)']   |                                                                                                    |
|                             _burn(address,uint256,uint256)                             |  internal  |     []    |     ['_balances']      |     ['_balances']      |         ['_msgSender', '_beforeTokenTransfer']        |                                                 []                                                 |
|                                                                                        |            |           |                        |                        |     ['require(bool,string)', '_asSingletonArray']     |                                                                                                    |
|                        _burnBatch(address,uint256[],uint256[])                         |  internal  |     []    |     ['_balances']      |     ['_balances']      |         ['_msgSender', '_beforeTokenTransfer']        |                                                 []                                                 |
|                                                                                        |            |           |                        |                        |                ['require(bool,string)']               |                                                                                                    |
|        _beforeTokenTransfer(address,address,address,uint256[],uint256[],bytes)         |  internal  |     []    |           []           |           []           |                           []                          |                                                 []                                                 |
|     _doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes)      |  private   |     []    |           []           |           []           |                   ['revert(string)']                  |    ['to.isContract()', 'IERC1155Receiver(to).onERC1155Received(operator,from,id,amount,data)']     |
| _doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes) |  private   |     []    |           []           |           []           |                   ['revert(string)']                  | ['to.isContract()', 'IERC1155Receiver(to).onERC1155BatchReceived(operator,from,ids,amounts,data)'] |
|                               _asSingletonArray(uint256)                               |  private   |     []    |           []           |           []           |                           []                          |                                        ['new uint256[](1)']                                        |
|                                      uri(uint256)                                      |  external  |     []    |           []           |           []           |                           []                          |                                                 []                                                 |
|                               balanceOf(address,uint256)                               |  external  |     []    |           []           |           []           |                           []                          |                                                 []                                                 |
|                          balanceOfBatch(address[],uint256[])                           |  external  |     []    |           []           |           []           |                           []                          |                                                 []                                                 |
|                            setApprovalForAll(address,bool)                             |  external  |     []    |           []           |           []           |                           []                          |                                                 []                                                 |
|                           isApprovedForAll(address,address)                            |  external  |     []    |           []           |           []           |                           []                          |                                                 []                                                 |
|                safeTransferFrom(address,address,uint256,uint256,bytes)                 |  external  |     []    |           []           |           []           |                           []                          |                                                 []                                                 |
|            safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)            |  external  |     []    |           []           |           []           |                           []                          |                                                 []                                                 |
|                               supportsInterface(bytes4)                                |  external  |     []    |           []           |           []           |                           []                          |                                                 []                                                 |
|                               supportsInterface(bytes4)                                |   public   |     []    |           []           |           []           |                       ['type()']                      |                                                 []                                                 |
|                                      _msgSender()                                      |  internal  |     []    |     ['msg.sender']     |           []           |                           []                          |                                                 []                                                 |
|                                       _msgData()                                       |  internal  |     []    |      ['msg.data']      |           []           |                           []                          |                                                 []                                                 |
|                             burn(address,uint256,uint256)                              |   public   |     []    |           []           |           []           |           ['isApprovedForAll', '_msgSender']          |                                                 []                                                 |
|                                                                                        |            |           |                        |                        |           ['_burn', 'require(bool,string)']           |                                                                                                    |
|                         burnBatch(address,uint256[],uint256[])                         |   public   |     []    |           []           |           []           |           ['isApprovedForAll', '_msgSender']          |                                                 []                                                 |
|                                                                                        |            |           |                        |                        |         ['require(bool,string)', '_burnBatch']        |                                                                                                    |
+----------------------------------------------------------------------------------------+------------+-----------+------------------------+------------------------+-------------------------------------------------------+----------------------------------------------------------------------------------------------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract IERC1155MetadataURI
Contract vars: []
Inheritance:: ['IERC1155', 'IERC165']
 
+------------------------------------------------------------------+------------+-----------+------+-------+----------------+----------------+
|                             Function                             | Visibility | Modifiers | Read | Write | Internal Calls | External Calls |
+------------------------------------------------------------------+------------+-----------+------+-------+----------------+----------------+
|                    balanceOf(address,uint256)                    |  external  |     []    |  []  |   []  |       []       |       []       |
|               balanceOfBatch(address[],uint256[])                |  external  |     []    |  []  |   []  |       []       |       []       |
|                 setApprovalForAll(address,bool)                  |  external  |     []    |  []  |   []  |       []       |       []       |
|                isApprovedForAll(address,address)                 |  external  |     []    |  []  |   []  |       []       |       []       |
|     safeTransferFrom(address,address,uint256,uint256,bytes)      |  external  |     []    |  []  |   []  |       []       |       []       |
| safeBatchTransferFrom(address,address,uint256[],uint256[],bytes) |  external  |     []    |  []  |   []  |       []       |       []       |
|                    supportsInterface(bytes4)                     |  external  |     []    |  []  |   []  |       []       |       []       |
|                           uri(uint256)                           |  external  |     []    |  []  |   []  |       []       |       []       |
+------------------------------------------------------------------+------------+-----------+------+-------+----------------+----------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract IAccessControl
Contract vars: []
Inheritance:: []
 
+-------------------------------+------------+-----------+------+-------+----------------+----------------+
|            Function           | Visibility | Modifiers | Read | Write | Internal Calls | External Calls |
+-------------------------------+------------+-----------+------+-------+----------------+----------------+
|    hasRole(bytes32,address)   |  external  |     []    |  []  |   []  |       []       |       []       |
|     getRoleAdmin(bytes32)     |  external  |     []    |  []  |   []  |       []       |       []       |
|   grantRole(bytes32,address)  |  external  |     []    |  []  |   []  |       []       |       []       |
|  revokeRole(bytes32,address)  |  external  |     []    |  []  |   []  |       []       |       []       |
| renounceRole(bytes32,address) |  external  |     []    |  []  |   []  |       []       |       []       |
+-------------------------------+------------+-----------+------+-------+----------------+----------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract AccessControl
Contract vars: ['_roles', 'DEFAULT_ADMIN_ROLE']
Inheritance:: ['ERC165', 'IERC165', 'IAccessControl', 'Context']
 
+---------------------------------------+------------+------------------------------+----------------+------------------------+---------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------+
|                Function               | Visibility |          Modifiers           |      Read      |         Write          |          Internal Calls         |                                                                 External Calls                                                                 |
+---------------------------------------+------------+------------------------------+----------------+------------------------+---------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------+
|       supportsInterface(bytes4)       |   public   |              []              |       []       |           []           |            ['type()']           |                                                                       []                                                                       |
|       supportsInterface(bytes4)       |  external  |              []              |       []       |           []           |                []               |                                                                       []                                                                       |
|        hasRole(bytes32,address)       |  external  |              []              |       []       |           []           |                []               |                                                                       []                                                                       |
|         getRoleAdmin(bytes32)         |  external  |              []              |       []       |           []           |                []               |                                                                       []                                                                       |
|       grantRole(bytes32,address)      |  external  |              []              |       []       |           []           |                []               |                                                                       []                                                                       |
|      revokeRole(bytes32,address)      |  external  |              []              |       []       |           []           |                []               |                                                                       []                                                                       |
|     renounceRole(bytes32,address)     |  external  |              []              |       []       |           []           |                []               |                                                                       []                                                                       |
|              _msgSender()             |  internal  |              []              | ['msg.sender'] |           []           |                []               |                                                                       []                                                                       |
|               _msgData()              |  internal  |              []              |  ['msg.data']  |           []           |                []               |                                                                       []                                                                       |
|       supportsInterface(bytes4)       |   public   |              []              |       []       |           []           | ['supportsInterface', 'type()'] |                                                                       []                                                                       |
|        hasRole(bytes32,address)       |   public   |              []              |   ['_roles']   |           []           |                []               |                                                                       []                                                                       |
|      _checkRole(bytes32,address)      |  internal  |              []              |       []       |           []           |  ['hasRole', 'revert(string)']  |                             ['Strings.toHexString(uint160(account),20)', 'Strings.toHexString(uint256(role),32)']                              |
|                                       |            |                              |                |                        |      ['abi.encodePacked()']     | ['abi.encodePacked(AccessControl: account ,Strings.toHexString(uint160(account),20), is missing role ,Strings.toHexString(uint256(role),32))'] |
|         getRoleAdmin(bytes32)         |   public   |              []              |   ['_roles']   |           []           |                []               |                                                                       []                                                                       |
|       grantRole(bytes32,address)      |   public   | ['onlyRole', 'getRoleAdmin'] |       []       |           []           |   ['onlyRole', 'getRoleAdmin']  |                                                                       []                                                                       |
|                                       |            |                              |                |                        |          ['_grantRole']         |                                                                                                                                                |
|      revokeRole(bytes32,address)      |   public   | ['onlyRole', 'getRoleAdmin'] |       []       |           []           |   ['onlyRole', 'getRoleAdmin']  |                                                                       []                                                                       |
|                                       |            |                              |                |                        |         ['_revokeRole']         |                                                                                                                                                |
|     renounceRole(bytes32,address)     |   public   |              []              |       []       |           []           |  ['_msgSender', '_revokeRole']  |                                                                       []                                                                       |
|                                       |            |                              |                |                        |     ['require(bool,string)']    |                                                                                                                                                |
|      _setupRole(bytes32,address)      |  internal  |              []              |       []       |           []           |          ['_grantRole']         |                                                                       []                                                                       |
|     _setRoleAdmin(bytes32,bytes32)    |  internal  |              []              |   ['_roles']   |       ['_roles']       |         ['getRoleAdmin']        |                                                                       []                                                                       |
|      _grantRole(bytes32,address)      |  private   |              []              |   ['_roles']   |       ['_roles']       |    ['hasRole', '_msgSender']    |                                                                       []                                                                       |
|      _revokeRole(bytes32,address)     |  private   |              []              |   ['_roles']   |       ['_roles']       |    ['hasRole', '_msgSender']    |                                                                       []                                                                       |
| slitherConstructorConstantVariables() |  internal  |              []              |       []       | ['DEFAULT_ADMIN_ROLE'] |                []               |                                                                       []                                                                       |
+---------------------------------------+------------+------------------------------+----------------+------------------------+---------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------+

+-------------------+------------+------+-------+------------------------------+----------------+
|     Modifiers     | Visibility | Read | Write |        Internal Calls        | External Calls |
+-------------------+------------+------+-------+------------------------------+----------------+
| onlyRole(bytes32) |  internal  |  []  |   []  | ['_msgSender', '_checkRole'] |       []       |
+-------------------+------------+------+-------+------------------------------+----------------+

INFO:Printers:
Contract IAccessControlEnumerable
Contract vars: []
Inheritance:: []
 
+--------------------------------+------------+-----------+------+-------+----------------+----------------+
|            Function            | Visibility | Modifiers | Read | Write | Internal Calls | External Calls |
+--------------------------------+------------+-----------+------+-------+----------------+----------------+
| getRoleMember(bytes32,uint256) |  external  |     []    |  []  |   []  |       []       |       []       |
|  getRoleMemberCount(bytes32)   |  external  |     []    |  []  |   []  |       []       |       []       |
+--------------------------------+------------+-----------+------+-------+----------------+----------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract AccessControlEnumerable
Contract vars: ['_roles', 'DEFAULT_ADMIN_ROLE', '_roleMembers']
Inheritance:: ['AccessControl', 'ERC165', 'IERC165', 'IAccessControl', 'Context', 'IAccessControlEnumerable']
 
+---------------------------------------+------------+------------------------------+------------------+------------------------+------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|                Function               | Visibility |          Modifiers           |       Read       |         Write          |              Internal Calls              |                                                                                      External Calls                                                                                     |
+---------------------------------------+------------+------------------------------+------------------+------------------------+------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|       supportsInterface(bytes4)       |   public   |              []              |        []        |           []           |     ['supportsInterface', 'type()']      |                                                                                            []                                                                                           |
|        hasRole(bytes32,address)       |   public   |              []              |    ['_roles']    |           []           |                    []                    |                                                                                            []                                                                                           |
|      _checkRole(bytes32,address)      |  internal  |              []              |        []        |           []           | ['revert(string)', 'abi.encodePacked()'] | ['abi.encodePacked(AccessControl: account ,Strings.toHexString(uint160(account),20), is missing role ,Strings.toHexString(uint256(role),32))', 'Strings.toHexString(uint256(role),32)'] |
|                                       |            |                              |                  |                        |               ['hasRole']                |                                                                       ['Strings.toHexString(uint160(account),20)']                                                                      |
|         getRoleAdmin(bytes32)         |   public   |              []              |    ['_roles']    |           []           |                    []                    |                                                                                            []                                                                                           |
|       grantRole(bytes32,address)      |   public   | ['onlyRole', 'getRoleAdmin'] |        []        |           []           |        ['_grantRole', 'onlyRole']        |                                                                                            []                                                                                           |
|                                       |            |                              |                  |                        |             ['getRoleAdmin']             |                                                                                                                                                                                         |
|      revokeRole(bytes32,address)      |   public   | ['onlyRole', 'getRoleAdmin'] |        []        |           []           |       ['onlyRole', 'getRoleAdmin']       |                                                                                            []                                                                                           |
|                                       |            |                              |                  |                        |             ['_revokeRole']              |                                                                                                                                                                                         |
|     renounceRole(bytes32,address)     |   public   |              []              |        []        |           []           |  ['_msgSender', 'require(bool,string)']  |                                                                                            []                                                                                           |
|                                       |            |                              |                  |                        |             ['_revokeRole']              |                                                                                                                                                                                         |
|      _setupRole(bytes32,address)      |  internal  |              []              |        []        |           []           |              ['_grantRole']              |                                                                                            []                                                                                           |
|     _setRoleAdmin(bytes32,bytes32)    |  internal  |              []              |    ['_roles']    |       ['_roles']       |             ['getRoleAdmin']             |                                                                                            []                                                                                           |
|      _grantRole(bytes32,address)      |  private   |              []              |    ['_roles']    |       ['_roles']       |        ['_msgSender', 'hasRole']         |                                                                                            []                                                                                           |
|      _revokeRole(bytes32,address)     |  private   |              []              |    ['_roles']    |       ['_roles']       |        ['_msgSender', 'hasRole']         |                                                                                            []                                                                                           |
|       supportsInterface(bytes4)       |   public   |              []              |        []        |           []           |                ['type()']                |                                                                                            []                                                                                           |
|       supportsInterface(bytes4)       |  external  |              []              |        []        |           []           |                    []                    |                                                                                            []                                                                                           |
|        hasRole(bytes32,address)       |  external  |              []              |        []        |           []           |                    []                    |                                                                                            []                                                                                           |
|         getRoleAdmin(bytes32)         |  external  |              []              |        []        |           []           |                    []                    |                                                                                            []                                                                                           |
|       grantRole(bytes32,address)      |  external  |              []              |        []        |           []           |                    []                    |                                                                                            []                                                                                           |
|      revokeRole(bytes32,address)      |  external  |              []              |        []        |           []           |                    []                    |                                                                                            []                                                                                           |
|     renounceRole(bytes32,address)     |  external  |              []              |        []        |           []           |                    []                    |                                                                                            []                                                                                           |
|              _msgSender()             |  internal  |              []              |  ['msg.sender']  |           []           |                    []                    |                                                                                            []                                                                                           |
|               _msgData()              |  internal  |              []              |   ['msg.data']   |           []           |                    []                    |                                                                                            []                                                                                           |
|     getRoleMember(bytes32,uint256)    |  external  |              []              |        []        |           []           |                    []                    |                                                                                            []                                                                                           |
|      getRoleMemberCount(bytes32)      |  external  |              []              |        []        |           []           |                    []                    |                                                                                            []                                                                                           |
|       supportsInterface(bytes4)       |   public   |              []              |        []        |           []           |     ['supportsInterface', 'type()']      |                                                                                            []                                                                                           |
|     getRoleMember(bytes32,uint256)    |   public   |              []              | ['_roleMembers'] |           []           |                    []                    |                                                                             ['_roleMembers[role].at(index)']                                                                            |
|      getRoleMemberCount(bytes32)      |   public   |              []              | ['_roleMembers'] |           []           |                    []                    |                                                                             ['_roleMembers[role].length()']                                                                             |
|       grantRole(bytes32,address)      |   public   |              []              | ['_roleMembers'] |           []           |              ['grantRole']               |                                                                           ['_roleMembers[role].add(account)']                                                                           |
|      revokeRole(bytes32,address)      |   public   |              []              | ['_roleMembers'] |           []           |              ['revokeRole']              |                                                                          ['_roleMembers[role].remove(account)']                                                                         |
|     renounceRole(bytes32,address)     |   public   |              []              | ['_roleMembers'] |           []           |             ['renounceRole']             |                                                                          ['_roleMembers[role].remove(account)']                                                                         |
|      _setupRole(bytes32,address)      |  internal  |              []              | ['_roleMembers'] |           []           |              ['_setupRole']              |                                                                           ['_roleMembers[role].add(account)']                                                                           |
| slitherConstructorConstantVariables() |  internal  |              []              |        []        | ['DEFAULT_ADMIN_ROLE'] |                    []                    |                                                                                            []                                                                                           |
+---------------------------------------+------------+------------------------------+------------------+------------------------+------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

+-------------------+------------+------+-------+------------------------------+----------------+
|     Modifiers     | Visibility | Read | Write |        Internal Calls        | External Calls |
+-------------------+------------+------+-------+------------------------------+----------------+
| onlyRole(bytes32) |  internal  |  []  |   []  | ['_checkRole', '_msgSender'] |       []       |
+-------------------+------------+------+-------+------------------------------+----------------+

INFO:Printers:
Contract Address
Contract vars: []
Inheritance:: []
 
+-----------------------------------------------------+------------+-----------+----------+-------+-----------------------------------------------+-------------------------------------+
|                       Function                      | Visibility | Modifiers |   Read   | Write |                 Internal Calls                |            External Calls           |
+-----------------------------------------------------+------------+-----------+----------+-------+-----------------------------------------------+-------------------------------------+
|                 isContract(address)                 |  internal  |     []    |    []    |   []  |                       []                      |                  []                 |
|              sendValue(address,uint256)             |  internal  |     []    | ['this'] |   []  |            ['require(bool,string)']           | ['recipient.call{value: amount}()'] |
|             functionCall(address,bytes)             |  internal  |     []    |    []    |   []  |                ['functionCall']               |                  []                 |
|          functionCall(address,bytes,string)         |  internal  |     []    |    []    |   []  |           ['functionCallWithValue']           |                  []                 |
|     functionCallWithValue(address,bytes,uint256)    |  internal  |     []    |    []    |   []  |           ['functionCallWithValue']           |                  []                 |
| functionCallWithValue(address,bytes,uint256,string) |  internal  |     []    | ['this'] |   []  |      ['isContract', '_verifyCallResult']      | ['target.call{value: value}(data)'] |
|                                                     |            |           |          |       |            ['require(bool,string)']           |                                     |
|          functionStaticCall(address,bytes)          |  internal  |     []    |    []    |   []  |             ['functionStaticCall']            |                  []                 |
|       functionStaticCall(address,bytes,string)      |  internal  |     []    |    []    |   []  |      ['isContract', '_verifyCallResult']      |     ['target.staticcall(data)']     |
|                                                     |            |           |          |       |            ['require(bool,string)']           |                                     |
|         functionDelegateCall(address,bytes)         |  internal  |     []    |    []    |   []  |            ['functionDelegateCall']           |                  []                 |
|      functionDelegateCall(address,bytes,string)     |  internal  |     []    |    []    |   []  |      ['isContract', '_verifyCallResult']      |    ['target.delegatecall(data)']    |
|                                                     |            |           |          |       |            ['require(bool,string)']           |                                     |
|         _verifyCallResult(bool,bytes,string)        |  private   |     []    |    []    |   []  | ['mload(uint256)', 'revert(uint256,uint256)'] |                  []                 |
|                                                     |            |           |          |       |               ['revert(string)']              |                                     |
+-----------------------------------------------------+------------+-----------+----------+-------+-----------------------------------------------+-------------------------------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract Context
Contract vars: []
Inheritance:: []
 
+--------------+------------+-----------+----------------+-------+----------------+----------------+
|   Function   | Visibility | Modifiers |      Read      | Write | Internal Calls | External Calls |
+--------------+------------+-----------+----------------+-------+----------------+----------------+
| _msgSender() |  internal  |     []    | ['msg.sender'] |   []  |       []       |       []       |
|  _msgData()  |  internal  |     []    |  ['msg.data']  |   []  |       []       |       []       |
+--------------+------------+-----------+----------------+-------+----------------+----------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract ERC1155Holder
Contract vars: []
Inheritance:: ['ERC1155Receiver', 'IERC1155Receiver', 'ERC165', 'IERC165']
 
+-------------------------------------------------------------------+------------+-----------+----------+-------+---------------------------------+----------------+
|                              Function                             | Visibility | Modifiers |   Read   | Write |          Internal Calls         | External Calls |
+-------------------------------------------------------------------+------------+-----------+----------+-------+---------------------------------+----------------+
|                     supportsInterface(bytes4)                     |   public   |     []    |    []    |   []  | ['supportsInterface', 'type()'] |       []       |
|      onERC1155Received(address,address,uint256,uint256,bytes)     |  external  |     []    |    []    |   []  |                []               |       []       |
| onERC1155BatchReceived(address,address,uint256[],uint256[],bytes) |  external  |     []    |    []    |   []  |                []               |       []       |
|                     supportsInterface(bytes4)                     |  external  |     []    |    []    |   []  |                []               |       []       |
|                     supportsInterface(bytes4)                     |   public   |     []    |    []    |   []  |            ['type()']           |       []       |
|      onERC1155Received(address,address,uint256,uint256,bytes)     |   public   |     []    | ['this'] |   []  |                []               |       []       |
| onERC1155BatchReceived(address,address,uint256[],uint256[],bytes) |   public   |     []    | ['this'] |   []  |                []               |       []       |
+-------------------------------------------------------------------+------------+-----------+----------+-------+---------------------------------+----------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract ERC1155Receiver
Contract vars: []
Inheritance:: ['IERC1155Receiver', 'ERC165', 'IERC165']
 
+-------------------------------------------------------------------+------------+-----------+------+-------+---------------------------------+----------------+
|                              Function                             | Visibility | Modifiers | Read | Write |          Internal Calls         | External Calls |
+-------------------------------------------------------------------+------------+-----------+------+-------+---------------------------------+----------------+
|      onERC1155Received(address,address,uint256,uint256,bytes)     |  external  |     []    |  []  |   []  |                []               |       []       |
| onERC1155BatchReceived(address,address,uint256[],uint256[],bytes) |  external  |     []    |  []  |   []  |                []               |       []       |
|                     supportsInterface(bytes4)                     |  external  |     []    |  []  |   []  |                []               |       []       |
|                     supportsInterface(bytes4)                     |   public   |     []    |  []  |   []  |            ['type()']           |       []       |
|                     supportsInterface(bytes4)                     |   public   |     []    |  []  |   []  | ['supportsInterface', 'type()'] |       []       |
+-------------------------------------------------------------------+------------+-----------+------+-------+---------------------------------+----------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract ERC165
Contract vars: []
Inheritance:: ['IERC165']
 
+---------------------------+------------+-----------+------+-------+----------------+----------------+
|          Function         | Visibility | Modifiers | Read | Write | Internal Calls | External Calls |
+---------------------------+------------+-----------+------+-------+----------------+----------------+
| supportsInterface(bytes4) |  external  |     []    |  []  |   []  |       []       |       []       |
| supportsInterface(bytes4) |   public   |     []    |  []  |   []  |   ['type()']   |       []       |
+---------------------------+------------+-----------+------+-------+----------------+----------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract ERC165Checker
Contract vars: ['_INTERFACE_ID_INVALID']
Inheritance:: []
 
+------------------------------------------+------------+-----------+---------------------------+---------------------------+------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+
|                 Function                 | Visibility | Modifiers |            Read           |           Write           |                 Internal Calls                 |                                                            External Calls                                                            |
+------------------------------------------+------------+-----------+---------------------------+---------------------------+------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+
|         supportsERC165(address)          |  internal  |     []    | ['_INTERFACE_ID_INVALID'] |             []            |     ['_supportsERC165Interface', 'type()']     |                                                                  []                                                                  |
|    supportsInterface(address,bytes4)     |  internal  |     []    |             []            |             []            | ['_supportsERC165Interface', 'supportsERC165'] |                                                                  []                                                                  |
| getSupportedInterfaces(address,bytes4[]) |  internal  |     []    |             []            |             []            | ['_supportsERC165Interface', 'supportsERC165'] |                                                 ['new bool[](interfaceIds.length)']                                                  |
| supportsAllInterfaces(address,bytes4[])  |  internal  |     []    |             []            |             []            | ['_supportsERC165Interface', 'supportsERC165'] |                                                                  []                                                                  |
| _supportsERC165Interface(address,bytes4) |  private   |     []    |             []            |             []            |  ['abi.encodeWithSelector()', 'abi.decode()']  | ['abi.encodeWithSelector(IERC165(account).supportsInterface.selector,interfaceId)', 'account.staticcall{gas: 30000}(encodedParams)'] |
|                                          |            |           |                           |                           |                                                |                                                    ['abi.decode(result,(bool))']                                                     |
|  slitherConstructorConstantVariables()   |  internal  |     []    |             []            | ['_INTERFACE_ID_INVALID'] |                       []                       |                                                                  []                                                                  |
+------------------------------------------+------------+-----------+---------------------------+---------------------------+------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract ERC165Storage
Contract vars: ['_supportedInterfaces']
Inheritance:: ['ERC165', 'IERC165']
 
+----------------------------+------------+-----------+--------------------------+--------------------------+--------------------------+----------------+
|          Function          | Visibility | Modifiers |           Read           |          Write           |      Internal Calls      | External Calls |
+----------------------------+------------+-----------+--------------------------+--------------------------+--------------------------+----------------+
| supportsInterface(bytes4)  |   public   |     []    |            []            |            []            |        ['type()']        |       []       |
| supportsInterface(bytes4)  |  external  |     []    |            []            |            []            |            []            |       []       |
| supportsInterface(bytes4)  |   public   |     []    | ['_supportedInterfaces'] |            []            |  ['supportsInterface']   |       []       |
| _registerInterface(bytes4) |  internal  |     []    |            []            | ['_supportedInterfaces'] | ['require(bool,string)'] |       []       |
+----------------------------+------------+-----------+--------------------------+--------------------------+--------------------------+----------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract EnumerableSet
Contract vars: []
Inheritance:: []
 
+--------------------------------------------+------------+-----------+------+-------+----------------+-----------------------------+
|                  Function                  | Visibility | Modifiers | Read | Write | Internal Calls |        External Calls       |
+--------------------------------------------+------------+-----------+------+-------+----------------+-----------------------------+
|      _add(EnumerableSet.Set,bytes32)       |  private   |     []    |  []  |   []  | ['_contains']  | ['set._values.push(value)'] |
|     _remove(EnumerableSet.Set,bytes32)     |  private   |     []    |  []  |   []  |       []       |    ['set._values.pop()']    |
|    _contains(EnumerableSet.Set,bytes32)    |  private   |     []    |  []  |   []  |       []       |              []             |
|         _length(EnumerableSet.Set)         |  private   |     []    |  []  |   []  |       []       |              []             |
|       _at(EnumerableSet.Set,uint256)       |  private   |     []    |  []  |   []  |       []       |              []             |
|   add(EnumerableSet.Bytes32Set,bytes32)    |  internal  |     []    |  []  |   []  |    ['_add']    |              []             |
|  remove(EnumerableSet.Bytes32Set,bytes32)  |  internal  |     []    |  []  |   []  |  ['_remove']   |              []             |
| contains(EnumerableSet.Bytes32Set,bytes32) |  internal  |     []    |  []  |   []  | ['_contains']  |              []             |
|      length(EnumerableSet.Bytes32Set)      |  internal  |     []    |  []  |   []  |  ['_length']   |              []             |
|    at(EnumerableSet.Bytes32Set,uint256)    |  internal  |     []    |  []  |   []  |    ['_at']     |              []             |
|   add(EnumerableSet.AddressSet,address)    |  internal  |     []    |  []  |   []  |    ['_add']    |              []             |
|  remove(EnumerableSet.AddressSet,address)  |  internal  |     []    |  []  |   []  |  ['_remove']   |              []             |
| contains(EnumerableSet.AddressSet,address) |  internal  |     []    |  []  |   []  | ['_contains']  |              []             |
|      length(EnumerableSet.AddressSet)      |  internal  |     []    |  []  |   []  |  ['_length']   |              []             |
|    at(EnumerableSet.AddressSet,uint256)    |  internal  |     []    |  []  |   []  |    ['_at']     |              []             |
|     add(EnumerableSet.UintSet,uint256)     |  internal  |     []    |  []  |   []  |    ['_add']    |              []             |
|   remove(EnumerableSet.UintSet,uint256)    |  internal  |     []    |  []  |   []  |  ['_remove']   |              []             |
|  contains(EnumerableSet.UintSet,uint256)   |  internal  |     []    |  []  |   []  | ['_contains']  |              []             |
|       length(EnumerableSet.UintSet)        |  internal  |     []    |  []  |   []  |  ['_length']   |              []             |
|     at(EnumerableSet.UintSet,uint256)      |  internal  |     []    |  []  |   []  |    ['_at']     |              []             |
+--------------------------------------------+------------+-----------+------+-------+----------------+-----------------------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract IERC165
Contract vars: []
Inheritance:: []
 
+---------------------------+------------+-----------+------+-------+----------------+----------------+
|          Function         | Visibility | Modifiers | Read | Write | Internal Calls | External Calls |
+---------------------------+------------+-----------+------+-------+----------------+----------------+
| supportsInterface(bytes4) |  external  |     []    |  []  |   []  |       []       |       []       |
+---------------------------+------------+-----------+------+-------+----------------+----------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract Pausable
Contract vars: ['_paused']
Inheritance:: ['Context']
 
+---------------+------------+-------------------+----------------+-------------+---------------------------------+----------------+
|    Function   | Visibility |     Modifiers     |      Read      |    Write    |          Internal Calls         | External Calls |
+---------------+------------+-------------------+----------------+-------------+---------------------------------+----------------+
|  _msgSender() |  internal  |         []        | ['msg.sender'] |      []     |                []               |       []       |
|   _msgData()  |  internal  |         []        |  ['msg.data']  |      []     |                []               |       []       |
| constructor() |  internal  |         []        |       []       | ['_paused'] |                []               |       []       |
|    paused()   |   public   |         []        |  ['_paused']   |      []     |                []               |       []       |
|    _pause()   |  internal  | ['whenNotPaused'] |       []       | ['_paused'] | ['_msgSender', 'whenNotPaused'] |       []       |
|   _unpause()  |  internal  |   ['whenPaused']  |       []       | ['_paused'] |   ['_msgSender', 'whenPaused']  |       []       |
+---------------+------------+-------------------+----------------+-------------+---------------------------------+----------------+

+-----------------+------------+------+-------+------------------------------------+----------------+
|    Modifiers    | Visibility | Read | Write |           Internal Calls           | External Calls |
+-----------------+------------+------+-------+------------------------------------+----------------+
| whenNotPaused() |  internal  |  []  |   []  | ['paused', 'require(bool,string)'] |       []       |
|   whenPaused()  |  internal  |  []  |   []  | ['paused', 'require(bool,string)'] |       []       |
+-----------------+------------+------+-------+------------------------------------+----------------+

INFO:Printers:
Contract Strings
Contract vars: ['alphabet']
Inheritance:: []
 
+---------------------------------------+------------+-----------+--------------+--------------+--------------------------+-------------------------------+
|                Function               | Visibility | Modifiers |     Read     |    Write     |      Internal Calls      |         External Calls        |
+---------------------------------------+------------+-----------+--------------+--------------+--------------------------+-------------------------------+
|           toString(uint256)           |  internal  |     []    |      []      |      []      |            []            |     ['new bytes(digits)']     |
|          toHexString(uint256)         |  internal  |     []    |      []      |      []      |     ['toHexString']      |               []              |
|      toHexString(uint256,uint256)     |  internal  |     []    | ['alphabet'] |      []      | ['require(bool,string)'] | ['new bytes(2 * length + 2)'] |
| slitherConstructorConstantVariables() |  internal  |     []    |      []      | ['alphabet'] |            []            |               []              |
+---------------------------------------+------------+-----------+--------------+--------------+--------------------------+-------------------------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract IInit
Contract vars: []
Inheritance:: []
 
+------------------------------------------------------------------------------------+------------+-----------+------+-------+----------------+----------------+
|                                      Function                                      | Visibility | Modifiers | Read | Write | Internal Calls | External Calls |
+------------------------------------------------------------------------------------+------------+-----------+------+-------+----------------+----------------+
| init(uint128,bool,uint256,uint256,uint256[6],address,uint256,string,address,bytes) |  external  |     []    |  []  |   []  |       []       |       []       |
+------------------------------------------------------------------------------------+------------+-----------+------+-------+----------------+----------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract IMinter
Contract vars: []
Inheritance:: []
 
+-------------------------------------+------------+-----------+------+-------+----------------+----------------+
|               Function              | Visibility | Modifiers | Read | Write | Internal Calls | External Calls |
+-------------------------------------+------------+-----------+------+-------+----------------+----------------+
| mint(address,uint256,uint256,bytes) |  external  |     []    |  []  |   []  |       []       |       []       |
+-------------------------------------+------------+-----------+------+-------+----------------+----------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract IRegister
Contract vars: []
Inheritance:: []
 
+----------------------------------+------------+-----------+------+-------+----------------+----------------+
|             Function             | Visibility | Modifiers | Read | Write | Internal Calls | External Calls |
+----------------------------------+------------+-----------+------+-------+----------------+----------------+
| register(string,address,uint128) |  external  |     []    |  []  |   []  |       []       |       []       |
+----------------------------------+------------+-----------+------+-------+----------------+----------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract PRBMathCommon
Contract vars: ['SCALE', 'SCALE_LPOTD', 'SCALE_INVERSE']
Inheritance:: []
 
+---------------------------------------+------------+-----------+----------------------------+----------------------------+------------------------------------------------------+------------------------------------------------+
|                Function               | Visibility | Modifiers |            Read            |           Write            |                    Internal Calls                    |                 External Calls                 |
+---------------------------------------+------------+-----------+----------------------------+----------------------------+------------------------------------------------------+------------------------------------------------+
|             exp2(uint256)             |  internal  |     []    |             []             |             []             |                      ['mulDiv']                      | ['PRBMathCommon.mulDiv(result,1e18,2 ** 128)'] |
|      mostSignificantBit(uint256)      |  internal  |     []    |             []             |             []             |                          []                          |                       []                       |
|    mulDiv(uint256,uint256,uint256)    |  internal  |     []    |             []             |             []             | ['require(bool)', 'mulmod(uint256,uint256,uint256)'] |                       []                       |
|   mulDivFixedPoint(uint256,uint256)   |  internal  |     []    | ['SCALE', 'SCALE_INVERSE'] |             []             | ['require(bool)', 'mulmod(uint256,uint256,uint256)'] |                       []                       |
|                                       |            |           |      ['SCALE_LPOTD']       |                            |                                                      |                                                |
|             sqrt(uint256)             |  internal  |     []    |             []             |             []             |                          []                          |                       []                       |
| slitherConstructorConstantVariables() |  internal  |     []    |             []             | ['SCALE', 'SCALE_INVERSE'] |                          []                          |                       []                       |
|                                       |            |           |                            |      ['SCALE_LPOTD']       |                                                      |                                                |
+---------------------------------------+------------+-----------+----------------------------+----------------------------+------------------------------------------------------+------------------------------------------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Printers:
Contract PRBMathUD60x18
Contract vars: ['HALF_SCALE', 'LOG2_E', 'MAX_UD60x18', 'MAX_WHOLE_UD60x18', 'SCALE']
Inheritance:: []
 
+---------------------------------------+------------+-----------+--------------------------------+--------------------------------------+---------------------------+-------------------------------------------------+
|                Function               | Visibility | Modifiers |              Read              |                Write                 |       Internal Calls      |                  External Calls                 |
+---------------------------------------+------------+-----------+--------------------------------+--------------------------------------+---------------------------+-------------------------------------------------+
|          avg(uint256,uint256)         |  internal  |     []    |               []               |                  []                  |             []            |                        []                       |
|             ceil(uint256)             |  internal  |     []    | ['MAX_WHOLE_UD60x18', 'SCALE'] |                  []                  |     ['require(bool)']     |                        []                       |
|          div(uint256,uint256)         |  internal  |     []    |           ['SCALE']            |                  []                  |             []            |       ['PRBMathCommon.mulDiv(x,SCALE,y)']       |
|                  e()                  |  internal  |     []    |               []               |                  []                  |             []            |                        []                       |
|              exp(uint256)             |  internal  |     []    |    ['HALF_SCALE', 'LOG2_E']    |                  []                  | ['exp2', 'require(bool)'] |                        []                       |
|                                       |            |           |           ['SCALE']            |                                      |                           |                                                 |
|             exp2(uint256)             |  internal  |     []    |           ['SCALE']            |                  []                  |     ['require(bool)']     |         ['PRBMathCommon.exp2(x128x128)']        |
|             floor(uint256)            |  internal  |     []    |           ['SCALE']            |                  []                  |             []            |                        []                       |
|             frac(uint256)             |  internal  |     []    |           ['SCALE']            |                  []                  |             []            |                        []                       |
|          gm(uint256,uint256)          |  internal  |     []    |               []               |                  []                  |     ['require(bool)']     |            ['PRBMathCommon.sqrt(xy)']           |
|              inv(uint256)             |  internal  |     []    |               []               |                  []                  |             []            |                        []                       |
|              ln(uint256)              |  internal  |     []    |      ['LOG2_E', 'SCALE']       |                  []                  |          ['log2']         |                        []                       |
|             log10(uint256)            |  internal  |     []    |    ['MAX_UD60x18', 'SCALE']    |                  []                  | ['log2', 'require(bool)'] |                        []                       |
|             log2(uint256)             |  internal  |     []    |    ['HALF_SCALE', 'SCALE']     |                  []                  |     ['require(bool)']     | ['PRBMathCommon.mostSignificantBit(x / SCALE)'] |
|          mul(uint256,uint256)         |  internal  |     []    |               []               |                  []                  |             []            |     ['PRBMathCommon.mulDivFixedPoint(x,y)']     |
|                  pi()                 |  internal  |     []    |               []               |                  []                  |             []            |                        []                       |
|          pow(uint256,uint256)         |  internal  |     []    |           ['SCALE']            |                  []                  |          ['mul']          |                        []                       |
|                scale()                |  internal  |     []    |           ['SCALE']            |                  []                  |             []            |                        []                       |
|             sqrt(uint256)             |  internal  |     []    |           ['SCALE']            |                  []                  |     ['require(bool)']     |        ['PRBMathCommon.sqrt(x * SCALE)']        |
| slitherConstructorConstantVariables() |  internal  |     []    |               []               |       ['HALF_SCALE', 'LOG2_E']       |             []            |                        []                       |
|                                       |            |           |                                | ['MAX_UD60x18', 'MAX_WHOLE_UD60x18'] |                           |                                                 |
|                                       |            |           |                                |              ['SCALE']               |                           |                                                 |
+---------------------------------------+------------+-----------+--------------------------------+--------------------------------------+---------------------------+-------------------------------------------------+

+-----------+------------+------+-------+----------------+----------------+
| Modifiers | Visibility | Read | Write | Internal Calls | External Calls |
+-----------+------------+------+-------+----------------+----------------+
+-----------+------------+------+-------+----------------+----------------+

INFO:Slither:. analyzed (30 contracts)
INFO:Slither:Use https://crytic.io/ to get access to additional detectors and Github integration

```