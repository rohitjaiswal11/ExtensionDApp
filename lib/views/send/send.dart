

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart';

import 'package:web3dart/web3dart.dart';

import 'package:extensionapp/Utils/customfonts.dart';
import 'package:extensionapp/Utils/dialogwidget.dart';
import 'package:extensionapp/views/home/home.dart';

import '../../Blockchain/blockchain .dart';
import '../../Utils/Constant.dart';
import '../../Utils/logger.dart';
import '../../Utils/snackbar.dart';
import '../../data/base/preferences.dart';
import '../home/tokenItem.dart';

class Send extends StatefulWidget {
  const Send({super.key});

  @override
  State<Send> createState() => _SendState();
}

bool backbool = false;
bool click = false;

 Token_Item? _coindata;
TextEditingController address = TextEditingController();
TextEditingController amount = TextEditingController();

class _SendState extends State<Send> {
  String transistionfee = "0.000";


  bool isValidEthereumAddress(String address) {
    final pattern = r'^0x[a-fA-F0-9]{40}$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(address);
  }

  bool isValidTronAddress(String address) {
    final pattern = r'^T[1-9A-HJ-NP-Za-km-z]{33}$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(address);
  }

  @override
  void initState() {
    // _coindata = Get.arguments as CoinData;
    if (ConstantClass.currentIndex == 0) {
      getFee();
    } else {
      //   selectnetwork = NetworkType.Tron;
    }
    setState(() {});
    super.initState();
  }

  getFee() async {
   getGasFee(AppContant.RpcBsctestnet).then((value) {
      transistionfee = value;
      setState(() {});
    });
  }



