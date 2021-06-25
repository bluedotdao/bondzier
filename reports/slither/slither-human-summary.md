```
'npx hardhat compile --force' running
Compiling 28 files with 0.8.4
Compilation finished successfully

Solidity 0.8.4 is not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.

Learn more at https://hardhat.org/reference/solidity-support"


INFO:Printers:
Compiled with Builder
Number of lines: 3318 (+ 0 in dependencies, + 0 in tests)
Number of assembly lines: 0
Number of contracts: 30 (+ 0 in dependencies, + 0 tests) 

Number of optimization issues: 11
Number of informational issues: 319
Number of low issues: 8
Number of medium issues: 18
Number of high issues: 1
ERCs: ERC165

+-----------------+-------------+--------+------------+--------------+--------------+
|       Name      | # functions |  ERCS  | ERC20 info | Complex code |   Features   |
+-----------------+-------------+--------+------------+--------------+--------------+
|      Bezier     |      6      |        |            |      No      |              |
|     Bondzier    |      8      |        |            |      No      | Receive ETH  |
|                 |             |        |            |              |   Send ETH   |
|   Bondzier1155  |      67     | ERC165 |            |      No      |              |
| BondzierFactory |      5      |        |            |      No      |              |
|      Clones     |      4      |        |            |      No      |   Assembly   |
|     Address     |      11     |        |            |      No      |   Send ETH   |
|                 |             |        |            |              | Delegatecall |
|                 |             |        |            |              |   Assembly   |
|  ERC1155Holder  |      7      | ERC165 |            |      No      |              |
|  ERC165Checker  |      6      |        |            |      No      |              |
|  ERC165Storage  |      4      | ERC165 |            |      No      |              |
|  EnumerableSet  |      20     |        |            |      No      |              |
|     Pausable    |      6      |        |            |      No      |              |
|     Strings     |      4      |        |            |     Yes      |              |
|  PRBMathCommon  |      6      |        |            |     Yes      |   Assembly   |
|  PRBMathUD60x18 |      19     |        |            |     Yes      |   Assembly   |
+-----------------+-------------+--------+------------+--------------+--------------+
INFO:Slither:. analyzed (30 contracts)
INFO:Slither:Use https://crytic.io/ to get access to additional detectors and Github integration

```