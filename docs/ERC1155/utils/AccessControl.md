## `AccessControl`



Contract module that allows children to implement role-based access
control mechanisms. This is a lightweight version that doesn't allow enumerating role
members except through off-chain means by accessing the contract event logs. Some
applications may benefit from on-chain enumerability, for those cases see
{AccessControlEnumerable}.

Roles are referred to by their `bytes32` identifier. These should be exposed
in the external API and be unique. The best way to achieve this is by
using `public constant` hash digests:

```
bytes32 public constant MY_ROLE = keccak256("MY_ROLE");
```

Roles can be used to represent a set of permissions. To restrict access to a
function call, use {hasRole}:

```
function foo() public {
    require(hasRole(MY_ROLE, msg.sender));
    ...
}
```

Roles can be granted and revoked dynamically via the {grantRole} and
{revokeRole} functions. Each role has an associated admin role, and only
accounts that have a role's admin role can call {grantRole} and {revokeRole}.

By default, the admin role for all roles is `DEFAULT_ADMIN_ROLE`, which means
that only accounts with this role will be able to grant or revoke other
roles. More complex role relationships can be created by using
{_setRoleAdmin}.

WARNING: The `DEFAULT_ADMIN_ROLE` is also its own admin: it has permission to
grant and revoke this role. Extra precautions should be taken to secure
accounts that have been granted it.

### `onlyRole(bytes32 role)`



Modifier that checks that an account has a specific role. Reverts
with a standardized message including the required role.

The format of the revert reason is given by the following regular expression:

 /^AccessControl: account (0x[0-9a-f]{20}) is missing role (0x[0-9a-f]{32})$/

_Available since v4.1._


### `supportsInterface(bytes4 interfaceId) → bool` (public)



See {IERC165-supportsInterface}.

### `hasRole(bytes32 role, address account) → bool` (public)



Returns `true` if `account` has been granted `role`.

### `_checkRole(bytes32 role, address account)` (internal)



Revert with a standard message if `account` is missing `role`.

The format of the revert reason is given by the following regular expression:

 /^AccessControl: account (0x[0-9a-f]{20}) is missing role (0x[0-9a-f]{32})$/

### `getRoleAdmin(bytes32 role) → bytes32` (public)



Returns the admin role that controls `role`. See {grantRole} and
{revokeRole}.

To change a role's admin, use {_setRoleAdmin}.

### `grantRole(bytes32 role, address account)` (public)



Grants `role` to `account`.

If `account` had not been already granted `role`, emits a {RoleGranted}
event.

Requirements:

- the caller must have ``role``'s admin role.

### `revokeRole(bytes32 role, address account)` (public)



Revokes `role` from `account`.

If `account` had been granted `role`, emits a {RoleRevoked} event.

Requirements:

- the caller must have ``role``'s admin role.

### `renounceRole(bytes32 role, address account)` (public)



Revokes `role` from the calling account.

Roles are often managed via {grantRole} and {revokeRole}: this function's
purpose is to provide a mechanism for accounts to lose their privileges
if they are compromised (such as when a trusted device is misplaced).

If the calling account had been granted `role`, emits a {RoleRevoked}
event.

Requirements:

- the caller must be `account`.

### `_setupRole(bytes32 role, address account)` (internal)



Grants `role` to `account`.

If `account` had not been already granted `role`, emits a {RoleGranted}
event. Note that unlike {grantRole}, this function doesn't perform any
checks on the calling account.

[WARNING]
====
This function should only be called from the constructor when setting
up the initial roles for the system.

Using this function in any other way is effectively circumventing the admin
system imposed by {AccessControl}.
====

### `_setRoleAdmin(bytes32 role, bytes32 adminRole)` (internal)



Sets `adminRole` as ``role``'s admin role.

Emits a {RoleAdminChanged} event.


### `RoleAdminChanged(bytes32 role, bytes32 previousAdminRole, bytes32 newAdminRole)`



Emitted when `newAdminRole` is set as ``role``'s admin role, replacing `previousAdminRole`

`DEFAULT_ADMIN_ROLE` is the starting admin for all roles, despite
{RoleAdminChanged} not being emitted signaling this.

_Available since v3.1._

### `RoleGranted(bytes32 role, address account, address sender)`



Emitted when `account` is granted `role`.

`sender` is the account that originated the contract call, an admin role
bearer except when using {_setupRole}.

### `RoleRevoked(bytes32 role, address account, address sender)`



Emitted when `account` is revoked `role`.

`sender` is the account that originated the contract call:
  - if using `revokeRole`, it is the admin role bearer
  - if using `renounceRole`, it is the role bearer (i.e. `account`)