    Future<String> getGasFee(String url) async {
    var httpClient = Client();
    final client = Web3Client(
      url,
      httpClient,
    );

    final gasPrice = await client.getGasPrice();
    final finalPrice =
        gasPrice.getValueInUnit(EtherUnit.ether).toStringAsFixed(16);
    final estimatedGas = await client.estimateGas();

    String gasFee =
        (double.parse(finalPrice) * estimatedGas.toDouble()).toStringAsFixed(9);
    print("Gas Fee$gasFee");
    return gasFee;
  }
  static BigInt ConvertToUnit256(num amount) {
    // var amt=BigInt.from(10).pow(18)*BigInt.from(double.parse(amount.toString()));
    var amt = BigInt.from(double.parse(amount.toString()) * pow(10, 18));
    return amt;
  }
 
 
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //     Topbar(),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height / 40),
              child: Stack(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.white)),
                ),
                Center(
                  child: Text(
                    "Send to",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.to(MyHomePage());
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Container(
                child: TextField(
              controller: address,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter public address(0x) or ENS name',
                suffixIcon: IconButton(
                  onPressed: () {
                    _getClipboardText();
                  },
                  icon: Icon(Icons.paste),
                ),
                suffixIconColor: Colors.blue,
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            )),
            SizedBox(
              height: Get.height * 0.03,
            ),

            Align(
                alignment: Alignment.centerLeft,
                child: CustomFonts.text14("Amount", Colors.white)),
            SizedBox(
              height: Get.height * 0.03,
            ),

            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: Get.width * 0.7,
                    height: Get.height * 0.06,
                    // padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
                    child: TextField(
                      controller: amount,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Enter amount",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    )),
                Spacer(),
                Container(
                    //   width:Get.height * 0.06,
                    height: Get.height * 0.07,
                    padding: EdgeInsets.all(
                      10,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child:
                        Center(child: CustomFonts.Text16("Max", Colors.white))),
              ],
            ),

            SizedBox(
              height: Get.height * 0.03,
            ),

            Row(
              children: [
                CustomFonts.Text12(
                    "Estimated Fee :  " +
                        transistionfee.toString() +
                        "${ConstantClass.currentIndex == 0 ? " BNB" : " Trx"}",
                    Colors.white)
              ],
            ),
            SizedBox(
              height: Get.height * 0.06,
            ),
            btncustom(
              btntxt: "Send",
              BtnPressed: () {
                // Get.to(MyHomePage());
               // sendcoin();
                      // return;
                      if (address.text.isEmpty || amount.text.isEmpty) {
                        showCustomSnackBar(
                            message:
                                "Please fill ${address.text.isEmpty ? "Address" : "Amount"} fields");
                        return;
                      }
                      if (ConstantClass.currentIndex == 0) {
                        if (isValidEthereumAddress(address.text) == false) {
                          showCustomSnackBar(
                              message: "Invalid Receiver address",
                              isError: true);
                          return;
                        }
                        if (double.parse(transistionfee) >
                            double.parse(
                               Token_Item.Bsclist[0].balance.toString())) {
                          showCustomSnackBar(
                              message: "Insufficent gas fee.", isError: true);
                          return;
                        }
                        print( Token_Item.Tronlist[0].balance);
                        print(amount.text);
                        if (double.parse(amount.text) >
                            double.parse( Token_Item.Bsclist[0].balance
                                .toString())) {
                          showCustomSnackBar(
                              message: "Insufficent Balance.", isError: true);
                          return;
                        }
                        click = true;
                        setState(() {});
                        sendcoin();
                      } else {
                        if (isValidTronAddress(address.text) == false) {
                          showCustomSnackBar(
                              message: "Invalid Receiver address",
                              isError: true);
                          return;
                        }
                        if (double.parse(amount.text) >
                            double.parse( Token_Item.Tronlist[0].balance
                                .toString())) {
                          showCustomSnackBar(
                              message: "Insufficent Balance.", isError: true);
                          return;
                        }
                        click = true;
                        setState(() {});
                      sendcoin();
                      }
              },
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),

            // Container(
            //   height: Get.height / 2,
            //   child: ListView.separated(
            //       shrinkWrap: true,
            //       itemBuilder: (context, Index) {
            //         return InkWell(
            //             onTap: () {},
            //             child: Container(
            //               padding: const EdgeInsets.symmetric(horizontal: 10),
            //               child:

            //                Account(context),
            //             ));
            //       },
            //       separatorBuilder: ((context, index) {
            //         return SizedBox(
            //           height: Get.height / 100,
            //         );
            //       }),
            //       itemCount: 1),
            // )
          ],
        ),
      ),
    );
    
  }



  Future<void> sendcoin() async {
    String pvtkey =
        await SharedPreferenceClass.GetSharedData(ConstantClass.currentIndex==0?ConstantClass.privateKeyBsc.toString():ConstantClass.privateKeyTron.toString());
    String seedphared =
        await SharedPreferenceClass.GetSharedData("seedPhrase");

    if (ConstantClass.currentIndex == 0) {
      if (_coindata!.coinAbi == null) {
     Send_NavtiveCoin(
                privatekey: pvtkey,
                receiveraddress: address.text.toString(),
                amount: amount.text,
                url: AppContant.RpcBsctestnet)
            .then((value) {
          if (value["status"] == "Done") {
            click = false;
            Get.back();
            showCustomSnackBar(message: "Transitions Added");
          } else {
            click = false;
          }
          setState(() {});
        });
      } else {
      SendCoin_WithContrcact(
                Contractfile: _coindata!.coinAbi!,
                funcationname: 'transfer',
                Contactaddress: _coindata!.contractAddress.toString(),
                privatekey: pvtkey,
                receiveraddress: address.text,
                amount: amount.text,
                url: AppContant.RpcBsctestnet)
            .then((value) {
          if (value["status"] == "Done") {
            click = false;
            Get.back();
            showCustomSnackBar(message: "Transitions Added");
          } else {
            click = false;
          }
          setState(() {});
        });
      }
    }
    
    else {
      String seedphared =
          await SharedPreferenceClass.GetSharedData("seedPhrase") ??
              "";
      String pvtkey = await Blockchain().genartepvtkey(seedphared.split(" "));
      String walladdress = await SharedPreferenceClass.GetSharedData(
          AppContant.WalletaddresTron);

      if (_coindata!.coinAbi != null) {
        // AddressTron()
        //     .trc20Transfer(
        //         address: walladdress,
        //         toAddress: address.text,
        //         sendAmount: amount.text,
        //         coinData: _coindata!,
        //         seed: seedphared)
        //     .then((value) {
        //   if (value) {
        //     click = false;
        //     Get.back();
        //     showCustomSnackBar(message: "Transitions Added");
        //   } else {
        //     click = false;
        //   }
        //   setState(() {});
        // });
      } else {
        String seedphared =
            await SharedPreferenceClass.GetSharedData(AppContant.WalletSeed) ??
                "";
        String pvtkey =
            await Blockchain().genartepvtkey(seedphared.split(" "));
        String walladdress = await SharedPreferenceClass.GetSharedData(
            AppContant.WalletaddresTron);
        // AddressTron()
        //     .sendtron(
        //         address: walladdress,
        //         toAddress: address.text,
        //         sendAmount: amount.text,
        //         coinData: _coindata!,
        //         seed: seedphared)
        //     .then((value) {
        //   if (value) {
        //     click = false;
        //     Get.back();
        //     showCustomSnackBar(message: "Transitions Added");
        //   } else {
        //     click = false;
        //   }
        //   setState(() {});
        // });
        // // AddressTron().sendTRX(
        // //     walladdress, address.text, double.parse(amount.text), pvtkey);

        // // NEWApi().sendTRX(
        // //     walladdress, address.text, double.parse(amount.text), pvtkey);
      }
      Logger.logprint(pvtkey);
    }
  }



