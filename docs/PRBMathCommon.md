## `PRBMathCommon`



Common mathematical functions used in both PRBMathSD59x18 and PRBMathUD60x18. Note that this shared library
does not always assume the signed 59.18-decimal fixed-point or the unsigned 60.18-decimal fixed-point


### `exp2(uint256 x) → uint256 result` (internal)

Calculates the binary exponent of x using the binary fraction method.


Uses 128.128-bit fixed-point numbers - it is the most efficient way.


### `mostSignificantBit(uint256 x) → uint256 msb` (internal)

Finds the zero-based index of the first one in the binary representation of x.


See the note on msb in the "Find First Set" Wikipedia article https://en.wikipedia.org/wiki/Find_first_set


### `mulDiv(uint256 x, uint256 y, uint256 denominator) → uint256 result` (internal)

Calculates floor(x*y÷denominator) with full precision.



Credit to Remco Bloemen under MIT license https://xn--2-umb.com/21/muldiv.

Requirements:
- The denominator cannot be zero.
- The result must fit within uint256.

Caveats:
- This function does not work with fixed-point numbers.



### `mulDivFixedPoint(uint256 x, uint256 y) → uint256 result` (internal)

// @notice Calculates floor(x*y÷1e18) with full precision.



Variant of "mulDiv" with constant folding, i.e. in which the denominator is always 1e18. Before returning the
final result, we add 1 if (x * y) % SCALE >= HALF_SCALE. Without this, 6.6e-19 would be truncated to 0 instead of
being rounded to 1e-18.  See "Listing 6" and text above it at https://accu.org/index.php/journals/1717.

Requirements:
- The result must fit within uint256.

Caveats:
- The body is purposely left uncommented; see the NatSpec comments in "PRBMathCommon.mulDiv" to understand how this works.
- It is assumed that the result can never be type(uint256).max when x and y solve the following two queations:
    1) x * y = type(uint256).max * SCALE
    2) (x * y) % SCALE >= SCALE / 2



### `sqrt(uint256 x) → uint256 result` (internal)

/ @notice Calculates the square root of x, rounding down.


Uses the Babylonian method https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Babylonian_method.

Caveats:
- This function does not work with fixed-point numbers.




