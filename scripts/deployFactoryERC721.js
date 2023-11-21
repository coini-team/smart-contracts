const { ethers } = require("hardhat");

async function main() {
  const _collectionName = "Coini";
  const _collectionSymbol = "COI";

  const factory = await ethers.deployContract("FactoryERC721", [
    _collectionName,
    _collectionSymbol,
  ]);

  const factoryAddress = await factory.getAddress();
  console.log(`Address del Factory ERC721 es ${factoryAddress}`);

    if (!!process.env.HARDHAT_NETWORK && process.env.HARDHAT_NETWORK != "localhost") {
  
    var res = await factory.waitForDeployment();
     await res.deploymentTransaction().wait(10);

    await hre.run("verify:verify", {
        address: factoryAddress,
        constructorArguments: [_collectionName, _collectionSymbol],
        });
    }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  })
