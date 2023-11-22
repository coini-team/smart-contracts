// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../base/ERC20Token.sol";

contract FactoryERC20Token {

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
        return
            ERC20Token(address(ERC20TokenArray[_erc20TokenIndex])).balanceOf(
                account
            );
    }

    //source: https://ethereum.stackexchange.com/questions/103508/is-there-a-way-to-call-a-dynamic-function-name-in-solidity

    function dynamicCall(
        uint256 _erc20TokenIndex,
        bytes calldata _data
    ) public returns (bytes memory) {
        (bool success, bytes memory returnData) = address(
            ERC20TokenArray[_erc20TokenIndex]
        ).call(_data);
        require(success);
        return returnData;
    }
    
}
