const main = async () => {
  const [owner, ali, mohammad] = await hre.ethers.getSigners();

  const waveContractFactory = await hre.ethers.getContractFactory(
    "newContract"
  );
  const waveContract = await waveContractFactory.deploy();
  await waveContract.deployed();
  console.log(`contract deployed to : ${waveContract.address}`);

  console.log(`Contract deployed by: ${owner.address}`);

  await waveContract.getTotalSalams();

  const ali1 = await waveContract.connect(ali).Salam("ali");
  await ali1.wait();
  const mohammad1 = await waveContract.connect(mohammad).Salam("mohammad");
  await mohammad1.wait();
  const ali2 = await waveContract.connect(ali).Salam("ali");
  await ali2.wait();
  const mohammad2 = await waveContract.connect(mohammad).Salam("mohammad");
  await mohammad2.wait();
  const mohammad3 = await waveContract.connect(mohammad).Salam("mohammad");
  await mohammad3.wait();

  await waveContract.getTotalSalams();
  await waveContract.getUserSalams("mohammad");
  await waveContract.getUserSalams("ali");
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
