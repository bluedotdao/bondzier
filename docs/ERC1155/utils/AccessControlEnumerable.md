## `AccessControlEnumerable`



Extension of {AccessControl} that allows enumerating the members of each role.


### `supportsInterface(bytes4 interfaceId) → bool` (public)



See {IERC165-supportsInterface}.

### `getRoleMember(bytes32 role, uint256 index) → address` (public)



Returns one of the accounts that have `role`. `index` must be a
value between 0 and {getRoleMemberCount}, non-inclusive.

Role bearers are not sorted in any particular way, and their ordering may
change at any point.

WARNING: When using {getRoleMember} and {getRoleMemberCount}, make sure
you perform all queries on the same block. See the following
https://forum.openzeppelin.com/t/iterating-over-elements-on-enumerableset-in-openzeppelin-contracts/2296[forum post]
for more information.

### `getRoleMemberCount(bytes32 role) → uint256` (public)



Returns the number of accounts that have `role`. Can be used
together with {getRoleMember} to enumerate all bearers of a role.

### `grantRole(bytes32 role, address account)` (public)



Overload {grantRole} to track enumerable memberships

### `revokeRole(bytes32 role, address account)` (public)



Overload {revokeRole} to track enumerable memberships

### `renounceRole(bytes32 role, address account)` (public)



Overload {renounceRole} to track enumerable memberships

### `_setupRole(bytes32 role, address account)` (internal)



Overload {_setupRole} to track enumerable memberships


