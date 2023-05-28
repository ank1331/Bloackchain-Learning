//const { log } = require("console")
const {ethers} = require("ethers");
const fs = require("fs");
require("dotenv").config();



async function main(){
    //http://127.0.0.1:7545

    //STEP ---- 1 -------------- Block chain se connect karo
    //***********Blockchain se connect karna and wallet for sigining any transcation ke liye neche vali do line ******************//
    // use package ethers
    // yeh vali line se apni script connect hoti hai blockchain se
    const provider = new ethers.JsonRpcProvider(process.env.RPC_URL) 
    //  wallet and private key setup karna hai
    const wallet  = new ethers.Wallet(process.env.PRIVATE_KEY, provider)
    //***************************************************************/

    //STEP ---- 2 ----------------------- mujhe contract ko use karna hai
    // use package fs
    // utf8 encoding for the file
    const abi = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf8");
    const binary = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.bin", "utf8");


    // STEP ---- 3 --- mujhe contract contract create karni hai, 
    // what is contract factory - ek object jo contract ko deploy karne mai kaam
    // aata hai

    const contractFactory = new ethers.ContractFactory(abi, binary, wallet);
    console.log("Deploying Contract --- please wait");

    // Yeh await ka matlab kitna isse deply hone de
    const contract  = await contractFactory.deploy();
    await contract.deploymentTransaction()
    // mai yeh upar vale deploy  function mai gas price, gas limit de sakta hoon
    // const contract  = await contractFactory.deploy({gasLimit:100000000});
    //console.log(contract);
    // agar hum chate hi hume atleat ek block lage uske baad hi bataye yeh ki bhai sab sahi hai
    // 1 ka matlab 1 block transction ka wait
    //const deploymentReceipt = await provider.waitForTransaction(contract.deploymentTransaction.hash,1)

    //console.log("lets deply with only transction data");
    // const tx = {
    //     nonce: 8,
    //     gasPrice: "20000000000",
    //     gasLiit: 1000000,
    //     to: null,
    //     value: 0,
    //    data: yeh abi value aayegi file se 
    //     chainId: 35777,
    // };
    // const sentTxnResponse = await wallet.sendTransaction(tx)
    // await sentTxnResponse.wait(1)
    // console.log(SignedResponse);

    // STEP ---- 4 ---- abb apan voh functions ko call karte hai jinke sath interact karna hai

    const currentFavouriteNumber = await contract.retrieve();
    console.log(`Current Favourite Number: ${currentFavouriteNumber.toString()}`);

    const transctionResponse = await contract.store("8");
    const transctionReceipt = await transctionResponse.wait(1);
    const updatedFavnumber = await contract.retrieve();
    console.log(`Updated Favourite Number: ${updatedFavnumber}`);
}

main()
    .then(()=> process.exit(0))
    .catch((error) =>{
        console.error(error);
        process.exit(1);
    });
