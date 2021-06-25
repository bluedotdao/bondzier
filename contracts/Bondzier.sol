//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.4;

import "./PRBMathUD60x18.sol";
import "./IMinter.sol";
import "./Bezier.sol";
import "./IInit.sol";

/**
 * @dev Implementation contract of a bondzier curve, to be cloned and init'd by BondzierFactory contract.
 *
 * Expects to be granted a minter role on a 1155 contract when deployed.
 *
 * Offers `total` tokens* for sale, where the price is determined by a Y coordinate of a defined bezier curve. (Since `amnt` can be > 1 for non-fungibles, `total` might not be the same as the number of the minted tokens. )
 *
 * Param `t` will be calculated depending on your defined `total` and increased by each newly minted token.
 *
 * #### The `Bondzier` coordinate system 
 *
 * x axis ->  items to be minted (lets define total items)
 * y axis ->  price
 *
 * we then draw the bezier curve in this coordinate system.
 *
 * #### `Bondzier` - setting the restricitions
 * 
 * Pivot points confined to have coordinate x in range `0 <= x <= total items` and `y >= 0`, to prevent loops*
 * 
 * All coordinate values confined to `y >= 0`
 * 
 * First anchor point locked to have 0 as x coordinate
 * 
 * Second anchor point locked  to have total items as x coordinate
 * 
 * You define y position of the first anchor point and this is your start price, `y >= 0`
 * 
 * You define y position of the second anchor pont and this is your end price , `y >= 0`
 * 
 * You define pivot points positions, thus the shape of the curve.
 * 
 * #### Drawing the curve
 *
 * To draw your bezier curve, you can provide param t. 
 *
 * For `t = 0`, the bezier solves to coordinates of the first anchor point. for `t = 1`, solves to coordinates of the second achor points. Solving for values from 0 to 1 draws the whole curve. 
 *
 * #### Relation between t and total items in `Bondzier`
 *
 * If your `total items = 1`, `t = 1` and your bezier curve essentially solves to a point, regardless of the pivot points and position of the first anchor point
 *
 * If `total items = 2`, we provide two values for t, `t = 0` and `t = 1` and your bezier curve is essentialy a line in space, regardless of the pivot points.
 *
 * If `total items = 3`, `t = [0,0.5,1]` and your bondzier curve is starting to look like a curve a bit.
 *
 * For larger numbers of total items (you solve bezier for larger number of t values), imagine your curve is getting smoother and smoother.
 *
 * #### Minting the tokens
 *
 * For each call of the mint function you increase the t param by a step amount, calculated from total items as above.
 *
 * If non-fungible, mint amt must be 1, 
 * for fungibles, mint amt must be >= 1
 *
 * The price to call mint is determined by the calculated y coordinate for the current param t.
 *
 */

