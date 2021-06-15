## `PRBMathUD60x18`

Smart contract library for advanced fixed-point math. It works with uint256 numbers considered to have 18
trailing decimals. We call this number representation unsigned 60.18-decimal fixed-point, since there can be up to 60
digits in the integer part and up to 18 decimals in the fractional part. The numbers are bound by the minimum and the
maximum values permitted by the Solidity type uint256.




### `avg(uint256 x, uint256 y) → uint256 result` (internal)

Calculates arithmetic average of x and y, rounding down.




### `ceil(uint256 x) → uint256 result` (internal)

Yields the least unsigned 60.18 decimal fixed-point number greater than or equal to x.



Optimised for fractional value inputs, because for every whole value there are (1e18 - 1) fractional counterparts.
See https://en.wikipedia.org/wiki/Floor_and_ceiling_functions.

Requirements:
- x must be less than or equal to MAX_WHOLE_UD60x18.



### `div(uint256 x, uint256 y) → uint256 result` (internal)

Divides two unsigned 60.18-decimal fixed-point numbers, returning a new unsigned 60.18-decimal fixed-point number.



Uses mulDiv to enable overflow-safe multiplication and division.

Requirements:
- y cannot be zero.



### `e() → uint256 result` (internal)

Returns Euler's number as an unsigned 60.18-decimal fixed-point number.


See https://en.wikipedia.org/wiki/E_(mathematical_constant).

### `exp(uint256 x) → uint256 result` (internal)

Calculates the natural exponent of x.



Based on the insight that e^x = 2^(x * log2(e)).

Requirements:
- All from "log2".
- x must be less than 88722839111672999628.



### `exp2(uint256 x) → uint256 result` (internal)

Calculates the binary exponent of x using the binary fraction method.



See https://ethereum.stackexchange.com/q/79903/24693.

Requirements:
- x must be 128e18 or less.
- The result must fit within MAX_UD60x18.



### `floor(uint256 x) → uint256 result` (internal)

Yields the greatest unsigned 60.18 decimal fixed-point number less than or equal to x.


Optimised for fractional value inputs, because for every whole value there are (1e18 - 1) fractional counterparts.
See https://en.wikipedia.org/wiki/Floor_and_ceiling_functions.


### `frac(uint256 x) → uint256 result` (internal)

Yields the excess beyond the floor of x.


Based on the odd function definition https://en.wikipedia.org/wiki/Fractional_part.


### `gm(uint256 x, uint256 y) → uint256 result` (internal)

Calculates geometric mean of x and y, i.e. sqrt(x * y), rounding down.



Requirements:
- x * y must fit within MAX_UD60x18, lest it overflows.



### `inv(uint256 x) → uint256 result` (internal)

Calculates 1 / x, rounding towards zero.



Requirements:
- x cannot be zero.



### `ln(uint256 x) → uint256 result` (internal)

Calculates the natural logarithm of x.



Based on the insight that ln(x) = log2(x) / log2(e).

Requirements:
- All from "log2".

Caveats:
- All from "log2".
- This doesn't return exactly 1 for 2718281828459045235, for that we would need more fine-grained precision.



### `log10(uint256 x) → uint256 result` (internal)

Calculates the common logarithm of x.



First checks if x is an exact power of ten and it stops if yes. If it's not, calculates the common
logarithm based on the insight that log10(x) = log2(x) / log2(10).

Requirements:
- All from "log2".

Caveats:
- All from "log2".



### `log2(uint256 x) → uint256 result` (internal)

Calculates the binary logarithm of x.



Based on the iterative approximation algorithm.
https://en.wikipedia.org/wiki/Binary_logarithm#Iterative_approximation

Requirements:
- x must be greater than or equal to SCALE, otherwise the result would be negative.

Caveats:
- The results are nor perfectly accurate to the last digit, due to the lossy precision of the iterative approximation.



### `mul(uint256 x, uint256 y) → uint256 result` (internal)

Multiplies two unsigned 60.18-decimal fixed-point numbers together, returning a new unsigned 60.18-decimal
fixed-point number.


See the documentation for the "PRBMathCommon.mulDivFixedPoint" function.


### `pi() → uint256 result` (internal)

Retrieves PI as an unsigned 60.18-decimal fixed-point number.



### `pow(uint256 x, uint256 y) → uint256 result` (internal)

Raises x (unsigned 60.18-decimal fixed-point number) to the power of y (basic unsigned integer) using the
famous algorithm "exponentiation by squaring".



See https://en.wikipedia.org/wiki/Exponentiation_by_squaring

Requirements:
- The result must fit within MAX_UD60x18.

Caveats:
- All from "mul".
- Assumes 0^0 is 1.



### `scale() → uint256 result` (internal)

Returns 1 as an unsigned 60.18-decimal fixed-point number.



### `sqrt(uint256 x) → uint256 result` (internal)

Calculates the square root of x, rounding down.


Uses the Babylonian method https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Babylonian_method.

Requirements:
- x must be less than MAX_UD60x18 / SCALE.

Caveats:
- The maximum fixed-point number permitted is 115792089237316195423570985008687907853269.984665640564039458.




