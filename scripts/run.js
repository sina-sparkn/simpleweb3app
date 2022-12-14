const main = async () => {
  const waveContractFactory = await hre.ethers.getContractFactory(
    "newContract"
  );
  const waveContract = await waveContractFactory.deploy();
  await waveContract.deployed();
  console.log(`contract deployed to : ${waveContract.address}`);

  // *testing the contract to see if it works or not

  const [ali, sina, oskol] = await hre.ethers.getSigners();

  // *run Salam function multiple times with different wallets

  let salam1 = await waveContract.connect(ali).Salam("ali", "lol");
  await salam1.wait();

  let salam2 = await waveContract.connect(sina).Salam("sina", "lol af");
  await salam2.wait();

  let salam3 = await waveContract
    .connect(oskol)
    .Salam("oskol", "not funny at all");

  await salam3.wait();

  let salam4 = await waveContract.connect(sina).Salam("sina", "again lol af");
  await salam4.wait();

  let allSalamkonha = await waveContract.getAllSalamkona();
  console.log(allSalamkonha);

  let allSalams = await waveContract.getTotalSalams();
  console.log(`all salams : ${allSalams}`);

  let aliCount = await waveContract.getUserSalams("ali");
  let sinaCount = await waveContract.getUserSalams("sina");
  let oskolCount = await waveContract.getUserSalams("oskol");

  console.log(`ali salams : ${aliCount}`);
  console.log(`sina salams : ${sinaCount}`);
  console.log(`oskol salams : ${oskolCount}`);
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
