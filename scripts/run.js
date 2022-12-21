const main = async () => {
  const [owner, sina, ali] = await hre.ethers.getSigners();

  const waveContractFactory = await hre.ethers.getContractFactory(
    "ContractTest"
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

  let salam1 = await waveContract.connect(sina).Salam("test message 1");
  await salam1.wait();

  let salam2 = await waveContract.connect(owner).Salam("test message 2");
  await salam2.wait();

  let salam3 = await waveContract.connect(sina).Salam("test message 3");
  await salam3.wait();

  let salam4 = await waveContract.connect(ali).Salam("test message 4");
  await salam4.wait();

  let aftercontractBalance = await hre.ethers.provider.getBalance(
    waveContract.address
  );

  let sinabalance = await sina.getBalance();
  console.log(hre.ethers.utils.formatEther(sinabalance));

  console.log(
    "after contract balance:",
    hre.ethers.utils.formatEther(aftercontractBalance)
  );

  let allSalams = await waveContract.getTotalSalams();
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
