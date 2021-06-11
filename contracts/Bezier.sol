// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;

import "./PRBMathUD60x18.sol";

library Bezier {

  using PRBMathUD60x18 for uint256;

  uint256 internal constant three = 3*1e18;

  function pow (uint256 _t, uint256 _e) internal pure returns (uint256) {
     return PRBMathUD60x18.pow(_t, _e);
  }
  function precalc(uint256 _t) internal pure returns(uint256, uint256) {
     return (three.mul(pow(1e18 - _t, 2)).mul(_t), three.mul( 1e18 - _t).mul(pow(_t,2)));
  }
  
  function bezier (uint256[2] memory p0, uint256[2] memory p1, uint256[2] memory p2, uint256[2] memory p3,  uint256 t) internal pure returns (uint256 x, uint256 y) {
   (uint256 a, uint256 b) = precalc(t);
   x = pow(1e18 - t,3).mul(p0[0]) + a.mul(p1[0]) + b.mul(p2[0]) + pow(t, 3).mul(p3[0]);
   y = pow(1e18 - t,3).mul(p0[1]) + a.mul(p1[1]) + b.mul(p2[1]) + pow(t, 3).mul(p3[1]);
   return (x, y);
  }

  function bezierY (uint256 p0y,uint256 p1y,uint256 p2y,uint256 p3y, uint256 t) internal pure returns (uint256 y) {
   (uint256 a, uint256 b) = precalc(t);
   return pow(1e18 - t,3).mul(p0y) + a.mul(p1y) + b.mul(p2y) + pow(t, 3).mul(p3y);
  }
  
  function bezierX (uint256 p0x,uint256 p1x,uint256 p2x,uint256 p3x, uint256 t) internal pure returns (uint256 x) {
   (uint256 a, uint256 b) = precalc(t);
   return pow(1e18 - t,3).mul(p0x) + a.mul(p1x) + b.mul(p2x) + pow(t, 3).mul(p3x);
   
  }
  
}