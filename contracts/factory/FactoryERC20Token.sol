// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../base/ERC20Token.sol";

contract FactoryER20Token {
    ERC20Token[] public ERC20TokenArray;

    function CreateNewERC20Token(
        string memory name,
        string memory symbol,
        uint256 initialSupply
    ) public {
        ERC20Token erc20Token = new ERC20Token(name, symbol, initialSupply);
        ERC20TokenArray.push(erc20Token);
    }

    function callMint(
        uint256 _erc20TokenIndex,
        address to,
        uint256 amount
    ) public {
        ERC20Token(address(ERC20TokenArray[_erc20TokenIndex])).mint(to, amount);
    }

    function callBalanceOf(
        uint256 _erc20TokenIndex,
        address account
    ) public view returns (uint256) {
        return ERC20Token(address(ERC20TokenArray[_erc20TokenIndex])).balanceOf(account);
    }
}
