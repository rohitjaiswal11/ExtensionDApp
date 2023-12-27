// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

// // import 'package:provider/casino_provider.dart';
// // import 'package:trust_pro/List%20Data/Coin.dart';
// // import 'package:trust_pro/Screens/addCustomToken.dart';
// // import 'package:trust_pro/Util/StorageManager.dart';
// // import 'package:trust_pro/Util/model/network_type.dart';
// // import 'package:trust_pro/getDynamicCoin/getDynamicCoin.dart';
// // import 'package:trust_pro/main.dart';

// String _Tron = "tron";
// String _Bsc = "bsc";
// String _ETh = "eth";

// class DynamicCoinModel {
//   final String CoinContractAddress;
//   final String CoinNetwork;

//   DynamicCoinModel({
//     required this.CoinContractAddress,
//     required this.CoinNetwork,
//   });
// }

// List<DynamicCoinModel> DynamicCoinList = [
//   // DynamicCoinModel(
//   //     CoinContractAddress: "TBahymZuf2waAqQvKiZMgimyYnS4XbdxaX",
//   //     CoinNetwork: _Tron),
//   // DynamicCoinModel(
//   //     CoinContractAddress: "TSSMHYeV2uE9qYH95DqyoCuNCzEL1NvU3S",
//   //     CoinNetwork: _Tron), DynamicCoinModel(
//   //     CoinContractAddress: "TSSMHYeV2uE9qYH95DqyoCuNCzEL1NvU3S",
//   //     CoinNetwork: _Tron),
//   //   DynamicCoinModel(
//   //     CoinContractAddress: "TN3W4H6rK2ce4vX9YnFQHwKENnHjoxb3m9",
//   //     CoinNetwork: _Tron),
//   // DynamicCoinModel(
//   //     CoinContractAddress: "0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c",
//   //     CoinNetwork: _Bsc),
//   // DynamicCoinModel(
//   //     CoinContractAddress: "0x6982508145454ce325ddbe47a25d4ec3d2311933",
//   //     CoinNetwork: _ETh),
// ];

// Future<void> getCoinDataDynamic() async {
//   Provider.of<CoinDetails>(globalKey.currentContext!, listen: false).allCoinList = [];
//   print("DynamicCoinList "+DynamicCoinList.length.toString());
//   for (var i = 0; i < DynamicCoinList.length; i++) {
//     if (DynamicCoinList[i].CoinNetwork == _Tron) {
//       print("tron --> ");
//       await tron(i);
//     } else if (DynamicCoinList[i].CoinNetwork == _Bsc) {
//       print("bsc --> ");
//       await bscScan(i);
//     } else if (DynamicCoinList[i].CoinNetwork == _ETh) {
//       print("eth --> ");
//       ethScan(i);
//     }
//   }
// }

// Future<String> tron(int i) async {
//   try {
//     var Url =
//         'https://api.trongrid.io/wallet/getcontract?value=${DynamicCoinList[i].CoinContractAddress.toString()}&visible=true';
//     final response = await http.get(Uri.parse(Url));
//     final data = jsonDecode(response.body);

//     if (response.statusCode.toString() == "200") {
//       log(data["name"].toString());
//       log(data["abi"]["entrys"].toString());

//       Provider.of<CoinDetails>(globalKey.currentContext!, listen: false)
//           .allCoinList
//           .add(CoinData(
//               coinNetwork: NetworkType.TRON,
//               web3HttpUrl: "",
//               coinID: "",
//               coinAbi: data["abi"]["entrys"],
//               coinName: data["name"].toString(),
//               coinImage: "",
//               coinSymbol: data["name"],
//               coindecimal: 9,
//               price: 0.00,
//               coinPercentage: 0.00,
//               isOnGecko: true,
//               graphData: emptyGraphData,
//               contractAddress: DynamicCoinList[i].CoinContractAddress));
//     } else {
//       print("enter in else ");
//     }

//     return "";
//   } catch (e, stack) {
//     print("e-> " + e.toString());
//     print("stack-> " + stack.toString());
//     throw e.toString();
//   }
// }

// Future<String> bscScan(int i) async {
//   print("bsc scan ");

//   var Url =
//       'https://api.bscscan.com/api?module=contract&action=getabi&address=${DynamicCoinList[i].CoinContractAddress}&apikey=${ConstantClass.bscTransactions_API_KEY}';
//   final response = await http.get(Uri.parse(Url));
//   final data = jsonDecode(response.body);

//   if (response.statusCode.toString() == "200") {
//     // log(data.toString());
//     // log(data["abi"]["entrys"].toString());

//     // Provider.of<CoinDetails>(globalKey.currentContext!,listen: false).allCoinList.add(CoinData(coinNetwork: NetworkType.TRON, web3HttpUrl: "", coinID: "", coinName: data["name"].toString(), coinImage: "", coinSymbol: data["name"], coindecimal: 9, price: 0.00, coinPercentage: 0.00, isOnGecko: true, graphData: emptyGraphData));
//   } else {
//     print("response " + response.statusCode.toString());
//   }

