# MythX Report for 60d4d3093a286200190f0159
##  Report for ERC1155.sol

- **UUID:** [b22cc0e0-8ff8-4fe8-87ca-ab8312ed2708](https://dashboard.mythx.io/#/console/analyses/b22cc0e0-8ff8-4fe8-87ca-ab8312ed2708)
- **Issue:** SWC-123 - Requirement Violation
- **Severity:** Low
- **Description:** A requirement was violated in a nested call and the call was reverted as a result. Make sure valid inputs are provided to the nested call (for instance, via passed arguments).
- **Line:** 19
```
contract ERC1155 is Context, ERC165, IERC1155, IERC1155MetadataURI {
```


- **UUID:** [948a70a6-a39e-4cd9-80f7-880ebcfb7966](https://dashboard.mythx.io/#/console/analyses/948a70a6-a39e-4cd9-80f7-880ebcfb7966)
- **Issue:** SWC-123 - Requirement Violation
- **Severity:** Low
- **Description:** A requirement was violated in a nested call and the call was reverted as a result. Make sure valid inputs are provided to the nested call (for instance, via passed arguments).
- **Line:** 19
```
contract ERC1155 is Context, ERC165, IERC1155, IERC1155MetadataURI {
```


- **UUID:** [b22cc0e0-8ff8-4fe8-87ca-ab8312ed2708](https://dashboard.mythx.io/#/console/analyses/b22cc0e0-8ff8-4fe8-87ca-ab8312ed2708)
- **Issue:** SWC-123 - Requirement Violation
- **Severity:** Low
- **Description:** A requirement was violated in a nested call and the call was reverted as a result. Make sure valid inputs are provided to the nested call (for instance, via passed arguments).
- **Line:** 436
```
            try IERC1155Receiver(to).onERC1155BatchReceived(operator, from, ids, amounts, data) returns (bytes4 response) {
```


- **UUID:** [948a70a6-a39e-4cd9-80f7-880ebcfb7966](https://dashboard.mythx.io/#/console/analyses/948a70a6-a39e-4cd9-80f7-880ebcfb7966)
- **Issue:** SWC-123 - Requirement Violation
- **Severity:** Low
- **Description:** A requirement was violated in a nested call and the call was reverted as a result. Make sure valid inputs are provided to the nested call (for instance, via passed arguments).
- **Line:** 436
```
            try IERC1155Receiver(to).onERC1155BatchReceived(operator, from, ids, amounts, data) returns (bytes4 response) {
```


##  Report for IERC1155.sol

##  Report for IERC1155Receiver.sol

##  Report for extensions/ERC1155Burnable.sol

##  Report for extensions/IERC1155MetadataURI.sol

##  Report for utils/Address.sol

##  Report for utils/Context.sol

##  Report for utils/ERC165.sol

##  Report for utils/IERC165.sol

##  Report for contracts/ERC1155/utils/Strings.sol

##  Report for AccessControl.sol

##  Report for Context.sol

##  Report for ERC165.sol

##  Report for IERC165.sol

##  Report for Strings.sol

##  Report for AccessControlEnumerable.sol

##  Report for EnumerableSet.sol

##  Report for utils/ERC1155Holder.sol

##  Report for utils/ERC1155Receiver.sol

##  Report for contracts/ERC1155/utils/Address.sol

##  Report for contracts/ERC1155/utils/EnumerableSet.sol

##  Report for ERC165Checker.sol

- **UUID:** [4fb201e8-c6b5-4656-95ee-ff0f98223447](https://dashboard.mythx.io/#/console/analyses/4fb201e8-c6b5-4656-95ee-ff0f98223447)
- **Issue:** SWC-134 - Message call with hardcoded gas amount
- **Severity:** Low
- **Description:** The highlighted function call forwards a fixed amount of gas. This is discouraged as the gas cost of EVM instructions may change in the future, which could break this contract&#39;s assumptions. If this was done to prevent reentrancy attacks, consider alternative methods such as the checks-effects-interactions pattern or reentrancy locks instead.
- **Line:** 104
```
        (bool success, bytes memory result) = account.staticcall{ gas: 30000 }(encodedParams);
```


##  Report for contracts/Clones.sol

##  Report for Bezier.sol

##  Report for PRBMathCommon.sol

##  Report for PRBMathUD60x18.sol

##  Report for BondzierFactory.sol

- **UUID:** [26e07aca-9c7e-498a-8e8b-91f022856e65](https://dashboard.mythx.io/#/console/analyses/26e07aca-9c7e-498a-8e8b-91f022856e65)
- **Issue:** SWC-100 - Function Default Visibility
- **Severity:** Low
- **Description:** The function definition of &#34;null&#34; lacks a visibility specifier. Note that the compiler assumes &#34;public&#34; visibility by default. Function visibility should always be specified explicitly to assure correctness of the code and improve readability.
- **Line:** 34
```
  constructor (address _bondzierContractAddress, address _tokenContractAddress) {
```


##  Report for Clones.sol

##  Report for IInit.sol

##  Report for IRegister.sol

##  Report for contracts/PRBMathCommon.sol

##  Report for Bondzier1155.sol

- **UUID:** [c05adefa-b6a6-4cc8-958f-fcdfe4c357c4](https://dashboard.mythx.io/#/console/analyses/c05adefa-b6a6-4cc8-958f-fcdfe4c357c4)
- **Issue:** SWC-100 - Function Default Visibility
- **Severity:** Low
- **Description:** The function definition of &#34;null&#34; lacks a visibility specifier. Note that the compiler assumes &#34;public&#34; visibility by default. Function visibility should always be specified explicitly to assure correctness of the code and improve readability.
- **Line:** 30
```
    constructor(string memory uri) ERC1155(uri) {
```


##  Report for ERC1155/ERC1155.sol

##  Report for ERC1155/IERC1155.sol

##  Report for ERC1155/IERC1155Receiver.sol

##  Report for ERC1155/extensions/ERC1155Burnable.sol

##  Report for ERC1155/extensions/IERC1155MetadataURI.sol

##  Report for ERC1155/utils/AccessControl.sol

##  Report for ERC1155/utils/AccessControlEnumerable.sol

##  Report for ERC1155/utils/Address.sol

##  Report for ERC1155/utils/Context.sol

##  Report for ERC1155/utils/ERC165.sol

##  Report for ERC1155/utils/EnumerableSet.sol

##  Report for ERC1155/utils/IERC165.sol

##  Report for ERC1155/utils/Strings.sol

##  Report for Bondzier.sol

- **UUID:** [32f00f15-eeca-4a29-b811-51fc8768024c](https://dashboard.mythx.io/#/console/analyses/32f00f15-eeca-4a29-b811-51fc8768024c)
- **Issue:** SWC-116 - Timestamp Dependence
- **Severity:** Low
- **Description:** The block.timestamp environment variable is used to determine a control flow decision. Note that the values of variables like coinbase, gaslimit, block number and timestamp are predictable and can be manipulated by a malicious miner. Also keep in mind that attackers know hashes of earlier blocks. Don&#39;t use any of those environment variables as sources of randomness and be aware that use of these variables introduces a certain level of trust into miners.
- **Line:** 148
```
    require (block.timestamp &lt; endTime, &#34;Market closed.&#34;);
```


##  Report for IMinter.sol

----------
Made with ♥ by [MythX CLI](https://github.com/dmuhs/mythx-cli)
