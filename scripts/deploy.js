// *contract address : 0x58AB0e6c396071c5bf42496F8D0A341EAaCd520e
const main = async () => {
  const [deployer] = await hre.ethers.getSigners();
  const accountBalance = await deployer.getBalance();

  console.log(`deploying contracts with account ${deployer.address}`);
  console.log(`account balance: ${accountBalance.toString()}`);

  const wavecontractFactory = await hre.ethers.getContractFactory(
    "newContract"
  );
  const waveContract = await wavecontractFactory.deploy();
  await waveContract.deployed();

  console.log(
    `Contract deployed! this is its address : ${waveContract.address}`
  );
};

async function runMain() {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
}

runMain();
