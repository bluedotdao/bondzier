//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "./PRBMathUD60x18.sol";
import "hardhat/console.sol";
import "./IMinter.sol";
import "./Bezier.sol";

contract Bondzier { 
  
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

  function step () public view returns (uint256) {
      if(total == 1e18) return 1e18;
      return PRBMathUD60x18.inv(total - 1e18);  
  }

  function available () public view returns (uint256) {
      return total - n; 
    
  }
  function priceN (uint256 _n) public view returns(uint256 p) {

    require(PRBMathUD60x18.frac(_n) == 0, "n must be a whole number.");
    require(_n >= 0, "n must be equal or greater than zero");
    require(_n < total, "n must be less than total");
    return Bezier.bezierY(p0[1],p1[1],p2[1],p3[1],_n.mul(step()));
  }
  
  function nextPrice() public view returns (uint256) {
    require(n < total, "Sold Out.");
    return Bezier.bezierY(p0[1],p1[1],p2[1],p3[1],n.mul(step()));
  }
   

  function buy () external payable {
    require (block.timestamp < endTime, "Market closed.");
    
    uint256 price = nextPrice();   
    require(msg.value >= price, "Check msg.value");
    
    uint256 change = msg.value - price;
    uint256 id = uint256 (nonce) << 128 | h;
    
    n = n + 1e18;
    if(isNonFungible) {h = h + 1;}
    

    console.log(id);

    (bool t2, ) = OwnerAddress.call{value : price}("");
    require(t2, "Owner transfer failed...");
    
    m.mint(msg.sender, id, amnt, data);

    (bool t1, ) = msg.sender.call{value : change}("");
    require(t1, "Change transfer failed.");
    
    
  }

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
                ) public { 
    
    require (t != 1e18, 'cannot init.');
    require(PRBMathUD60x18.frac(_total) == 0, "total must be a whole number.");
    require(_total >= 1e18, "total must be greater or equal 1e18");
    require(_amnt > 0, "Minting amount must be greater than zero..");
    require(_points[0] >= 0, "start price must be greater or equal to zero");
    require(_points[5] >= 0, "end price must be greater or equal to zero");
    require(_points[1] >= 0 && _points[1] <= _total, "point coords not ok");
    require(_points[3] >= 0 && _points[3] <= _total, "point coords not ok");
    require(_points[2] >= 0 && _points[4] >= 0, "point coords not ok");
    require(_owneraddress != address(0), "Owner address must be non-zero.");
    require(_endTime > block.timestamp, "Endtime must be set into future."); 
    if(_isNonFungible) {
      require(_amnt == 1, "Non-fungible tokens must have amount set to 1");
    }

    
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


  /*
    (examples below in javascript) 

    This contract uses bezier implementation as follows and assumes positive values for a,b,c,d:
    
      f(t) = Math.pow(1 - t, 3) * a 
              + 3 * Math.pow(1 - t, 2) * t * b 
              + 3 * (1 - t) * Math.pow(t, 2) * c 
              + Math.pow(t, 3) * d 
        
    Bezier function can also be represented in polynomial form:

      f(t) = (-a + 3 * b -3 * c + d ) * Math.pow(t,3) 
              + (3 * a - 6 * b + 3 * c) * Math.pow(t,2) 
              + ( - 3 * a + 3 * b ) * t 
              + a

    this form could maybe help us save some gas as we could precalculate values for each new bezier function, 
    but we would need to use int256 in solidity:
    
      bezier2 = function(t, p0, p1, p2, p3) {
           
           // precalculate these for each bezier function, can be negative even if all your point coordinates are positive values
           var Ax = (+3*p1[0]-3*p2[0]+p3[0])
           var Bx = (3*p0[0]-6*p1[0]+3*p2[0])
           var Cx = (-3*p0[0] + 3*p1[0])
           var Ay = (-p0[1]+3*p1[1]-3*p2[1]+p3[1])
           var By = (3*p0[1]-6*p1[1]+3*p2[1])
           var Cy = (-3*p0[1] + 3*p1[1])
          
          // then you can get your coordinates by simply doing:   
          var x = Ax*Math.pow(t,3) + Bx*Math.pow(t,2) + Cx*t + p0[0]
          var y = Ay*Math.pow(t,3) + By*Math.pow(t,2) + Cy*t + p0[1]
           

          return [x, y]

      }
  */