require("dotenv").config();
const { ethers } = require("hardhat");

async function main() {

    var [admin] = await ethers.getSigners();

    var contract = await ethers.deployContract("CoiniToken");

    console.log(`Address del contrato ${await contract.getAddress()}`);

    if (
        !!process.env.HARDHAT_NETWORK &&
        process.env.HARDHAT_NETWORK != "localhost"
      ) {
        // HARDHAT_NETWORK: mumbai
        // HARDHAT_NETWORK: $ npx hardhat --network [HARDHAT_NETWORK] run scripts/deploy.js
        var res = await contract.waitForDeployment();
        await res.deploymentTransaction().wait(10);
      }
    
      if (
        !!process.env.HARDHAT_NETWORK &&
        process.env.HARDHAT_NETWORK != "localhost"
      ) {
        await hre.run("verify:verify", {
          address: await contract.getAddress(),
          constructorArguments: [],
        });
      }

}

main();