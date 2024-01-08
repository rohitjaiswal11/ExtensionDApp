import "package:hex/hex.dart";
import 'package:bip39/bip39.dart' as bip39;
import 'package:convert/convert.dart';
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:wallet/wallet.dart' as wallet;
import 'package:web3dart/credentials.dart';

import '../Utils/Constant.dart';

class BlockchainGenerate {
  Future<void> importfunctionaddwallet(String mnemonics) async {
    List<String> _values = mnemonics.split(' ');

    bool isValid = bip39.validateMnemonic(mnemonics);
    if (isValid == true) {
      print("----valid mnemonics--------");

      String mnemonicsfetched = _values.join(' ');
      print(mnemonicsfetched);
      await walletaddresstron(mnemonicsfetched);
      await walletaddressBSc(mnemonicsfetched);
    } else {
      print("-----Invalid mnemonics--------");

      String mnemonicsfetched = _values.join(' ');
      await walletaddressBSc(mnemonicsfetched);
      await walletaddresstron(mnemonicsfetched);
    }
  }

  walletaddresstron(String mnemonicsprovided) async {
    final passphrase = '';
    try {
      final seed = await wallet.mnemonicToSeed(mnemonicsprovided.split(" "),
          passphrase: passphrase);
      final master = await wallet.ExtendedPrivateKey.master(seed, wallet.xprv);
      final root = await master.forPath("m/44'/195'/0'/0/0");

      final privateKey =
          wallet.PrivateKey((root as wallet.ExtendedPrivateKey).key);
      final publicKey = wallet.tron.createPublicKey(privateKey);
      final address = wallet.tron.createAddress(publicKey);

      final encodepublicKey = await HEX.encode(publicKey.value);

      final isValid = wallet.isValidTronAddress(address);

      if (isValid == true) {
        print(" ---------------Valid Tron-------------");
      }

      ConstantClass.genWalletTron = address.trim();
      ConstantClass.genPublicTron = encodepublicKey;
      ConstantClass.genprivateTron = privateKey.value.toString();
    } catch (e) {
      print(e);
    }
  }

  Future<void> walletaddressBSc(String mnemonic) async {
    final seed = bip39.mnemonicToSeedHex(mnemonic);
    List<int> seedBytes = hex.decode(seed.toString());
    KeyData master = await ED25519_HD_KEY.getMasterKeyFromSeed(seedBytes);
    String privateKey = HEX.encode(master.key);

    print('private BSc: $privateKey');

    print(" Master BSC-----" + hex.encode(master.key));
    print(hex.encode(master.chainCode));

    KeyData data =
        await ED25519_HD_KEY.derivePath("m/0'/2147483647'", seedBytes);
    print(hex.encode(data.key));
    print(hex.encode(data.chainCode));

    var pb = await ED25519_HD_KEY.getPublicKey(data.key);
    print("Public BSc-------------" + hex.encode(pb));

    ConstantClass.genPrivateBsc = hex.encode(data.key);
    String? pub = hex.encode(pb).toString();
    ConstantClass.genPublicBsc = pub.toString();

    print("PblcBSC  $pub");
    print("ConstantClass().genPublicBsc       " +
        ConstantClass.genPublicBsc.toString());

    getPublicAddress(privateKey);

    
  }

  Future getPublicAddress(String privateKey) async {
    final private = EthPrivateKey.fromHex(privateKey);
    final addressbsc =  private.address;

    String BscAddress = addressbsc.toString();
    ConstantClass.genwalletBsc = BscAddress;
    print('addressBSc: $BscAddress');
    print(" ConstantClass.genwalletBsc ${ ConstantClass.genwalletBsc }");
    return BscAddress;
  }
}
