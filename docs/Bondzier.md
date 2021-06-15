## `Bondzier`



Implementation contract of a bondzier curve, to be cloned and init'd by BondzierFactory contract
Expects to be granted a miner role on a 1155 contract
Offers `total` 1155 token for sale, where the price is determined by a Y coordinate of a defined bezier curve.
param `t` will be calculated depending on your defined `total` and increased by each newly minted token.


### `step() → uint256` (public)



Function to calulate `step` (how much will we move from 0 towards 1 for the `t` param ). Depends on your defined `total`

### `available() → uint256` (public)



Returns how many tokens are still available for purchase

### `priceN(uint256 _n) → uint256 p` (public)



Returns expected price of the nth token.

### `nextPrice() → uint256` (public)



Returns the price of the next token to be sold/minted.

### `buy()` (external)



Buy next available token. Function expects `msg.value` to be greater or equal to the `nextPrice()` result
Reverts if market closed.
If everything is ok, a new token(s) will be minted
Funds immediately sent to the owner address
Token immideately minted to the msg.sender
Any extra funds returned to the msg.sender

### `init(uint128 _nonce, bool _isNonFungible, uint256 _amnt, uint256 _total, uint256[6] _points, address _owneraddress, uint256 _endTime, string _uri, address _tokenContractAddress, bytes _data)` (public)



Init the new bondzier contract. Since this is a clone, constructor is unavailable, so the factory contract calls the init function.
Called only once, by the factory contract.

Accepts: 
current nonce (used to generate token id),
inNonFungible - is the token minted a fungible or non fungible token
points - array of point coordinates. In our modelthe x-axis represents available items, y - axis represents item price. 
  points[0] coordinate defines startPrice (this is actually p0[1] y coordinate in the contract defining start price. x coordinate p0[0] is set to `0`) 
  [points[1], points[2]]. and [points[3], points[4]] coordinates define p1[x,y] and p2[x,y], the 'freely movable' ponts that change the curves shape.
  points[5] coordinate defines endPrice (this is actually p3[1] y coordinate in the contract defining end price. x coordinate p3[0] is set to `total`) 
amnt - amount to be minted on each buy. Expected to be 1 for NFTs
total - total buy opportunities available, on each buy, new token(s) is/are minted.
endtime - UNIX timestamp in seconds set into the future, when the sales will be stopped.
uri - resource for your token
tokenContractAddress - address of the 1155 token contract
data - a place for your data, in bytes.


