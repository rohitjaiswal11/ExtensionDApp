// import 'package:extensionapp/views/home/tokenItem.dart';

// class tron{


//   Future<bool> trc20Transfer(
//       {required String address,
//       required String toAddress,
//       required String sendAmount,
//       required Token_Item coinData,
//       required String seed}) async {
//     final channel = ClientChannelManager.getChannel(
//         coinData.coinNetwork == NetworkType.TronTestnet
//             ? AppContant.trongrpc
//             : 'grpc.trongrid.io');
//     final stub = $t.WalletClient(channel);
//     final HDWallet wallet = HDWallet.createWithMnemonic(seed.toString());
//     int coinType = TWCoinType.TWCoinTypeTron;
//     final key = wallet.getKeyForCoin(coinType);
//     final privateKey = hex.encode(key.data());
//     final address = wallet.getAddressForCoin(coinType);
//     //var privateKey = await genartepvtkey(seed.split(" "));
//     print("key   $privateKey");

//     try {
//       $t.SmartContract response = await stub.getContract($t.BytesMessage()
//         ..value =
//             Base58.base58Decode(coinData.contractAddress!)!.sublist(0, 21));
//       String abiCode = jsonEncode(response.abi.toProto3Json()).substring(10);
//       abiCode = abiCode.substring(0, abiCode.length - 1);
//       String functionName = 'transfer';
//       AbiEntity abiEntity = AbiEntity.fromJson(
//           response.abi.toProto3Json() as Map<String, dynamic>);

//       List<String> inputList = [];
//       if (abiEntity != null && abiEntity.entrys != null) {
//         for (Entrys item in abiEntity.entrys!) {
//           if (functionName == item.name) {
//             if (item.inputs != null) {
//               for (Inputs input in item.inputs!) {
//                 inputList.add(input.type!);
//               }
//             }
//           }
//         }
//       }

//       Uint8List methodID = abi.methodID(functionName, inputList);

//       List<dynamic> params = [];
//       String abiToAddress = getAbiTronAddress(toAddress);
//       double amount =
//           double.parse(sendAmount) * getPrecision(coinData.coindecimal);
//       params.add(abiToAddress);
//       params.add(amount.toStringAsFixed(0));
//       Logger.logprint('params $params');
//       Uint8List rawEncode = abi.rawEncode(inputList, params);
//       Uint8List dataList = hexToBytes('a9059cbb' + bytesToHex(rawEncode));
//       Logger.logprint(
//           'dataList Data hex = > ${bytesToHex(methodID)} -- ${bytesToHex(rawEncode)}');

//       String hexPrivateKey = privateKey;

//       bool flag = await execute(
//           stub, hexPrivateKey, address, coinData.contractAddress!, dataList, 0);
//       if (flag) {
//         showCustomSnackBar(message: "Sucess", isError: false);
//       } else {
//         //showCustomSnackBar(message: "failed", isError: false);
//       }
//       print(flag);
//       return flag;
//     } catch (e) {
//       Logger.logprint(e.toString());
//       return false;
//     }
//   }






// }