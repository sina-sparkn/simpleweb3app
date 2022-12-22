// !new contract address: 0x8EFb69454B42FfA56aC499936E953C18E7983d64
const main = async () => {
  const [deployer] = await hre.ethers.getSigners();
  const accountBalance = await deployer.getBalance();

  console.log(`deploying contracts with account : ${deployer.address}`);
  console.log(`account balance: ${accountBalance.toString()}`);

  const wavecontractFactory = await hre.ethers.getContractFactory(
    "newContract"
  );
  const waveContract = await wavecontractFactory.deploy({
    value: hre.ethers.utils.parseEther("0.1"),
  });
  await waveContract.deployed();

  console.log(`Contract Address : ${waveContract.address}`);
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
