import 'package:bip39/bip39.dart' as bip39;
import 'package:extensionapp/export.dart';
import 'package:extensionapp/Utils/common.dart';
import 'package:extensionapp/Utils/sharedpref.dart';

import "package:hex/hex.dart";
import 'package:wallet/wallet.dart' as wallet;
import 'package:wallet/wallet.dart';

class Wallet {


  String mnemonic = "";
  generateMnemonic() {
    // Generate a random BIP-39 mnemonic phrase with 12 words.
    mnemonic = bip39.generateMnemonic(strength: 128);
    print('Generated mnemonic phrase: $mnemonic');
    return mnemonic;
  }

       walletaddress(String mnemonicsprovided) {
   
    final passphrase = '';
    try{
      
      final seed =
          wallet.mnemonicToSeed(mnemonicsprovided.split(" "), passphrase: passphrase);
    final master = wallet.ExtendedPrivateKey.master(seed, wallet.xprv);
    final root = master.forPath("m/44'/195'/0'/0/0");

    final privateKey =
         wallet.PrivateKey((root as wallet.ExtendedPrivateKey).key);
    final publicKey =  wallet.tron.createPublicKey(privateKey);
    final address = wallet.tron.createAddress(publicKey);

    final encodepublicKey = HEX.encode(publicKey.value);
   //  privateKey.value;


    print('Wallet Address $address');
    print('private key ${privateKey.value}');
    print('Public Key $encodepublicKey');

    SharedPreferencesManager().writeString('publickey', address.toString());

    }catch(e){
      print(e);
    }
  }

  void getpublic(String privkey) {
    //privkey = SharedPreferencesManager().readString('importprivate').toString();

    BigInt bigIntpriv = BigInt.parse(privkey,radix: 16);
print("Big Int $bigIntpriv");
    // var importprivate=  SharedPreferencesManager().readString('importprivate');

    final genPublic = wallet.tron.createPublicKey(PrivateKey(bigIntpriv));
    final encodegenPublic = HEX.encode(genPublic.value);
print(" Generated Public  ${encodegenPublic} ");
Common.publicgenerated=encodegenPublic;
  //  return encodegenPublic;
  }
}