//   return "";
// }

// Future<String> ethScan(int i) async {
//   coinCekoCoin(address:DynamicCoinList[i].CoinContractAddress,network: DynamicCoinList[i].CoinNetwork );

//   print("bsc eth ");

//   var Url =
//       'https://api.etherscan.io/api?module=contract&action=getsourcecode&address=${DynamicCoinList[i].CoinContractAddress}&apikey=${ConstantClass.etherTransactions_API_KEY}';
//   final response = await http.get(Uri.parse(Url));
//   final data = jsonDecode(response.body);

//   if (response.statusCode.toString() == "200") {

//   } else {
//     print("response " + response.statusCode.toString());
//   }

//   return "";
// }



//  Future<void> coinCekoCoin({address,network}) async {


//   print("enter coinzeko ");
//   var  coinID;

//      try {
//        print("network "+" https://api.geckoterminal.com/api/v2/networks/$network/tokens/$address.toString()");
//        var request = http.Request(
//            'GET',
//            Uri.parse(
//                'https://api.geckoterminal.com/api/v2/networks/$network/tokens/$address'));
//        print(address);

//        // request.headers.addAll(headers);

//        http.StreamedResponse response = await request.send();

//        if (response.statusCode == 200) {
//          final res = await response.stream.bytesToString();
//          final data = jsonDecode(res);
//          print('data ---- $data');
//          if (data['data'] != null) {
//            final coinInfo = data['data']['attributes'];
//            var name = coinInfo['name'] ?? '';
//            var symbol = coinInfo['symbol'] ?? '';
//            var decimals = coinInfo['decimals'] ?? '';
//            coinID = coinInfo['coingecko_coin_id'];





//              final walletID =
//              ConstantClass.selectedWalletID.toString();
//              List<String> walletList = [];
//              final list =
//                  await StorageManager.readData(walletID) ?? [];
//              for (var i = 0; i < list.length; i++) {
//                walletList.add(list[i].toString());
//              }
// //  late NetworkCoin selectedNetwork;
//              print(walletList);
//              if (coinID != null) {
//                final coinData = await getCoinInfo(coinID!);

//                walletList.add(
//                    '{"network": "${network== "tron"?"TRON":network== "bsc"?"BSC":"Ethereum"}","coinID": "$coinID","coinContract": "${address}","coinName": "$name} ${network.toLowerCase().contains('test') ? 'Testnet' : ''}","coinSymbol": "${symbol}","coinDecimal": "${decimals}","coinImage": "${coinData['image']['large']}"}');
//              } else {
//                walletList.add(
//                    '{"network": "${network== "tron"?"TRON":network== "bsc"?"BSC":"Ethereum"}","coinContract": "${address}","coinName": "${address} ${network.toLowerCase().contains('test') ? 'Testnet' : ''}","coinSymbol": "${symbol}","coinDecimal": "${decimals}"}');
//              }
//            await StorageManager.deleteData(walletID.toString());
//        var data__ =    await StorageManager.readData((walletID.toString()));
//              print("data => "+data__.toString());
//            await StorageManager.saveData(walletID, walletList);

//         // Navigator.pushNamedAndRemoveUntil(context,
//         //     BottomNavigationBarScreen.id, (route) => false);

//         //
//            // Provider.of<CoinDetails>(globalKey.currentContext!, listen: false)
//            //     .allCoinList
//            //     .add(CoinData(
//            //     coinNetwork:network ==_ETh?  NetworkType.Ethereum :network ==_Tron?NetworkType.TRON:NetworkType.BSC,
//            //     web3HttpUrl: "",
//            //     coinID:coinID,
//            //     coinName:name.toString(),
//            //     coinAbi: "",
//            //     coinImage: "",
//            //     coinSymbol:symbol,
//            //     coindecimal: decimals,
//            //     price: 0.00,
//            //     coinPercentage: 0.00,
//            //     isOnGecko: true,
//            //     graphData: emptyGraphData,
//            //     contractAddress:address));
//          }

//        } else {
//          print('response.reasonPhrase -- ${response.reasonPhrase}');
//        }
//      } catch (e) {
//        log('Error --$e');
//        throw e;
//      }

//  }
// Future<Map<String, dynamic>> getCoinInfo(String coinId) async {
//   print("coin id --> "+coinId.toString());
//   final url = 'https://api.coingecko.com/api/v3/coins/$coinId';

//   final response = await http.get(Uri.parse(url));

//   if (response.statusCode == 200) {
//     final decodedResponse = jsonDecode(response.body);
//     print("--coinid-> "+decodedResponse.toString()  );
//     return decodedResponse;
//   } else {
//     throw Exception('Failed to retrieve coin information.');
//   }
// }