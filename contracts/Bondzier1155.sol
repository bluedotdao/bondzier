// SPDX-License-Identifier: MIT

pragma solidity 0.8.4;

import "./ERC1155/ERC1155.sol";
import "./ERC1155/extensions/ERC1155Burnable.sol";
import "./ERC1155/utils/AccessControlEnumerable.sol";
import "./ERC1155/utils/Context.sol";
import "./IMinter.sol";
import "./IRegister.sol";

/**
 * @dev {Bondzier1155} token, including:
 *
 *  - ability for holders to burn (destroy) their tokens
 *  - a minter role that allows for token minting (creation) assigned to bondzier market curve contracts
 *  - a register function to help token discovery 
 *
 * This contract uses {AccessControl} to lock permissioned functions using the
 * different roles - head to its documentation for details.
 *
 * The account that deploys the contract will be granted the default admin role, which will let it grant minter
 *  roles to other accounts.
 */
contract Bondzier1155 is Context, AccessControlEnumerable, ERC1155Burnable, IMinter, IRegister {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    /**
     * @dev Grants `DEFAULT_ADMIN_ROLE` to the account that
     * deploys the contract.
     */
    constructor(string memory uri) ERC1155(uri) {
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
    }

     /**
     * @dev Registers a new token type.
     */
    function register(string memory uri, address c, uint128 nonce) external override {
        require(hasRole(DEFAULT_ADMIN_ROLE, _msgSender()), "BondzierERC1155: must have admin role to register");
        
        grantRole(MINTER_ROLE, c);
        emit URI(uri, uint256 (nonce) << 128);
    } 


    /**
     * @dev Creates `amount` new tokens for `to`, of token type `id`.
     *
     * See {ERC1155-_mint}.
     *
     * Requirements:
     *
     * - the caller must have the `MINTER_ROLE`.
     */
    function mint(address to, uint256 id, uint256 amount, bytes memory data) external override virtual {
        require(hasRole(MINTER_ROLE, _msgSender()), "BondzierERC1155: must have minter role to mint");

        _mint(to, id, amount, data);
    }

    /**
     * @dev xref:ROOT:erc1155.adoc#batch-operations[Batched] variant of {mint}.
     */
    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data) external virtual {
        require(hasRole(MINTER_ROLE, _msgSender()), "BondzierERC1155: must have minter role to mint");

        _mintBatch(to, ids, amounts, data);
    }



    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override(AccessControlEnumerable, ERC1155) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    function _beforeTokenTransfer(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    )
        internal virtual override(ERC1155)
    {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }
}
