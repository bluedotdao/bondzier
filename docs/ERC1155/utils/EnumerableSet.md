## `EnumerableSet`



Library for managing
https://en.wikipedia.org/wiki/Set_(abstract_data_type)[sets] of primitive
types.

Sets have the following properties:

- Elements are added, removed, and checked for existence in constant time
(O(1)).
- Elements are enumerated in O(n). No guarantees are made on the ordering.

```
contract Example {
    // Add the library methods
    using EnumerableSet for EnumerableSet.AddressSet;

    // Declare a set state variable
    EnumerableSet.AddressSet private mySet;
}
```

As of v3.3.0, sets of type `bytes32` (`Bytes32Set`), `address` (`AddressSet`)
and `uint256` (`UintSet`) are supported.


### `add(struct EnumerableSet.Bytes32Set set, bytes32 value) → bool` (internal)



Add a value to a set. O(1).

Returns true if the value was added to the set, that is if it was not
already present.

### `remove(struct EnumerableSet.Bytes32Set set, bytes32 value) → bool` (internal)



Removes a value from a set. O(1).

Returns true if the value was removed from the set, that is if it was
present.

### `contains(struct EnumerableSet.Bytes32Set set, bytes32 value) → bool` (internal)



Returns true if the value is in the set. O(1).

### `length(struct EnumerableSet.Bytes32Set set) → uint256` (internal)



Returns the number of values in the set. O(1).

### `at(struct EnumerableSet.Bytes32Set set, uint256 index) → bytes32` (internal)



Returns the value stored at position `index` in the set. O(1).

Note that there are no guarantees on the ordering of values inside the
array, and it may change when more values are added or removed.

Requirements:

- `index` must be strictly less than {length}.

### `add(struct EnumerableSet.AddressSet set, address value) → bool` (internal)



Add a value to a set. O(1).

Returns true if the value was added to the set, that is if it was not
already present.

### `remove(struct EnumerableSet.AddressSet set, address value) → bool` (internal)



Removes a value from a set. O(1).

Returns true if the value was removed from the set, that is if it was
present.

### `contains(struct EnumerableSet.AddressSet set, address value) → bool` (internal)



Returns true if the value is in the set. O(1).

### `length(struct EnumerableSet.AddressSet set) → uint256` (internal)



Returns the number of values in the set. O(1).

### `at(struct EnumerableSet.AddressSet set, uint256 index) → address` (internal)



Returns the value stored at position `index` in the set. O(1).

Note that there are no guarantees on the ordering of values inside the
array, and it may change when more values are added or removed.

Requirements:

- `index` must be strictly less than {length}.

### `add(struct EnumerableSet.UintSet set, uint256 value) → bool` (internal)



Add a value to a set. O(1).

Returns true if the value was added to the set, that is if it was not
already present.

### `remove(struct EnumerableSet.UintSet set, uint256 value) → bool` (internal)



Removes a value from a set. O(1).

Returns true if the value was removed from the set, that is if it was
present.

### `contains(struct EnumerableSet.UintSet set, uint256 value) → bool` (internal)



Returns true if the value is in the set. O(1).

### `length(struct EnumerableSet.UintSet set) → uint256` (internal)



Returns the number of values on the set. O(1).

### `at(struct EnumerableSet.UintSet set, uint256 index) → uint256` (internal)



Returns the value stored at position `index` in the set. O(1).

Note that there are no guarantees on the ordering of values inside the
array, and it may change when more values are added or removed.

Requirements:

- `index` must be strictly less than {length}.


