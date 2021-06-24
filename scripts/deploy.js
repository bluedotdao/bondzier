// We require the Hardhat Runtime Environment explicitly here. This is optional 
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");
const ethers = hre.ethers;
const deployments = hre.deployments

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}
async function main() {
   const [deployer] = await hre.ethers.getSigners();

    console.log(
      "Deploying contracts with the account:",
      deployer.address
    );
    
    console.log("Account balance:", (await deployer.getBalance()).toString());

  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile 
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy
  const Bezier1155 = await hre.ethers.getContractFactory("Bondzier1155");
  const bezier1155 = await Bezier1155.deploy("");

  console.log("Bezier1155 deployed to:", bezier1155.address);
  const Bondzier = await hre.ethers.getContractFactory("Bondzier");
  //console.log(Bondzier.interface)
  let salt = hre.ethers.utils.formatBytes32String( 'Bondzier' ); 
  
  const bondzier = await Bondzier.deploy();

  await bondzier.deployed();

  console.log("Bondzier master contract deployed to:", bondzier.address);

  const BondzierFactory = await hre.ethers.getContractFactory("BondzierFactory");

  const bondzierfactory = await BondzierFactory.deploy(bondzier.address, bezier1155.address);

  console.log("Bondzier Factory deployed to:", bondzierfactory.address);
      bondzierfactory.on("BondzierCreated", function(){
        console.log(arguments)
      })
   console.log("Granting admin role to the bondzier factory contract address...")
      let role = await bezier1155.DEFAULT_ADMIN_ROLE()
      await bezier1155.grantRole(role, bondzierfactory.address)
      
      console.log("Deployer renouncing admin role....")
      await bezier1155.renounceRole(role, deployer.address)
      

//Creating


  let total = ethers.utils.parseUnits('4', 18)
      let r_start = ethers.utils.parseUnits('100', 18)
      let r_end = ethers.utils.parseUnits('150', 18)
      let p1x = ethers.utils.parseUnits('1', 18)
      let p1y = ethers.utils.parseUnits('160.47', 18)
      let p2x = ethers.utils.parseUnits('1', 18)
      let p2y = ethers.utils.parseUnits('177.80', 18)
      let amnt = 1;
      let timestamp2 = Math.round(Date.now()/1000) + 90 

      let text = "Hello World!";

      let bytes = ethers.utils.toUtf8Bytes(text);


      
   
      let predictedAddress = await bondzierfactory.predictAddress(salt)
      console.log('Predicted address for newly created bondzier contract: ', predictedAddress)

      console.log("Creating new bondzier contract...")
      let bb = await bondzierfactory.createBondzier(true, amnt, total,[r_start,p1x,p1y, p2x, p2y, r_end], deployer.address, timestamp2, "https://bondzier.io", salt, bytes, {
          gasLimit: 900000
      });
      let res = await bb.wait();
      let newBondzierAddress = res.events[0].args.newBondzierAddress; 
      console.log("Bondzier for token created at: ", newBondzierAddress);

      const _bondzier = new ethers.Contract(newBondzierAddress, Bondzier.interface, Bondzier.signer);
      
      let nextPrice = await _bondzier.nextPrice()
      console.log("Account balance:", (await deployer.getBalance()).toString());
      console.log("Buying item for", nextPrice.toString(), "wei")
      await _bondzier.buy({value : nextPrice})
      
      console.log("Account balance:", (await deployer.getBalance()).toString());
      nextPrice = await _bondzier.nextPrice()
      console.log("Buying item for:", nextPrice.toString(), "wei")
      await _bondzier.buy({value : nextPrice})
      
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
