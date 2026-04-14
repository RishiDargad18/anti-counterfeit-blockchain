const hre = require("hardhat");

async function main() {
  const Contract = await hre.ethers.getContractFactory("ProductAuth");
  const contract = await Contract.deploy();
  await contract.waitForDeployment();

  console.log("Deployed to:", contract.target);
}

main();