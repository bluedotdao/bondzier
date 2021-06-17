// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.4;


import "./PRBMathUD60x18.sol";

/**
 * @dev 4 control points Bezier curves in Solidity
 *
 * If you have not heard about bezier curves a nice starting point is to visit https://javascript.info/bezier-curve   
 * and play with the examples.
 *
 * The library includes functions to calculate a point coordinates for a bezier curve given p0 - p3 coordinates eg. [x, y] and a parameter t in range[0,1]
 * Depends on PRBMathUD60x18.sol library for uint256.
 *
 *   This library uses bezier implementation as follows:
 *
 *    ```
 *      f(t) = Math.pow(1 - t, 3) * a 
 *              + 3 * Math.pow(1 - t, 2) * t * b 
 *              + 3 * (1 - t) * Math.pow(t, 2) * c 
 *              + Math.pow(t, 3) * d 
 *    ```
 *
 *    Bezier function can also be represented in polynomial form:
 *
 * 
 *    ```
 *      f(t) = (-a + 3 * b -3 * c + d ) * Math.pow(t,3) 
 *              + (3 * a - 6 * b + 3 * c) * Math.pow(t,2) 
 *              + ( - 3 * a + 3 * b ) * t 
 *              + a
 *    ```
 *
 *    this form could maybe help us save some gas as we could precalculate values for each new bezier function, 
 *    but we would need to use int256 in solidity:
 *
 *    ```     
 *      bezier2 = function(t, p0, p1, p2, p3) {
 *           
 *           // precalculate these for each bezier function, can be negative even if all your point coordinates are positive values
 *           var Ax = (+3*p1[0]-3*p2[0]+p3[0])
 *           var Bx = (3*p0[0]-6*p1[0]+3*p2[0])
 *           var Cx = (-3*p0[0] + 3*p1[0])
 *           var Ay = (-p0[1]+3*p1[1]-3*p2[1]+p3[1])
 *           var By = (3*p0[1]-6*p1[1]+3*p2[1])
 *           var Cy = (-3*p0[1] + 3*p1[1])
 *          
 *           // then you can get your coordinates by simply doing:   
 *           var x = Ax*Math.pow(t,3) + Bx*Math.pow(t,2) + Cx*t + p0[0]
 *           svar y = Ay*Math.pow(t,3) + By*Math.pow(t,2) + Cy*t + p0[1]
 *         
 *          return [x, y]
 *    ```
  */
library Bezier {

  using PRBMathUD60x18 for uint256;

  uint256 internal constant three = 3*1e18;
  /**
 * @dev Helper to calculate pow using the PRBMathUD60x18
 */
  function pow (uint256 _t, uint256 _e) internal pure returns (uint256) {
     return PRBMathUD60x18.pow(_t, _e);
  }

 /**
 * @dev Helper function to move some of the calculations for bezier out to a spearate function
 */
  function precalc(uint256 _t) internal pure returns(uint256, uint256) {
     return (three.mul(pow(1e18 - _t, 2)).mul(_t), three.mul( 1e18 - _t).mul(pow(_t,2)));
  }

   /**
 * @dev Calculates point coordinates [x,y] for a given p0-p3 coordinates and a param t [0,1]
 */
  function bezier (uint256[2] memory p0, uint256[2] memory p1, uint256[2] memory p2, uint256[2] memory p3,  uint256 t) internal pure returns (uint256 x, uint256 y) {
   (uint256 a, uint256 b) = precalc(t);
   x = pow(1e18 - t,3).mul(p0[0]) + a.mul(p1[0]) + b.mul(p2[0]) + pow(t, 3).mul(p3[0]);
   y = pow(1e18 - t,3).mul(p0[1]) + a.mul(p1[1]) + b.mul(p2[1]) + pow(t, 3).mul(p3[1]);
   return (x, y);
  }

  /**
 * @dev Calculates point y coordinates for a given p0y-p3y coordinates and a param t [0,1]
 */
  function bezierY (uint256 p0y,uint256 p1y,uint256 p2y,uint256 p3y, uint256 t) internal pure returns (uint256 y) {
   (uint256 a, uint256 b) = precalc(t);
   return pow(1e18 - t,3).mul(p0y) + a.mul(p1y) + b.mul(p2y) + pow(t, 3).mul(p3y);
  }
  
  /**
 * @dev Calculates point x coordinates for a given p0x-p3x coordinates and a param t [0,1]
 */
  function bezierX (uint256 p0x,uint256 p1x,uint256 p2x,uint256 p3x, uint256 t) internal pure returns (uint256 x) {
   (uint256 a, uint256 b) = precalc(t);
   return pow(1e18 - t,3).mul(p0x) + a.mul(p1x) + b.mul(p2x) + pow(t, 3).mul(p3x);
   
  }
  
}