import 'package:bip39/bip39.dart' as bip39;
import 'package:convert/convert.dart';
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:extensionapp/export.dart';
import 'package:extensionapp/Utils/common.dart';
import 'package:extensionapp/Utils/sharedpref.dart';
import 'package:hd_wallet/hd_wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:hex/hex.dart";
import 'package:wallet/wallet.dart' as wallet;
import 'package:web3dart/credentials.dart';

import '../Utils/Constant.dart';
import '../Utils/logger.dart';

class Blockchain {
  String mnemonic = "";

  Future<String> generateMnemonic() async {
    mnemonic = bip39.generateMnemonic();
    print('Generated mnemonic phrase: $mnemonic');
    return mnemonic;
  }

  Future<void> walletaddressBSc(String mnemonic) async {
    try {
      final seed = bip39.mnemonicToSeedHex(mnemonic);
      List<int> seedBytes = hex.decode(seed.toString());
      KeyData master = await ED25519_HD_KEY.getMasterKeyFromSeed(seedBytes);
      String privateKey = HEX.encode(master.key);

      print('private   BSc: $privateKey');
      print(" Master BSC-----" + hex.encode(master.key));
      print(hex.encode(master.chainCode));

      KeyData data = await ED25519_HD_KEY.derivePath("m/0'/2147483647'", seedBytes);
      print(hex.encode(data.key));
      print(hex.encode(data.chainCode));

      var pb = await ED25519_HD_KEY.getPublicKey(data.key);
      print("Public BSc-------------" + hex.encode(pb));

      ConstantClass.privateKeyBsc = hex.encode(data.key);
      String? pub = hex.encode(pb).toString();
      ConstantClass.publicKeyBsc = pub;
      print("PblcBSC  $pub");

      await getPublicAddress(privateKey);
    } catch (e) {
      print('Error in walletaddressBSc: $e');
    }
  }

  Future<void> walletaddresstron(String mnemonicsprovided) async {
    final passphrase = '';
    try {
      final seed = await wallet.mnemonicToSeed(mnemonicsprovided.split(" "), passphrase: passphrase);
      final master = await wallet.ExtendedPrivateKey.master(seed, wallet.xprv);
      final root = await master.forPath("m/44'/195'/0'/0/0");

      final privateKey = wallet.PrivateKey((root as wallet.ExtendedPrivateKey).key);
      final publicKey = wallet.tron.createPublicKey(privateKey);
      final address = wallet.tron.createAddress(publicKey);

      final encodepublicKey = await HEX.encode(publicKey.value);

      final isValid = await wallet.isValidTronAddress(address);

      if (isValid == true) {
        print(" ---------------Valid Tron-------------");
      }

      ConstantClass.walletTron = address;
      ConstantClass.publicKeyTron = encodepublicKey;
      ConstantClass.privateKeyTron = privateKey.value.toString();

      print("ADDress  $address");
      print('Wallet Address ${ConstantClass.walletTron}');
      print('private key ${ConstantClass.privateKeyTron}');
      print('Public Key ${ConstantClass.publicKeyTron}=');
    } catch (e) {
      print('Error in walletaddresstron: $e');
    }
  }

  void getpublic(String privkey) {
    try {
      privkey = SharedPreferencesManager().readString('importprivate').toString();
      BigInt bigIntpriv = BigInt.parse(privkey, radix: 16);
      print("Big Int $bigIntpriv");

      final genPublic = wallet.tron.createPublicKey(wallet.PrivateKey(bigIntpriv));
      ConstantClass.walletimport = wallet.tron.createAddress(genPublic);
      print("||||||||||||||||||  ${ConstantClass.walletimport}");

      final encodegenPublic = HEX.encode(genPublic.value);
      print(" Generated Public  ${encodegenPublic} ");

      Common.publicgenerated = encodegenPublic;
    } catch (e) {
      print('Error in getpublic: $e');
    }
  }

  Future<void> getPublicAddress(String privateKey) async {
    try {
      final private = EthPrivateKey.fromHex(privateKey);
      final address = await private.extractAddress();

      String BscAddress = address.toString();
      ConstantClass.walletBsc = BscAddress;
      print('addressBSc: $BscAddress');
    } catch (e) {
      print('Error in getPublicAddress: $e');
    }
  }

  String generatePrivateKey(List<String> phase) {
    try {
      final passphrase = '';
      final seed = wallet.mnemonicToSeed(phase, passphrase: passphrase);
      final master = wallet.ExtendedPrivateKey.master(seed, wallet.xprv);
      final root = master.forPath("m/44'/195'/0'/0/0");
      print("keyBIh ${(root as wallet.ExtendedPrivateKey).key}");
      final privateKey = wallet.PrivateKey((root as wallet.ExtendedPrivateKey).key);
      final publicKey = wallet.tron.createPublicKey(privateKey);
      final address = wallet.tron.createAddress(publicKey);
      String hexString = BigInt.parse(privateKey.value.toString()).toRadixString(16);

      if (hexString.length < 64) {
        hexString = hexString.padLeft(64, '0');
      }
      Logger.logprint("key ${hexString.toUpperCase()}");
      // TRON private keys are typically in uppercase

      return hexString.toUpperCase();
    } catch (e) {
      print('Error in generatePrivateKey: $e');
      return ''; // Or handle the error accordingly
    }
  }
}
