# MythX Report for 60d621099ca9bc00186d6d79
##  Report for ERC1155.sol

- **UUID:** [32e38cf5-aa22-442c-82ab-8065ad90c396](https://dashboard.mythx.io/#/console/analyses/32e38cf5-aa22-442c-82ab-8065ad90c396)
- **Issue:** SWC-123 - Requirement Violation
- **Severity:** Low
- **Description:** A requirement was violated in a nested call and the call was reverted as a result. Make sure valid inputs are provided to the nested call (for instance, via passed arguments).
- **Line:** 19
```
contract ERC1155 is Context, ERC165, IERC1155, IERC1155MetadataURI {
```


- **UUID:** [b4869ed4-9c46-479a-9b11-0f54a2d30210](https://dashboard.mythx.io/#/console/analyses/b4869ed4-9c46-479a-9b11-0f54a2d30210)
- **Issue:** SWC-123 - Requirement Violation
- **Severity:** Low
- **Description:** A requirement was violated in a nested call and the call was reverted as a result. Make sure valid inputs are provided to the nested call (for instance, via passed arguments).
- **Line:** 19
```
contract ERC1155 is Context, ERC165, IERC1155, IERC1155MetadataURI {
```


- **UUID:** [32e38cf5-aa22-442c-82ab-8065ad90c396](https://dashboard.mythx.io/#/console/analyses/32e38cf5-aa22-442c-82ab-8065ad90c396)
- **Issue:** SWC-123 - Requirement Violation
- **Severity:** Low
- **Description:** A requirement was violated in a nested call and the call was reverted as a result. Make sure valid inputs are provided to the nested call (for instance, via passed arguments).
- **Line:** 436
```
            try IERC1155Receiver(to).onERC1155BatchReceived(operator, from, ids, amounts, data) returns (bytes4 response) {
```


- **UUID:** [b4869ed4-9c46-479a-9b11-0f54a2d30210](https://dashboard.mythx.io/#/console/analyses/b4869ed4-9c46-479a-9b11-0f54a2d30210)
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

- **UUID:** [80671a93-debc-4a65-abe6-d31e8a060caa](https://dashboard.mythx.io/#/console/analyses/80671a93-debc-4a65-abe6-d31e8a060caa)
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

- **UUID:** [7d359703-ba6a-4446-bfa2-50c8f7ec3c33](https://dashboard.mythx.io/#/console/analyses/7d359703-ba6a-4446-bfa2-50c8f7ec3c33)
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

- **UUID:** [ec7b8bab-da44-470d-926d-32624b7e235b](https://dashboard.mythx.io/#/console/analyses/ec7b8bab-da44-470d-926d-32624b7e235b)
- **Issue:** SWC-123 - Requirement Violation
- **Severity:** Low
- **Description:** A requirement was violated in a nested call and the call was reverted as a result. Make sure valid inputs are provided to the nested call (for instance, via passed arguments).
- **Line:** 25
```
contract Bondzier1155 is Context, AccessControlEnumerable, ERC1155Burnable, IMinter, IRegister {
```


- **UUID:** [ec7b8bab-da44-470d-926d-32624b7e235b](https://dashboard.mythx.io/#/console/analyses/ec7b8bab-da44-470d-926d-32624b7e235b)
- **Issue:** SWC-100 - Function Default Visibility
- **Severity:** Low
- **Description:** The function definition of &#34;null&#34; lacks a visibility specifier. Note that the compiler assumes &#34;public&#34; visibility by default. Function visibility should always be specified explicitly to assure correctness of the code and improve readability.
- **Line:** 32
```
    constructor(string memory uri) ERC1155(uri) {
```


##  Report for ERC1155/ERC1155.sol

- **UUID:** [ec7b8bab-da44-470d-926d-32624b7e235b](https://dashboard.mythx.io/#/console/analyses/ec7b8bab-da44-470d-926d-32624b7e235b)
- **Issue:** SWC-123 - Requirement Violation
- **Severity:** Low
- **Description:** A requirement was violated in a nested call and the call was reverted as a result. Make sure valid inputs are provided to the nested call (for instance, via passed arguments).
- **Line:** 413
```
            try IERC1155Receiver(to).onERC1155Received(operator, from, id, amount, data) returns (bytes4 response) {
```


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

##  Report for IMinter.sol

##  Report for Bondzier.sol

- **UUID:** [12514302-e168-49b3-a146-5ae2125975ad](https://dashboard.mythx.io/#/console/analyses/12514302-e168-49b3-a146-5ae2125975ad)
- **Issue:** SWC-116 - Timestamp Dependence
- **Severity:** Low
- **Description:** The block.timestamp environment variable is used to determine a control flow decision. Note that the values of variables like coinbase, gaslimit, block number and timestamp are predictable and can be manipulated by a malicious miner. Also keep in mind that attackers know hashes of earlier blocks. Don&#39;t use any of those environment variables as sources of randomness and be aware that use of these variables introduces a certain level of trust into miners.
- **Line:** 148
```
    require (block.timestamp &lt; endTime, &#34;Market closed.&#34;);
```


----------
Made with ♥ by [MythX CLI](https://github.com/dmuhs/mythx-cli)