// BSC Sebnding
  Future<dynamic> Send_NavtiveCoin(
      {required String privatekey,
      required String receiveraddress,
      required String amount,
      required String url}) 
      async {
    //user address
    var credentials = EthPrivateKey.fromHex(privatekey);
    var walletaddress = await credentials.extractAddress();

    //Recevier address  convert
    final receiverwalletaddress = EthereumAddress.fromHex('$receiveraddress');

    //convert amount into stand
    final amt = EtherAmount.inWei(ConvertToUnit256(num.parse(amount)));

    print(
        "the Send coins input: wallet: $walletaddress  recevier: $receiverwalletaddress  $amt");
    var paramDic;
    try {
      var httpClient = Client();
      var ethClient = Web3Client(url, httpClient);
      final chainID = await ethClient.getChainId();
      final sendcoin = await ethClient.sendTransaction(
        credentials,
        Transaction(
          from: walletaddress,
          to: receiverwalletaddress,
          value: amt,
        ),
        chainId: chainID.toInt(),
        fetchChainIdFromNetworkId: false,
      );
      print("the coin done is response  $sendcoin");
      paramDic = {"status": "Done", "message": "$sendcoin"};
      return paramDic;
    } catch (e) {
      print("error" + e.toString());
    //  showCustomSnackBar(message: e.toString().toString(), isError: true);
      paramDic = {"status": "error", "message": "${e.toString()}"};
      return paramDic;
    }
  }



  Future<dynamic> SendCoin_WithContrcact(
      {required Object Contractfile,
      required String funcationname,
      required String Contactaddress,
      required String privatekey,
      required String receiveraddress,
      required String amount,
      required String url}) async {
    var paramDic;
    try {
      //user address
      var credentials = EthPrivateKey.fromHex(privatekey);
      var walletaddress = await credentials.extractAddress();

      //Recevier address  convert
      final receiverwalletaddress = EthereumAddress.fromHex('$receiveraddress');

      //Depoly contract
      final EthereumAddress contactAddr =
          EthereumAddress.fromHex('$Contactaddress');
      final contract = DeployedContract(
          ContractAbi.fromJson(jsonEncode(Contractfile), 'Usdt'), contactAddr);

      // extracting the functions
      final sendFunction = contract.function('$funcationname');

      //convert amount into stand
      final amt = ConvertToUnit256(num.parse(amount));

      print(
          "the Send coins input: wallet: $walletaddress  recevier: $receiverwalletaddress  $amt Contractadd: $Contactaddress");

      var httpClient = Client();
      var ethClient = Web3Client(url, httpClient);
      final chainID = await ethClient.getChainId();

      final sendcoin = await ethClient.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: contract,
          function: sendFunction,
          parameters: [receiverwalletaddress, amt],
          from: walletaddress,
        ),
        chainId: chainID.toInt(),
      );
      print("the coin done is response  $sendcoin");

      paramDic = {"status": "Done", "message": "$sendcoin"};
    } catch (e) {
      print("error" + e.toString());
     // showCustomSnackBar(message: e.toString().toString(), isError: true);
      paramDic = {"status": "error", "message": "${e.toString()}"};
      return paramDic;
    }
    return paramDic;
  }


