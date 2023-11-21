//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "../base/ERC721Token.sol";

contract FactoryERC721 {
   ERC721[] public ERC721Array;

   function CreateNewContract(string memory name, string memory symbol) public {
     ERC721 newContract = new ERC721(name,symbol);
     ERC721Array.push(newContract);
   }

   function factoryMinter(uint256 _contractIndex, address _to, uint256 _tokenId) public {
     ERC721(address(ERC721Array[_contractIndex])).safeMint(_to,_tokenId);
   }

   function factoryOwnerOf(uint256 _contractIndex, uint256 _tokenId) public view returns (address) {
    return ERC721(address(ERC721Array[_contractIndex])).ownerOf(_tokenId);
   }
}