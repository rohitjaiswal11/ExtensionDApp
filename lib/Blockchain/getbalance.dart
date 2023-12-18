

import 'package:extensionapp/export.dart';
import 'package:trust_wallet_core_lib/trust_wallet_core_lib.dart';

import '../Utils/logger.dart';

Future<double?> getTrxBalance(
      CoinData coin, String meno, String address) async {
    // final HDWallet wallet = HDWallet.createWithMnemonic(meno);
    // final address = wallet.getAddressForCoin(TWCoinType.TWCoinTypeTron);

    final channel = ClientChannelManager.getChannel(
        coin.coinNetwork == NetworkType.TronTestnet
            ? AppContant.trongrpc
            : 'grpc.trongrid.io');
    final stub = $t.WalletClient(channel);  
    Uint8List originAddress = Base58.base58Decode(address)!.sublist(0, 21);

    try {
      $t.Account response =
          await stub.getAccount($t.Account()..address = originAddress);

      double trxBalance = response.balance.toDouble() / getPrecision(6);
      Logger.logprint('trx balance == > $trxBalance');
      return trxBalance;
    } catch (e) {
      Logger.logprint('FAiled ==22========>');
      return 0.0;
    }
  }