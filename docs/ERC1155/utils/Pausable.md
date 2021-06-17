## `Pausable`



Contract module which allows children to implement an emergency stop
mechanism that can be triggered by an authorized account.

This module is used through inheritance. It will make available the
modifiers `whenNotPaused` and `whenPaused`, which can be applied to
the functions of your contract. Note that they will not be pausable by
simply including this module, only once the modifiers are put in place.

### `whenNotPaused()`



Modifier to make a function callable only when the contract is not paused.

Requirements:

- The contract must not be paused.

### `whenPaused()`



Modifier to make a function callable only when the contract is paused.

Requirements:

- The contract must be paused.


### `constructor()` (internal)



Initializes the contract in unpaused state.

### `paused() → bool` (public)



Returns true if the contract is paused, and false otherwise.

### `_pause()` (internal)



Triggers stopped state.

Requirements:

- The contract must not be paused.

### `_unpause()` (internal)



Returns to normal state.

Requirements:

- The contract must be paused.


### `Paused(address account)`



Emitted when the pause is triggered by `account`.

### `Unpaused(address account)`



Emitted when the pause is lifted by `account`.

