// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract CoiniToken is ERC20, ERC20Permit {
    address public admin;
    address minter;
    constructor(address _admin, address _minter) ERC20("CoiniToken", "CTK") ERC20Permit("CoiniToken") {
        admin = _admin;
        minter = _minter;
    }

    function decimals() public view virtual override returns (uint8) {
        return 18;
    }
}
