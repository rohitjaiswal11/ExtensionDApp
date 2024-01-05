import tronWeb from './TronWeb';



const privateKey = 'bbdfcf6d796105ad9ac4e8363e31d38cbf09c28181742cb4602f337460966d90';
const fullNode = 'https://api.trongrid.io';
const solidityNode = 'https://api.trongrid.io';
const eventServer = 'https://api.trongrid.io';

const tronWeb = new TronWeb(fullNode, solidityNode, eventServer, privateKey);

// Set the API key
tronWeb.setHeader({"TRON-PRO-API-KEY": '932fd94d-4f85-4127-b047-4bdf38b46d29'});

// Function to create a Tron account using mnemonics
export  async  function createAccountWithMnemonics() {
    try {
      // Wait for the TronWeb instance to be fully initialized
      await tronWeb.ready;
  
      // Generate a random Tron account
      const newAccount = tronWeb.createAccount();
  
      // Extract the mnemonics, private key, and public key from the generated account
      const { mnemonic, privateKey, publicKey } = newAccount;
  
      // Log the generated account information
      console.log("Generated Account:");
      console.log("Mnemonic:", mnemonic.phrase);
      console.log("Private Key:", privateKey);
      console.log("Public Key:", publicKey);
      console.log("Address:", tronWeb.address.fromPrivateKey(privateKey));
    } catch (error) {
      console.error("Error:", error);
    }
  }
  
