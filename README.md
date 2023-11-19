
# smart-contracts

  

## Uso del script deployTask.js:

  

**Deploy Smart Contract without constructor arguments.**

Example:

Smart Contract Name: CoiniToken

Smart Contract Arguments: 

    npx hardhat --network mumbai deployContract CoiniToken

  

**Deploy Smart Contract with any number of constructor arguments.**

Example 1:

Smart Contract Name: CoiniToken

Smart Contract Arguments: "['0x305D0660aAf097826177D0A38241fa162F6eC9e7','0xC840F562D9F69b46b4227003E01525CB99344B72']"

    npx hardhat --network mumbai deployContract CoiniToken "['0x305D0660aAf097826177D0A38241fa162F6eC9e7','0xC840F562D9F69b46b4227003E01525CB99344B72']"

Example 2:

Smart Contract Name: ERC20Token

Smart Contract Arguments: "['CoiniToken','CTK', '1000000000000000000000000']"

    npx hardhat --network mumbai deployContract ERC20Token "['CoiniToken','CTK', '1000000000000000000000000']"

Example 3:

If the is an error: DeployedBytecodeMultipleMatchesError: More than one contract was found to match the deployed bytecode.

Smart Contract Name: ERC20Token

Smart Contract Arguments: "['CoiniToken','CTK', '1000000000000000000000000']"

Contract Parameter: 'contracts/CoiniToken.sol:CoiniToken'

    npx hardhat --network mumbai deployContract CoiniToken "['0x305D0660aAf097826177D0A38241fa162F6eC9e7','0xC840F562D9F69b46b4227003E01525CB99344B72']" 'contracts/CoiniToken.sol:CoiniToken'
