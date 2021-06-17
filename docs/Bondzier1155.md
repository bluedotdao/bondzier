## `Bondzier1155`



{Bondzier1155} token, including:

 - ability for holders to burn (destroy) their tokens
 - a minter role that allows for token minting (creation) assigned to bondzier market curve contracts
 - a register function to help token discovery 

This contract uses {AccessControl} to lock permissioned functions using the
different roles - head to its documentation for details.

The account that deploys the contract will be granted the default admin role, which will let it grant minter
 roles to other accounts.


### `constructor(string uri)` (public)



Grants `DEFAULT_ADMIN_ROLE` to the account that
deploys the contract.

### `register(string uri, address c, uint128 nonce)` (public)



Registers a new token type.

### `mint(address to, uint256 id, uint256 amount, bytes data)` (public)



Creates `amount` new tokens for `to`, of token type `id`.

See {ERC1155-_mint}.

Requirements:

- the caller must have the `MINTER_ROLE`.

### `mintBatch(address to, uint256[] ids, uint256[] amounts, bytes data)` (public)



xref:ROOT:erc1155.adoc#batch-operations[Batched] variant of {mint}.

### `supportsInterface(bytes4 interfaceId) → bool` (public)



See {IERC165-supportsInterface}.

### `_beforeTokenTransfer(address operator, address from, address to, uint256[] ids, uint256[] amounts, bytes data)` (internal)






