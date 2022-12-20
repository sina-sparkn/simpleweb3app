const main = async () => {
  const waveContractFactory = await hre.ethers.getContractFactory(
    "newContract"
  );
  const waveContract = await waveContractFactory.deploy({
    value: hre.ethers.utils.parseEther("1.0"),
  });
  await waveContract.deployed();
  console.log(`contract deployed to : ${waveContract.address}`);

  //!getting the balance of this contract
  let contractBalance = await hre.ethers.provider.getBalance(
    waveContract.address
  );

  console.log(
    "balance of contract :",
    hre.ethers.utils.formatEther(contractBalance)
  );

  let salam1 = await waveContract.Salam("lol af");
  await salam1.wait();

  let aftercontractBalance = await hre.ethers.provider.getBalance(
    waveContract.address
  );

  console.log(
    "after contract balance:",
    hre.ethers.utils.formatEther(aftercontractBalance)
  );

  let allSalams = await waveContract.getTotalSalams();
  console.log(allSalams);
};

async function runMain() {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
}

runMain();
