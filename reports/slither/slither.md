```
'npx hardhat compile --force' running
Compiling 28 files with 0.8.4
Compilation finished successfully

Solidity 0.8.4 is not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.

Learn more at https://hardhat.org/reference/solidity-support"


INFO:Detectors:
Bondzier.buy() (contracts/Bondzier.sol#147-169) sends eth to arbitrary user
	Dangerous calls:
	- (t2) = OwnerAddress.call{value: price}() (contracts/Bondzier.sol#160)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#functions-that-send-ether-to-arbitrary-destinations
INFO:Detectors:
PRBMathCommon.mulDiv(uint256,uint256,uint256) (contracts/PRBMathCommon.sol#158-241) performs a multiplication on the result of a division:
	-denominator = denominator / lpotdod (contracts/PRBMathCommon.sol#208)
	-inverse = (3 * denominator) ^ 2 (contracts/PRBMathCommon.sol#223)
PRBMathCommon.mulDiv(uint256,uint256,uint256) (contracts/PRBMathCommon.sol#158-241) performs a multiplication on the result of a division:
	-denominator = denominator / lpotdod (contracts/PRBMathCommon.sol#208)
	-inverse *= 2 - denominator * inverse (contracts/PRBMathCommon.sol#227)
PRBMathCommon.mulDiv(uint256,uint256,uint256) (contracts/PRBMathCommon.sol#158-241) performs a multiplication on the result of a division:
	-denominator = denominator / lpotdod (contracts/PRBMathCommon.sol#208)
	-inverse *= 2 - denominator * inverse (contracts/PRBMathCommon.sol#228)
PRBMathCommon.mulDiv(uint256,uint256,uint256) (contracts/PRBMathCommon.sol#158-241) performs a multiplication on the result of a division:
	-denominator = denominator / lpotdod (contracts/PRBMathCommon.sol#208)
	-inverse *= 2 - denominator * inverse (contracts/PRBMathCommon.sol#229)
PRBMathCommon.mulDiv(uint256,uint256,uint256) (contracts/PRBMathCommon.sol#158-241) performs a multiplication on the result of a division:
	-denominator = denominator / lpotdod (contracts/PRBMathCommon.sol#208)
	-inverse *= 2 - denominator * inverse (contracts/PRBMathCommon.sol#230)
PRBMathCommon.mulDiv(uint256,uint256,uint256) (contracts/PRBMathCommon.sol#158-241) performs a multiplication on the result of a division:
	-denominator = denominator / lpotdod (contracts/PRBMathCommon.sol#208)
	-inverse *= 2 - denominator * inverse (contracts/PRBMathCommon.sol#231)
PRBMathCommon.mulDiv(uint256,uint256,uint256) (contracts/PRBMathCommon.sol#158-241) performs a multiplication on the result of a division:
	-denominator = denominator / lpotdod (contracts/PRBMathCommon.sol#208)
	-inverse *= 2 - denominator * inverse (contracts/PRBMathCommon.sol#232)
PRBMathCommon.mulDiv(uint256,uint256,uint256) (contracts/PRBMathCommon.sol#158-241) performs a multiplication on the result of a division:
	-prod0 = prod0 / lpotdod (contracts/PRBMathCommon.sol#211)
	-result = prod0 * inverse (contracts/PRBMathCommon.sol#238)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#divide-before-multiply
INFO:Detectors:
ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes).reason (contracts/ERC1155/ERC1155.sol#417) is a local variable never initialized
ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes).response (contracts/ERC1155/ERC1155.sol#413) is a local variable never initialized
ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes).reason (contracts/ERC1155/ERC1155.sol#440) is a local variable never initialized
ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes).response (contracts/ERC1155/ERC1155.sol#436) is a local variable never initialized
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#uninitialized-local-variables
INFO:Detectors:
ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes) (contracts/ERC1155/ERC1155.sol#402-423) ignores return value by IERC1155Receiver(to).onERC1155Received(operator,from,id,amount,data) (contracts/ERC1155/ERC1155.sol#413-421)
ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes) (contracts/ERC1155/ERC1155.sol#425-446) ignores return value by IERC1155Receiver(to).onERC1155BatchReceived(operator,from,ids,amounts,data) (contracts/ERC1155/ERC1155.sol#436-444)
AccessControlEnumerable.grantRole(bytes32,address) (contracts/ERC1155/utils/AccessControlEnumerable.sol#59-62) ignores return value by _roleMembers[role].add(account) (contracts/ERC1155/utils/AccessControlEnumerable.sol#61)
AccessControlEnumerable.revokeRole(bytes32,address) (contracts/ERC1155/utils/AccessControlEnumerable.sol#67-70) ignores return value by _roleMembers[role].remove(account) (contracts/ERC1155/utils/AccessControlEnumerable.sol#69)
AccessControlEnumerable.renounceRole(bytes32,address) (contracts/ERC1155/utils/AccessControlEnumerable.sol#75-78) ignores return value by _roleMembers[role].remove(account) (contracts/ERC1155/utils/AccessControlEnumerable.sol#77)
AccessControlEnumerable._setupRole(bytes32,address) (contracts/ERC1155/utils/AccessControlEnumerable.sol#83-86) ignores return value by _roleMembers[role].add(account) (contracts/ERC1155/utils/AccessControlEnumerable.sol#85)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#unused-return
INFO:Detectors:
Bondzier1155.constructor(string).uri (contracts/Bondzier1155.sol#32) shadows:
	- ERC1155.uri(uint256) (contracts/ERC1155/ERC1155.sol#57-59) (function)
	- IERC1155MetadataURI.uri(uint256) (contracts/ERC1155/extensions/IERC1155MetadataURI.sol#20) (function)
Bondzier1155.register(string,address,uint128).uri (contracts/Bondzier1155.sol#39) shadows:
	- ERC1155.uri(uint256) (contracts/ERC1155/ERC1155.sol#57-59) (function)
	- IERC1155MetadataURI.uri(uint256) (contracts/ERC1155/extensions/IERC1155MetadataURI.sol#20) (function)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#local-variable-shadowing
INFO:Detectors:
Variable 'ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes).response (contracts/ERC1155/ERC1155.sol#413)' in ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes) (contracts/ERC1155/ERC1155.sol#402-423) potentially used before declaration: response != IERC1155Receiver(to).onERC1155Received.selector (contracts/ERC1155/ERC1155.sol#414)
Variable 'ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes).reason (contracts/ERC1155/ERC1155.sol#417)' in ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes) (contracts/ERC1155/ERC1155.sol#402-423) potentially used before declaration: revert(string)(reason) (contracts/ERC1155/ERC1155.sol#418)
Variable 'ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes).response (contracts/ERC1155/ERC1155.sol#436)' in ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes) (contracts/ERC1155/ERC1155.sol#425-446) potentially used before declaration: response != IERC1155Receiver(to).onERC1155BatchReceived.selector (contracts/ERC1155/ERC1155.sol#437)
Variable 'ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes).reason (contracts/ERC1155/ERC1155.sol#440)' in ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes) (contracts/ERC1155/ERC1155.sol#425-446) potentially used before declaration: revert(string)(reason) (contracts/ERC1155/ERC1155.sol#441)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#pre-declaration-usage-of-local-variables
INFO:Detectors:
Bondzier.buy() (contracts/Bondzier.sol#147-169) uses timestamp for comparisons
	Dangerous comparisons:
	- require(bool,string)(block.timestamp < endTime,Market closed.) (contracts/Bondzier.sol#148)
Bondzier.init(uint128,bool,uint256,uint256,uint256[6],address,uint256,string,address,bytes) (contracts/Bondzier.sol#202-244) uses timestamp for comparisons
	Dangerous comparisons:
	- require(bool,string)(_endTime > block.timestamp,Endtime must be set into future.) (contracts/Bondzier.sol#222)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#block-timestamp
INFO:Detectors:
Clones.clone(address) (contracts/Clones.sol#24-34) uses assembly
	- INLINE ASM (contracts/Clones.sol#26-32)
Clones.cloneDeterministic(address,bytes32) (contracts/Clones.sol#43-53) uses assembly
	- INLINE ASM (contracts/Clones.sol#45-51)
Clones.predictDeterministicAddress(address,bytes32,address) (contracts/Clones.sol#58-70) uses assembly
	- INLINE ASM (contracts/Clones.sol#60-69)
Address.isContract(address) (contracts/ERC1155/utils/Address.sol#26-35) uses assembly
	- INLINE ASM (contracts/ERC1155/utils/Address.sol#33)
Address._verifyCallResult(bool,bytes,string) (contracts/ERC1155/utils/Address.sol#171-188) uses assembly
	- INLINE ASM (contracts/ERC1155/utils/Address.sol#180-183)
PRBMathCommon.mulDiv(uint256,uint256,uint256) (contracts/PRBMathCommon.sol#158-241) uses assembly
	- INLINE ASM (contracts/PRBMathCommon.sol#168-172)
	- INLINE ASM (contracts/PRBMathCommon.sol#177-179)
	- INLINE ASM (contracts/PRBMathCommon.sol#192-199)
	- INLINE ASM (contracts/PRBMathCommon.sol#206-215)
PRBMathCommon.mulDivFixedPoint(uint256,uint256) (contracts/PRBMathCommon.sol#261-298) uses assembly
	- INLINE ASM (contracts/PRBMathCommon.sol#264-268)
	- INLINE ASM (contracts/PRBMathCommon.sol#272-275)
	- INLINE ASM (contracts/PRBMathCommon.sol#286-297)
PRBMathUD60x18.ceil(uint256) (contracts/PRBMathUD60x18.sol#51-63) uses assembly
	- INLINE ASM (contracts/PRBMathUD60x18.sol#53-62)
PRBMathUD60x18.floor(uint256) (contracts/PRBMathUD60x18.sol#134-142) uses assembly
	- INLINE ASM (contracts/PRBMathUD60x18.sol#135-141)
PRBMathUD60x18.frac(uint256) (contracts/PRBMathUD60x18.sol#148-152) uses assembly
	- INLINE ASM (contracts/PRBMathUD60x18.sol#149-151)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses assembly
	- INLINE ASM (contracts/PRBMathUD60x18.sol#229-312)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#assembly-usage
INFO:Detectors:
AccessControl._setRoleAdmin(bytes32,bytes32) (contracts/ERC1155/utils/AccessControl.sol#225-228) is never used and should be removed
Address._verifyCallResult(bool,bytes,string) (contracts/ERC1155/utils/Address.sol#171-188) is never used and should be removed
Address.functionCall(address,bytes) (contracts/ERC1155/utils/Address.sol#79-81) is never used and should be removed
Address.functionCall(address,bytes,string) (contracts/ERC1155/utils/Address.sol#89-91) is never used and should be removed
Address.functionCallWithValue(address,bytes,uint256) (contracts/ERC1155/utils/Address.sol#104-106) is never used and should be removed
Address.functionCallWithValue(address,bytes,uint256,string) (contracts/ERC1155/utils/Address.sol#114-121) is never used and should be removed
Address.functionDelegateCall(address,bytes) (contracts/ERC1155/utils/Address.sol#153-155) is never used and should be removed
Address.functionDelegateCall(address,bytes,string) (contracts/ERC1155/utils/Address.sol#163-169) is never used and should be removed
Address.functionStaticCall(address,bytes) (contracts/ERC1155/utils/Address.sol#129-131) is never used and should be removed
Address.functionStaticCall(address,bytes,string) (contracts/ERC1155/utils/Address.sol#139-145) is never used and should be removed
Address.sendValue(address,uint256) (contracts/ERC1155/utils/Address.sol#53-59) is never used and should be removed
Bezier.bezier(uint256[2],uint256[2],uint256[2],uint256[2],uint256) (contracts/Bezier.sol#79-84) is never used and should be removed
Bezier.bezierX(uint256,uint256,uint256,uint256,uint256) (contracts/Bezier.sol#97-101) is never used and should be removed
Bondzier1155._beforeTokenTransfer(address,address,address,uint256[],uint256[],bytes) (contracts/Bondzier1155.sol#80-91) is never used and should be removed
Clones.clone(address) (contracts/Clones.sol#24-34) is never used and should be removed
Context._msgData() (contracts/ERC1155/utils/Context.sol#20-23) is never used and should be removed
ERC165Checker._supportsERC165Interface(address,bytes4) (contracts/ERC1155/utils/ERC165Checker.sol#102-107) is never used and should be removed
ERC165Checker.getSupportedInterfaces(address,bytes4[]) (contracts/ERC1155/utils/ERC165Checker.sol#50-63) is never used and should be removed
ERC165Checker.supportsAllInterfaces(address,bytes4[]) (contracts/ERC1155/utils/ERC165Checker.sol#74-89) is never used and should be removed
ERC165Checker.supportsERC165(address) (contracts/ERC1155/utils/ERC165Checker.sol#21-26) is never used and should be removed
ERC165Checker.supportsInterface(address,bytes4) (contracts/ERC1155/utils/ERC165Checker.sol#34-38) is never used and should be removed
ERC165Storage._registerInterface(bytes4) (contracts/ERC1155/utils/ERC165Storage.sol#37-40) is never used and should be removed
EnumerableSet.add(EnumerableSet.Bytes32Set,bytes32) (contracts/ERC1155/utils/EnumerableSet.sol#145-147) is never used and should be removed
EnumerableSet.add(EnumerableSet.UintSet,uint256) (contracts/ERC1155/utils/EnumerableSet.sol#254-256) is never used and should be removed
EnumerableSet.at(EnumerableSet.Bytes32Set,uint256) (contracts/ERC1155/utils/EnumerableSet.sol#183-185) is never used and should be removed
EnumerableSet.at(EnumerableSet.UintSet,uint256) (contracts/ERC1155/utils/EnumerableSet.sol#292-294) is never used and should be removed
EnumerableSet.contains(EnumerableSet.AddressSet,address) (contracts/ERC1155/utils/EnumerableSet.sol#216-218) is never used and should be removed
EnumerableSet.contains(EnumerableSet.Bytes32Set,bytes32) (contracts/ERC1155/utils/EnumerableSet.sol#162-164) is never used and should be removed
EnumerableSet.contains(EnumerableSet.UintSet,uint256) (contracts/ERC1155/utils/EnumerableSet.sol#271-273) is never used and should be removed
EnumerableSet.length(EnumerableSet.Bytes32Set) (contracts/ERC1155/utils/EnumerableSet.sol#169-171) is never used and should be removed
EnumerableSet.length(EnumerableSet.UintSet) (contracts/ERC1155/utils/EnumerableSet.sol#278-280) is never used and should be removed
EnumerableSet.remove(EnumerableSet.Bytes32Set,bytes32) (contracts/ERC1155/utils/EnumerableSet.sol#155-157) is never used and should be removed
EnumerableSet.remove(EnumerableSet.UintSet,uint256) (contracts/ERC1155/utils/EnumerableSet.sol#264-266) is never used and should be removed
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) is never used and should be removed
PRBMathCommon.mostSignificantBit(uint256) (contracts/PRBMathCommon.sol#108-141) is never used and should be removed
PRBMathCommon.mulDiv(uint256,uint256,uint256) (contracts/PRBMathCommon.sol#158-241) is never used and should be removed
PRBMathCommon.sqrt(uint256) (contracts/PRBMathCommon.sol#308-356) is never used and should be removed
PRBMathUD60x18.avg(uint256,uint256) (contracts/PRBMathUD60x18.sol#32-39) is never used and should be removed
PRBMathUD60x18.ceil(uint256) (contracts/PRBMathUD60x18.sol#51-63) is never used and should be removed
PRBMathUD60x18.div(uint256,uint256) (contracts/PRBMathUD60x18.sol#75-77) is never used and should be removed
PRBMathUD60x18.e() (contracts/PRBMathUD60x18.sol#81-83) is never used and should be removed
PRBMathUD60x18.exp(uint256) (contracts/PRBMathUD60x18.sol#95-104) is never used and should be removed
PRBMathUD60x18.exp2(uint256) (contracts/PRBMathUD60x18.sol#116-127) is never used and should be removed
PRBMathUD60x18.floor(uint256) (contracts/PRBMathUD60x18.sol#134-142) is never used and should be removed
PRBMathUD60x18.gm(uint256,uint256) (contracts/PRBMathUD60x18.sol#162-176) is never used and should be removed
PRBMathUD60x18.ln(uint256) (contracts/PRBMathUD60x18.sol#205-209) is never used and should be removed
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) is never used and should be removed
PRBMathUD60x18.log2(uint256) (contracts/PRBMathUD60x18.sol#333-366) is never used and should be removed
PRBMathUD60x18.pi() (contracts/PRBMathUD60x18.sol#379-381) is never used and should be removed
PRBMathUD60x18.scale() (contracts/PRBMathUD60x18.sol#414-416) is never used and should be removed
PRBMathUD60x18.sqrt(uint256) (contracts/PRBMathUD60x18.sol#429-436) is never used and should be removed
Pausable._pause() (contracts/ERC1155/utils/Pausable.sol#74-77) is never used and should be removed
Pausable._unpause() (contracts/ERC1155/utils/Pausable.sol#86-89) is never used and should be removed
Strings.toHexString(uint256) (contracts/ERC1155/utils/Strings.sol#39-50) is never used and should be removed
Strings.toString(uint256) (contracts/ERC1155/utils/Strings.sol#14-34) is never used and should be removed
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#dead-code
INFO:Detectors:
Pragma version0.8.4 (contracts/Bezier.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/Bondzier.sol#2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/Bondzier1155.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/BondzierFactory.sol#2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/Clones.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/ERC1155/ERC1155.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/ERC1155/IERC1155.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/ERC1155/IERC1155Receiver.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/ERC1155/extensions/ERC1155Burnable.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/ERC1155/extensions/IERC1155MetadataURI.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/ERC1155/utils/AccessControl.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/ERC1155/utils/AccessControlEnumerable.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/ERC1155/utils/Address.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/ERC1155/utils/Context.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/ERC1155/utils/ERC1155Holder.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/ERC1155/utils/ERC1155Receiver.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/ERC1155/utils/ERC165.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/ERC1155/utils/ERC165Checker.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/ERC1155/utils/ERC165Storage.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/ERC1155/utils/EnumerableSet.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/ERC1155/utils/IERC165.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/ERC1155/utils/Pausable.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/ERC1155/utils/Strings.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/IInit.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/IMinter.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/IRegister.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/PRBMathCommon.sol#3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
Pragma version0.8.4 (contracts/PRBMathUD60x18.sol#2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6
solc-0.8.4 is not recommended for deployment
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#incorrect-versions-of-solidity
INFO:Detectors:
Low level call in Bondzier.buy() (contracts/Bondzier.sol#147-169):
	- (t2) = OwnerAddress.call{value: price}() (contracts/Bondzier.sol#160)
	- (t1) = msg.sender.call{value: change}() (contracts/Bondzier.sol#165)
Low level call in Address.sendValue(address,uint256) (contracts/ERC1155/utils/Address.sol#53-59):
	- (success) = recipient.call{value: amount}() (contracts/ERC1155/utils/Address.sol#57)
Low level call in Address.functionCallWithValue(address,bytes,uint256,string) (contracts/ERC1155/utils/Address.sol#114-121):
	- (success,returndata) = target.call{value: value}(data) (contracts/ERC1155/utils/Address.sol#119)
Low level call in Address.functionStaticCall(address,bytes,string) (contracts/ERC1155/utils/Address.sol#139-145):
	- (success,returndata) = target.staticcall(data) (contracts/ERC1155/utils/Address.sol#143)
Low level call in Address.functionDelegateCall(address,bytes,string) (contracts/ERC1155/utils/Address.sol#163-169):
	- (success,returndata) = target.delegatecall(data) (contracts/ERC1155/utils/Address.sol#167)
Low level call in ERC165Checker._supportsERC165Interface(address,bytes4) (contracts/ERC1155/utils/ERC165Checker.sol#102-107):
	- (success,result) = account.staticcall{gas: 30000}(encodedParams) (contracts/ERC1155/utils/ERC165Checker.sol#104)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#low-level-calls
INFO:Detectors:
Parameter Bondzier.priceN(uint256)._n (contracts/Bondzier.sol#119) is not in mixedCase
Parameter Bondzier.init(uint128,bool,uint256,uint256,uint256[6],address,uint256,string,address,bytes)._nonce (contracts/Bondzier.sol#202) is not in mixedCase
Parameter Bondzier.init(uint128,bool,uint256,uint256,uint256[6],address,uint256,string,address,bytes)._isNonFungible (contracts/Bondzier.sol#203) is not in mixedCase
Parameter Bondzier.init(uint128,bool,uint256,uint256,uint256[6],address,uint256,string,address,bytes)._amnt (contracts/Bondzier.sol#204) is not in mixedCase
Parameter Bondzier.init(uint128,bool,uint256,uint256,uint256[6],address,uint256,string,address,bytes)._total (contracts/Bondzier.sol#205) is not in mixedCase
Parameter Bondzier.init(uint128,bool,uint256,uint256,uint256[6],address,uint256,string,address,bytes)._points (contracts/Bondzier.sol#206) is not in mixedCase
Parameter Bondzier.init(uint128,bool,uint256,uint256,uint256[6],address,uint256,string,address,bytes)._owneraddress (contracts/Bondzier.sol#207) is not in mixedCase
Parameter Bondzier.init(uint128,bool,uint256,uint256,uint256[6],address,uint256,string,address,bytes)._endTime (contracts/Bondzier.sol#208) is not in mixedCase
Parameter Bondzier.init(uint128,bool,uint256,uint256,uint256[6],address,uint256,string,address,bytes)._uri (contracts/Bondzier.sol#209) is not in mixedCase
Parameter Bondzier.init(uint128,bool,uint256,uint256,uint256[6],address,uint256,string,address,bytes)._tokenContractAddress (contracts/Bondzier.sol#210) is not in mixedCase
Parameter Bondzier.init(uint128,bool,uint256,uint256,uint256[6],address,uint256,string,address,bytes)._data (contracts/Bondzier.sol#211) is not in mixedCase
Variable Bondzier.OwnerAddress (contracts/Bondzier.sol#75) is not in mixedCase
Parameter BondzierFactory.predictAddress(bytes32)._salt (contracts/BondzierFactory.sol#53) is not in mixedCase
Parameter BondzierFactory.createBondzier(bool,uint256,uint256,uint256[6],address,uint256,string,bytes32,bytes)._isNonFungible (contracts/BondzierFactory.sol#60) is not in mixedCase
Parameter BondzierFactory.createBondzier(bool,uint256,uint256,uint256[6],address,uint256,string,bytes32,bytes)._amnt (contracts/BondzierFactory.sol#61) is not in mixedCase
Parameter BondzierFactory.createBondzier(bool,uint256,uint256,uint256[6],address,uint256,string,bytes32,bytes)._total (contracts/BondzierFactory.sol#62) is not in mixedCase
Parameter BondzierFactory.createBondzier(bool,uint256,uint256,uint256[6],address,uint256,string,bytes32,bytes)._points (contracts/BondzierFactory.sol#63) is not in mixedCase
Parameter BondzierFactory.createBondzier(bool,uint256,uint256,uint256[6],address,uint256,string,bytes32,bytes)._owneraddress (contracts/BondzierFactory.sol#64) is not in mixedCase
Parameter BondzierFactory.createBondzier(bool,uint256,uint256,uint256[6],address,uint256,string,bytes32,bytes)._endTime (contracts/BondzierFactory.sol#65) is not in mixedCase
Parameter BondzierFactory.createBondzier(bool,uint256,uint256,uint256[6],address,uint256,string,bytes32,bytes)._uri (contracts/BondzierFactory.sol#66) is not in mixedCase
Parameter BondzierFactory.createBondzier(bool,uint256,uint256,uint256[6],address,uint256,string,bytes32,bytes)._salt (contracts/BondzierFactory.sol#67) is not in mixedCase
Constant Strings.alphabet (contracts/ERC1155/utils/Strings.sol#9) is not in UPPER_CASE_WITH_UNDERSCORES
Constant PRBMathUD60x18.MAX_UD60x18 (contracts/PRBMathUD60x18.sol#20) is not in UPPER_CASE_WITH_UNDERSCORES
Constant PRBMathUD60x18.MAX_WHOLE_UD60x18 (contracts/PRBMathUD60x18.sol#23) is not in UPPER_CASE_WITH_UNDERSCORES
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#conformance-to-solidity-naming-conventions
INFO:Detectors:
Redundant expression "this (contracts/ERC1155/utils/Context.sol#21)" inContext (contracts/ERC1155/utils/Context.sol#15-24)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#redundant-statements
INFO:Detectors:
Clones.clone(address) (contracts/Clones.sol#24-34) uses literals with too many digits:
	- mstore(uint256,uint256)(ptr_clone_asm_0,0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000) (contracts/Clones.sol#28)
Clones.clone(address) (contracts/Clones.sol#24-34) uses literals with too many digits:
	- mstore(uint256,uint256)(ptr_clone_asm_0 + 0x28,0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000) (contracts/Clones.sol#30)
Clones.cloneDeterministic(address,bytes32) (contracts/Clones.sol#43-53) uses literals with too many digits:
	- mstore(uint256,uint256)(ptr_cloneDeterministic_asm_0,0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000) (contracts/Clones.sol#47)
Clones.cloneDeterministic(address,bytes32) (contracts/Clones.sol#43-53) uses literals with too many digits:
	- mstore(uint256,uint256)(ptr_cloneDeterministic_asm_0 + 0x28,0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000) (contracts/Clones.sol#49)
Clones.predictDeterministicAddress(address,bytes32,address) (contracts/Clones.sol#58-70) uses literals with too many digits:
	- mstore(uint256,uint256)(ptr_predictDeterministicAddress_asm_0,0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000) (contracts/Clones.sol#62)
Clones.predictDeterministicAddress(address,bytes32,address) (contracts/Clones.sol#58-70) uses literals with too many digits:
	- mstore(uint256,uint256)(ptr_predictDeterministicAddress_asm_0 + 0x28,0x5af43d82803e903d91602b57fd5bf3ff00000000000000000000000000000000) (contracts/Clones.sol#64)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = 0x80000000000000000000000000000000 (contracts/PRBMathCommon.sol#26)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x80000000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#30)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x40000000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#31)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x20000000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#32)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x10000000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#33)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x8000000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#34)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x4000000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#35)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x2000000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#36)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x1000000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#37)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x800000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#38)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x400000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#39)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x200000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#40)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x100000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#41)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x80000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#42)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x40000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#43)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x20000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#44)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x10000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#45)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x8000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#46)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x4000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#47)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x2000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#48)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x1000000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#49)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x100000B1721BCFC99D9F890EA06911763) >> 128 (contracts/PRBMathCommon.sol#49)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x800000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#50)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x10000058B90CF1E6D97F9CA14DBCC1629) >> 128 (contracts/PRBMathCommon.sol#50)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x400000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#51)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x1000002C5C863B73F016468F6BAC5CA2C) >> 128 (contracts/PRBMathCommon.sol#51)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x200000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#52)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x100000162E430E5A18F6119E3C02282A6) >> 128 (contracts/PRBMathCommon.sol#52)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x100000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#53)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x1000000B1721835514B86E6D96EFD1BFF) >> 128 (contracts/PRBMathCommon.sol#53)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x80000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#54)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x100000058B90C0B48C6BE5DF846C5B2F0) >> 128 (contracts/PRBMathCommon.sol#54)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x40000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#55)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x10000002C5C8601CC6B9E94213C72737B) >> 128 (contracts/PRBMathCommon.sol#55)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x20000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#56)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x1000000162E42FFF037DF38AA2B219F07) >> 128 (contracts/PRBMathCommon.sol#56)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x10000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#57)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x10000000B17217FBA9C739AA5819F44FA) >> 128 (contracts/PRBMathCommon.sol#57)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x8000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#58)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x1000000058B90BFCDEE5ACD3C1CEDC824) >> 128 (contracts/PRBMathCommon.sol#58)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x4000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#59)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x100000002C5C85FE31F35A6A30DA1BE51) >> 128 (contracts/PRBMathCommon.sol#59)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x2000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#60)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x10000000162E42FF0999CE3541B9FFFD0) >> 128 (contracts/PRBMathCommon.sol#60)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x1000000000000000000000000 > 0 (contracts/PRBMathCommon.sol#61)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x100000000B17217F80F4EF5AADDA45554) >> 128 (contracts/PRBMathCommon.sol#61)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x800000000000000000000000 > 0 (contracts/PRBMathCommon.sol#62)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x10000000058B90BFBF8479BD5A81B51AE) >> 128 (contracts/PRBMathCommon.sol#62)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x400000000000000000000000 > 0 (contracts/PRBMathCommon.sol#63)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x1000000002C5C85FDF84BD62AE30A74CD) >> 128 (contracts/PRBMathCommon.sol#63)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x200000000000000000000000 > 0 (contracts/PRBMathCommon.sol#64)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x100000000162E42FEFB2FED257559BDAA) >> 128 (contracts/PRBMathCommon.sol#64)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x100000000000000000000000 > 0 (contracts/PRBMathCommon.sol#65)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x1000000000B17217F7D5A7716BBA4A9AF) >> 128 (contracts/PRBMathCommon.sol#65)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x80000000000000000000000 > 0 (contracts/PRBMathCommon.sol#66)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x100000000058B90BFBE9DDBAC5E109CCF) >> 128 (contracts/PRBMathCommon.sol#66)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x40000000000000000000000 > 0 (contracts/PRBMathCommon.sol#67)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x10000000002C5C85FDF4B15DE6F17EB0E) >> 128 (contracts/PRBMathCommon.sol#67)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x20000000000000000000000 > 0 (contracts/PRBMathCommon.sol#68)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x1000000000162E42FEFA494F1478FDE05) >> 128 (contracts/PRBMathCommon.sol#68)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x10000000000000000000000 > 0 (contracts/PRBMathCommon.sol#69)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x10000000000B17217F7D20CF927C8E94D) >> 128 (contracts/PRBMathCommon.sol#69)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x8000000000000000000000 > 0 (contracts/PRBMathCommon.sol#70)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x1000000000058B90BFBE8F71CB4E4B33E) >> 128 (contracts/PRBMathCommon.sol#70)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x4000000000000000000000 > 0 (contracts/PRBMathCommon.sol#71)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x100000000002C5C85FDF477B662B26946) >> 128 (contracts/PRBMathCommon.sol#71)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x2000000000000000000000 > 0 (contracts/PRBMathCommon.sol#72)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x10000000000162E42FEFA3AE53369388D) >> 128 (contracts/PRBMathCommon.sol#72)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x1000000000000000000000 > 0 (contracts/PRBMathCommon.sol#73)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x100000000000B17217F7D1D351A389D41) >> 128 (contracts/PRBMathCommon.sol#73)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x800000000000000000000 > 0 (contracts/PRBMathCommon.sol#74)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x10000000000058B90BFBE8E8B2D3D4EDF) >> 128 (contracts/PRBMathCommon.sol#74)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x400000000000000000000 > 0 (contracts/PRBMathCommon.sol#75)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x1000000000002C5C85FDF4741BEA6E77F) >> 128 (contracts/PRBMathCommon.sol#75)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x200000000000000000000 > 0 (contracts/PRBMathCommon.sol#76)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x100000000000162E42FEFA39FE95583C3) >> 128 (contracts/PRBMathCommon.sol#76)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x100000000000000000000 > 0 (contracts/PRBMathCommon.sol#77)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x1000000000000B17217F7D1CFB72B45E3) >> 128 (contracts/PRBMathCommon.sol#77)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x80000000000000000000 > 0 (contracts/PRBMathCommon.sol#78)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x100000000000058B90BFBE8E7CC35C3F2) >> 128 (contracts/PRBMathCommon.sol#78)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x40000000000000000000 > 0 (contracts/PRBMathCommon.sol#79)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x10000000000002C5C85FDF473E242EA39) >> 128 (contracts/PRBMathCommon.sol#79)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x20000000000000000000 > 0 (contracts/PRBMathCommon.sol#80)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x1000000000000162E42FEFA39F02B772C) >> 128 (contracts/PRBMathCommon.sol#80)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x10000000000000000000 > 0 (contracts/PRBMathCommon.sol#81)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x10000000000000B17217F7D1CF7D83C1A) >> 128 (contracts/PRBMathCommon.sol#81)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x8000000000000000000 > 0 (contracts/PRBMathCommon.sol#82)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x1000000000000058B90BFBE8E7BDCBE2E) >> 128 (contracts/PRBMathCommon.sol#82)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x4000000000000000000 > 0 (contracts/PRBMathCommon.sol#83)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x100000000000002C5C85FDF473DEA871F) >> 128 (contracts/PRBMathCommon.sol#83)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x2000000000000000000 > 0 (contracts/PRBMathCommon.sol#84)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x10000000000000162E42FEFA39EF44D92) >> 128 (contracts/PRBMathCommon.sol#84)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x1000000000000000000 > 0 (contracts/PRBMathCommon.sol#85)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x100000000000000B17217F7D1CF79E949) >> 128 (contracts/PRBMathCommon.sol#85)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x800000000000000000 > 0 (contracts/PRBMathCommon.sol#86)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x10000000000000058B90BFBE8E7BCE545) >> 128 (contracts/PRBMathCommon.sol#86)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x400000000000000000 > 0 (contracts/PRBMathCommon.sol#87)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x1000000000000002C5C85FDF473DE6ECA) >> 128 (contracts/PRBMathCommon.sol#87)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x200000000000000000 > 0 (contracts/PRBMathCommon.sol#88)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x100000000000000162E42FEFA39EF366F) >> 128 (contracts/PRBMathCommon.sol#88)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x100000000000000000 > 0 (contracts/PRBMathCommon.sol#89)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x1000000000000000B17217F7D1CF79AFA) >> 128 (contracts/PRBMathCommon.sol#89)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x80000000000000000 > 0 (contracts/PRBMathCommon.sol#90)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x100000000000000058B90BFBE8E7BCD6E) >> 128 (contracts/PRBMathCommon.sol#90)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x40000000000000000 > 0 (contracts/PRBMathCommon.sol#91)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x10000000000000002C5C85FDF473DE6B3) >> 128 (contracts/PRBMathCommon.sol#91)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x20000000000000000 > 0 (contracts/PRBMathCommon.sol#92)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x1000000000000000162E42FEFA39EF359) >> 128 (contracts/PRBMathCommon.sol#92)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- x & 0x10000000000000000 > 0 (contracts/PRBMathCommon.sol#93)
PRBMathCommon.exp2(uint256) (contracts/PRBMathCommon.sol#22-102) uses literals with too many digits:
	- result = (result * 0x10000000000000000B17217F7D1CF79AC) >> 128 (contracts/PRBMathCommon.sol#93)
PRBMathCommon.sqrt(uint256) (contracts/PRBMathCommon.sol#308-356) uses literals with too many digits:
	- xAux >= 0x100000000000000000000000000000000 (contracts/PRBMathCommon.sol#316)
PRBMathCommon.sqrt(uint256) (contracts/PRBMathCommon.sol#308-356) uses literals with too many digits:
	- xAux >= 0x10000000000000000 (contracts/PRBMathCommon.sol#320)
PRBMathCommon.sqrt(uint256) (contracts/PRBMathCommon.sol#308-356) uses literals with too many digits:
	- xAux >= 0x100000000 (contracts/PRBMathCommon.sol#324)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000 (contracts/PRBMathUD60x18.sol#236)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000 (contracts/PRBMathUD60x18.sol#237)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000 (contracts/PRBMathUD60x18.sol#238)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000 (contracts/PRBMathUD60x18.sol#239)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000 (contracts/PRBMathUD60x18.sol#240)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000 (contracts/PRBMathUD60x18.sol#241)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000 (contracts/PRBMathUD60x18.sol#242)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000 (contracts/PRBMathUD60x18.sol#243)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000 (contracts/PRBMathUD60x18.sol#244)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000 (contracts/PRBMathUD60x18.sol#245)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000 (contracts/PRBMathUD60x18.sol#246)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000 (contracts/PRBMathUD60x18.sol#247)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000 (contracts/PRBMathUD60x18.sol#248)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000 (contracts/PRBMathUD60x18.sol#249)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000 (contracts/PRBMathUD60x18.sol#250)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000 (contracts/PRBMathUD60x18.sol#251)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000 (contracts/PRBMathUD60x18.sol#252)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000 (contracts/PRBMathUD60x18.sol#253)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000 (contracts/PRBMathUD60x18.sol#254)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000000 (contracts/PRBMathUD60x18.sol#255)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000000 (contracts/PRBMathUD60x18.sol#256)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000000 (contracts/PRBMathUD60x18.sol#257)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000000000 (contracts/PRBMathUD60x18.sol#258)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000000000 (contracts/PRBMathUD60x18.sol#259)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000000000 (contracts/PRBMathUD60x18.sol#260)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#261)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#262)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#263)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#264)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#265)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#266)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#267)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#268)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#269)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#270)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#271)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#272)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#273)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#274)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#275)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#276)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#277)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#278)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#279)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#280)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#281)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#282)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#283)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#284)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#285)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#286)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#287)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#288)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#289)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#290)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#291)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#292)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#293)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#294)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#295)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#296)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#297)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#298)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#299)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#300)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#301)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#302)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#303)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#304)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#305)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 1000000000000000000000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#306)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 10000000000000000000000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#307)
PRBMathUD60x18.log10(uint256) (contracts/PRBMathUD60x18.sol#224-318) uses literals with too many digits:
	- switch_expr_10495_6951_27_log10_asm_0 == 100000000000000000000000000000000000000000000000000000000000000000000000000000 (contracts/PRBMathUD60x18.sol#308)
PRBMathUD60x18.slitherConstructorConstantVariables() (contracts/PRBMathUD60x18.sol#12-438) uses literals with too many digits:
	- MAX_WHOLE_UD60x18 = 115792089237316195423570985008687907853269984665640564039457000000000000000000 (contracts/PRBMathUD60x18.sol#23)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#too-many-digits
INFO:Detectors:
uri(uint256) should be declared external:
	- ERC1155.uri(uint256) (contracts/ERC1155/ERC1155.sol#57-59)
balanceOfBatch(address[],uint256[]) should be declared external:
	- ERC1155.balanceOfBatch(address[],uint256[]) (contracts/ERC1155/ERC1155.sol#80-99)
setApprovalForAll(address,bool) should be declared external:
	- ERC1155.setApprovalForAll(address,bool) (contracts/ERC1155/ERC1155.sol#104-109)
safeTransferFrom(address,address,uint256,uint256,bytes) should be declared external:
	- ERC1155.safeTransferFrom(address,address,uint256,uint256,bytes) (contracts/ERC1155/ERC1155.sol#121-137)
safeBatchTransferFrom(address,address,uint256[],uint256[],bytes) should be declared external:
	- ERC1155.safeBatchTransferFrom(address,address,uint256[],uint256[],bytes) (contracts/ERC1155/ERC1155.sol#142-158)
burn(address,uint256,uint256) should be declared external:
	- ERC1155Burnable.burn(address,uint256,uint256) (contracts/ERC1155/extensions/ERC1155Burnable.sol#14-21)
burnBatch(address,uint256[],uint256[]) should be declared external:
	- ERC1155Burnable.burnBatch(address,uint256[],uint256[]) (contracts/ERC1155/extensions/ERC1155Burnable.sol#23-30)
getRoleMember(bytes32,uint256) should be declared external:
	- AccessControlEnumerable.getRoleMember(bytes32,uint256) (contracts/ERC1155/utils/AccessControlEnumerable.sol#44-46)
getRoleMemberCount(bytes32) should be declared external:
	- AccessControlEnumerable.getRoleMemberCount(bytes32) (contracts/ERC1155/utils/AccessControlEnumerable.sol#52-54)
onERC1155Received(address,address,uint256,uint256,bytes) should be declared external:
	- ERC1155Holder.onERC1155Received(address,address,uint256,uint256,bytes) (contracts/ERC1155/utils/ERC1155Holder.sol#11-13)
onERC1155BatchReceived(address,address,uint256[],uint256[],bytes) should be declared external:
	- ERC1155Holder.onERC1155BatchReceived(address,address,uint256[],uint256[],bytes) (contracts/ERC1155/utils/ERC1155Holder.sol#15-17)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#public-function-that-could-be-declared-external
INFO:Slither:. analyzed (30 contracts with 75 detectors), 357 result(s) found
INFO:Slither:Use https://crytic.io/ to get access to additional detectors and Github integration

```