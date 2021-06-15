## `ERC165Checker`



Library used to query support of an interface declared via {IERC165}.

Note that these functions return the actual result of the query: they do not
`revert` if an interface is not supported. It is up to the caller to decide
what to do in these cases.


### `supportsERC165(address account) → bool` (internal)



Returns true if `account` supports the {IERC165} interface,

### `supportsInterface(address account, bytes4 interfaceId) → bool` (internal)



Returns true if `account` supports the interface defined by
`interfaceId`. Support for {IERC165} itself is queried automatically.

See {IERC165-supportsInterface}.

### `getSupportedInterfaces(address account, bytes4[] interfaceIds) → bool[]` (internal)



Returns a boolean array where each value corresponds to the
interfaces passed in and whether they're supported or not. This allows
you to batch check interfaces for a contract where your expectation
is that some interfaces may not be supported.

See {IERC165-supportsInterface}.

_Available since v3.4._

### `supportsAllInterfaces(address account, bytes4[] interfaceIds) → bool` (internal)



Returns true if `account` supports all the interfaces defined in
`interfaceIds`. Support for {IERC165} itself is queried automatically.

Batch-querying can lead to gas savings by skipping repeated checks for
{IERC165} support.

See {IERC165-supportsInterface}.


