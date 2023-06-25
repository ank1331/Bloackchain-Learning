const ethers = require("ethers");
const fs= require("fs");



async function main(){
    //http://127.0.0.1:7545
    const provider = new ethers.JsonRpcProvider("http://127.0.0.1:7545");
    const wallet = new ethers.Wallet("0x5b276fcd0d4afa6195fdc6028574caa7e8e4e57e3a3aea1e9ffa26121c7eea6f", provider);
    const abi = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf8");
    const binary = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.bin", "utf8");
    const contractFactory = new ethers.ContractFactory(abi, binary, wallet);
    console.log("Deploying Contract... Please Wait");
    const contract =  await contractFactory.deploy();
    const receipt = await contract.deploymentTransaction(1)
    // console.log("*************DeploymentTransaction************");
    // console.log(contract.deploymentTransaction)
    // console.log("*************RECEIPT*************");
    // console.log(receipt);
}

main()
.then(()=>process.exit(0))
.catch((error)=>{
    console.log(error);
    process.exit(1);
});