contract Bondzier is IInit { 
  
  using PRBMathUD60x18 for uint256;

  string public uri;

  address public tokenContractAddress;
  address payable public OwnerAddress;
  
  uint256[2] public p0;
  uint256[2] public p1;
  uint256[2] public p2;
  uint256[2] public p3;

  uint256 private t;
  uint256 public n;
  uint256 public total;
  uint256 public amnt;
  uint256 public endTime;
  
  uint128 public nonce;
  uint128 public h;

  bool public isNonFungible;
  
  IMinter private m;

  bytes public data;
 
  constructor() {
     t = 1e18;
  }

  /**
  * @dev Function to calulate `step` (how much will we move from 0 towards 1 for the `t` param ). Depends on your defined `total`
  */
  function step () public view returns (uint256) {
      if(total == 1e18) return 1e18;
      return PRBMathUD60x18.inv(total - 1e18);  
  }

  /**
  * @dev Returns how many token(s) buy opportunities are available
  */
  function available () external view returns (uint256) {
      return total - n; 
    
  }
  /**
  * @dev Returns expected price of the nth token(s).
  */
  function priceN (uint256 _n) external view returns(uint256 p) {

    require(PRBMathUD60x18.frac(_n) == 0, "n must be a whole number.");
    require(_n < total, "n must be less than total");
    return Bezier.bezierY(p0[1],p1[1],p2[1],p3[1],_n.mul(step()));
  }

  /**
  * @dev Returns the price of the next token(s) to be sold/minted.
  */
  function nextPrice() public view returns (uint256) {
    require(n < total, "Sold Out.");
    return Bezier.bezierY(p0[1],p1[1],p2[1],p3[1],n.mul(step()));
  }
   
   /**
  * @dev Buy next available token(s). Function expects `msg.value` to be greater or equal to the `nextPrice()` result
  *
  * Reverts if market closed.
  *
  * If everything is ok, a new token(s) will be minted
  *
  * Funds immediately sent to the owner address
  *
  * Token(s) immideately minted to the msg.sender
  *
  * Any extra funds returned to the msg.sender
  */
  function buy () external payable {
    require (block.timestamp < endTime, "Market closed.");
    
    uint256 price = nextPrice();   
    require(msg.value >= price, "Check msg.value");
    
    uint256 change = msg.value - price;
    uint256 id = uint256 (nonce) << 128 | h;
    
    n = n + 1e18;
    if(isNonFungible) {h = h + 1;}
    

    (bool t2, ) = OwnerAddress.call{value : price}("");
    require(t2, "Owner transfer failed...");
    
    m.mint(msg.sender, id, amnt, data);

    (bool t1, ) = msg.sender.call{value : change}("");
    require(t1, "Change transfer failed.");
    
    
  }

   /**
  * @dev Init the new bondzier contract. Since this is a clone, constructor is unavailable, so the factory contract calls the init function.
  * Called only once, by the factory contract.
  *
  * Accepts: 
  *
  * current `nonce` (used to generate token id),
  *
  * `inNonFungible` - is the token minted a fungible or non fungible token
  *
  * `points` - array of point coordinates. In our modelthe x-axis represents available items, y - axis represents item price. 
  *
  * `points[0]` coordinate defines `startPrice` (this is `p0[1]` y coordinate in the contract defining start price. x coordinate `p0[0]` is set to `0`) 
  *
  * `[points[1], points[2]]` and `[points[3], points[4]]` coordinates define `p1[x,y]` and `p2[x,y]`, the 'freely movable' ponts that change the curves shape.
  *
  *  `points[5]` coordinate defines `endPrice` (this is actually `p3[1]` y coordinate in the contract defining end price. x coordinate `p3[0]` is set to `total`) 
  *
  * `amnt` - amount to be minted on each buy. Expected to be 1 for NFTs
  *
  * `total` - total buy opportunities available, on each buy, new token(s) is/are minted.
  *
  * `endtime` - UNIX timestamp in seconds set into the future, when the sales will be stopped.
  *
  * `uri` - resource for your token
  *
  * `tokenContractAddress` - address of the 1155 token contract
  *
  * `data` - a place for your data, in bytes.
  */

  function init(  uint128 _nonce,
                  bool _isNonFungible, 
                  uint256 _amnt, 
                  uint256 _total,
                  uint256[6] memory _points, 
                  address _owneraddress, 
                  uint256 _endTime, 
                  string memory _uri, 
                  address _tokenContractAddress,
                  bytes memory _data
                ) external override { 
    
    require (t != 1e18, 'cannot init.');
    require(PRBMathUD60x18.frac(_total) == 0, "total must be a whole number.");
    require(_total >= 1e18, "total must be greater or equal 1e18");
    require(_amnt > 0, "Minting amount must be greater than zero..");
    require(_points[1] <= _total, "point coords not ok");
    require(_points[3] <= _total, "point coords not ok");
    require(_owneraddress != address(0), "Owner address must be non-zero.");
    require(_tokenContractAddress != address(0), "Token contract address must be non-zero.");
    require(_endTime > block.timestamp, "Endtime must be set into future."); 
    if(_isNonFungible) {
      require(_amnt == 1, "Non-fungible tokens must have amount set to 1");
    }

    t = 1e18;
    isNonFungible = _isNonFungible;
    amnt = _amnt;
    total = _total;
    p0 = [0,_points[0]];
    p1 = [_points[1], _points[2]];
    p2 = [_points[3], _points[4]];
    p3 = [total, _points[5]];
    n = 0;
    h = 0;
    tokenContractAddress = _tokenContractAddress;
    OwnerAddress = payable(_owneraddress);
    uri = _uri;
    nonce = _nonce;
    endTime = _endTime;
    m = IMinter(_tokenContractAddress); 
    data = _data;
  }

}