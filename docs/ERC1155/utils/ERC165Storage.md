## `ERC165Storage`



Storage based implementation of the {IERC165} interface.

Contracts may inherit from this and call {_registerInterface} to declare
their support of an interface.


### `supportsInterface(bytes4 interfaceId) → bool` (public)



See {IERC165-supportsInterface}.

### `_registerInterface(bytes4 interfaceId)` (internal)



Registers the contract as an implementer of the interface defined by
`interfaceId`. Support of the actual ERC165 interface is automatic and
registering its interface id is not required.

See {IERC165-supportsInterface}.

Requirements:

- `interfaceId` cannot be the ERC165 invalid interface (`0xffffffff`).


