

import 'dart:convert';

import 'package:extensionapp/Utils/API.dart';
import 'package:extensionapp/Utils/Constant.dart';
import 'package:extensionapp/export.dart';
import 'package:trust_wallet_core_lib/trust_wallet_core_lib.dart';
import 'package:http/http.dart' as http;
import '../Utils/logger.dart';

// Future<double?> getTrxBalance(
//       CoinData coin, String meno, String address) async {
//     // final HDWallet wallet = HDWallet.createWithMnemonic(meno);
//     // final address = wallet.getAddressForCoin(TWCoinType.TWCoinTypeTron);

//     final channel = ClientChannelManager.getChannel(
//         coin.coinNetwork == NetworkType.TronTestnet
//             ? AppContant.trongrpc
//             : 'grpc.trongrid.io');
//     final stub = $t.WalletClient(channel);  
//     Uint8List originAddress = Base58.base58Decode(address)!.sublist(0, 21);

//     try {
//       $t.Account response =
//           await stub.getAccount($t.Account()..address = originAddress);

//       double trxBalance = response.balance.toDouble() / getPrecision(6);
//       Logger.logprint('trx balance == > $trxBalance');
//       return trxBalance;
//     } catch (e) {
//       Logger.logprint('FAiled ==22========>');
//       return 0.0;
//     }
//   }

//   Future<void> getAccountInfo() async {
//     var uri = Uri.parse(Api.baseURLTRN + Api.getAsset);
//     var response = await http.post(uri,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({
//           "address": "TZ4UXDV5ZhNW7fb2AMSbgfAEZ7hWsnYS2g",
//           //ConstantClass.wallet.toString(),
//           "visible": true,
//         }));
//  //   ConstantClass.assets.clear();
//     if (response.statusCode == 200) {

//       print("???????????   ");
//       final decodedResponse = json.decode(response.body);
//       setState(() {
//         var data = decodedResponse;
//         print("BBBB "+data.toString());
//         ConstantClass.USDPbalance = data.toString()=="{}"?"0.0": data['balance'].toString();
//         ConstantClass.assets.add(Asset_Collectibles(
//           img: CustomImages.tron,
//           coin_name: "USDP",
//           coin_cost:  "0.0",
//           coin_bal: ConstantClass.USDPbalance.toString(),
//           coin_rate: "0.0",
//         ));

//       });

//       // ConstantClass.totalTRX = data['totalAssetInTrx'].toStringAsFixed(3).toString();
//       print('API Response: ${ConstantClass.assets.length.toString()}');
//       // print('API Response: ${(data['balance'])}');
//       // ConstantClass.assets.add(Asset_Collectibles(
//       //  img: data[i]['tokenLogo'].toString(),
//       //  coin_name: data[i]['tokenAbbr'].toString(),
//       //  coin_cost: data[i]['tokenPriceInUsd'].toStringAsFixed(6),
//       //  coin_bal: data['balance'].toString(),
//       //  coin_rate: data[i]['assetInUsd'].toString(),
//       //  decimalval: data[i]['tokenDecimal'],
//       // ));

//     } else {
//       print('Failed to load account info. Error ${response.statusCode}');
//     }
//   }