// Tron Sending



  // Future<bool> trc20Transfer(
  //     {required String address,
  //     required String toAddress,
  //     required String sendAmount,
  //     required Token_Item coinData,
  //     required String seed})
  //      async {
  //   final channel = ClientChannelManager.getChannel(
  //       coinData.coinNetwork == NetworkType.TronTestnet
  //           ? AppContant.trongrpc
  //           : 'grpc.trongrid.io');
  //   final stub = $t.WalletClient(channel);
  //   final HDWallet wallet = HDWallet.createWithMnemonic(seed.toString());
  //   int coinType = TWCoinType.TWCoinTypeTron;
  //   final key = wallet.getKeyForCoin(coinType);
  //   final privateKey = hex.encode(key.data());
  //   final address = wallet.getAddressForCoin(coinType);
  //   //var privateKey = await genartepvtkey(seed.split(" "));
  //   print("key   $privateKey");

  //   try {
  //     $t.SmartContract response = await stub.getContract($t.BytesMessage()
  //       ..value =
  //           Base58.base58Decode(coinData.contractAddress!)!.sublist(0, 21));
  //     String abiCode = jsonEncode(response.abi.toProto3Json()).substring(10);
  //     abiCode = abiCode.substring(0, abiCode.length - 1);
  //     String functionName = 'transfer';
  //     AbiEntity abiEntity = AbiEntity.fromJson(
  //         response.abi.toProto3Json() as Map<String, dynamic>);

  //     List<String> inputList = [];
  //     if (abiEntity != null && abiEntity.entrys != null) {
  //       for (Entrys item in abiEntity.entrys!) {
  //         if (functionName == item.name) {
  //           if (item.inputs != null) {
  //             for (Inputs input in item.inputs!) {
  //               inputList.add(input.type!);
  //             }
  //           }
  //         }
  //       }
  //     }

  //     Uint8List methodID = abi.methodID(functionName, inputList);

  //     List<dynamic> params = [];
  //     String abiToAddress = getAbiTronAddress(toAddress);
  //     double amount =
  //         double.parse(sendAmount) * getPrecision(coinData.coindecimal);
  //     params.add(abiToAddress);
  //     params.add(amount.toStringAsFixed(0));
  //     Logger.logprint('params $params');
  //     Uint8List rawEncode = abi.rawEncode(inputList, params);
  //     Uint8List dataList = hexToBytes('a9059cbb' + bytesToHex(rawEncode));
  //     Logger.logprint(
  //         'dataList Data hex = > ${bytesToHex(methodID)} -- ${bytesToHex(rawEncode)}');

  //     String hexPrivateKey = privateKey;

  //     bool flag = await execute(
  //         stub, hexPrivateKey, address, coinData.contractAddress!, dataList, 0);
  //     if (flag) {
  //       showCustomSnackBar(message: "Sucess", isError: false);
  //     } else {
  //       //showCustomSnackBar(message: "failed", isError: false);
  //     }
  //     print(flag);
  //     return flag;
  //   } catch (e) {
  //     Logger.logprint(e.toString());
  //     return false;
  //   }
  // }







  void _getClipboardText() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);

    if (clipboardData != null && clipboardData.text != null) {
      setState(() {
        address.text = clipboardData.text!;
      });
    }
  }







  
}

class icon_txt_btn extends StatelessWidget {
  final String btn_name;
  final VoidCallback ontap;
  final btn_icon;

  icon_txt_btn({
    super.key,
    required this.btn_name,
    required this.btn_icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        children: [
          Icon(
            btn_icon,
            color: Colors.blue,
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            btn_name.toString(),
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
    );
  }
















  
}
