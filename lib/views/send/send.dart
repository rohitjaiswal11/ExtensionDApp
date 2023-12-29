import 'package:extensionapp/Blockchain/blockchain%20.dart';


import 'package:extensionapp/Utils/customfonts.dart';
import 'package:extensionapp/Utils/dialogwidget.dart';

import 'package:extensionapp/views/home/home.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../Blockchain/Address.dart';
import '../../Blockchain/Dapp Setup/trin/addressTron.dart';
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
  var _address = Address();

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
    _address.getGasFee(AppContant.RpcBsctestnet).then((value) {
      transistionfee = value;
      setState(() {});
    });
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
                      //  sendcoin();
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
                        //sendcoin();
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



  // Future<void> sendcoin() async {
  //   String pvtkey =
  //       await SharedPreferenceClass.GetSharedData(ConstantClass.currentIndex==0?ConstantClass.privateKeyBsc.toString():ConstantClass.privateKeyTron.toString());
  //   String seedphared =
  //       await SharedPreferenceClass.GetSharedData("seedPhrase");

  //   if (ConstantClass.currentIndex == 0) {
  //     if (_coindata!.coinAbi == null) {
  //       _address.Send_NavtiveCoin(
  //               privatekey: pvtkey,
  //               receiveraddress: address.text.toString(),
  //               amount: amount.text,
  //               url: AppContant.RpcBsctestnet)
  //           .then((value) {
  //         if (value["status"] == "Done") {
  //           click = false;
  //           Get.back();
  //           showCustomSnackBar(message: "Transitions Added");
  //         } else {
  //           click = false;
  //         }
  //         setState(() {});
  //       });
  //     } else {
  //       _address.SendCoin_WithContrcact(
  //               Contractfile: _coindata!.coinAbi!,
  //               funcationname: 'transfer',
  //               Contactaddress: _coindata!.contractAddress.toString(),
  //               privatekey: pvtkey,
  //               receiveraddress: address.text,
  //               amount: amount.text,
  //               url: AppContant.RpcBsctestnet)
  //           .then((value) {
  //         if (value["status"] == "Done") {
  //           click = false;
  //           Get.back();
  //           showCustomSnackBar(message: "Transitions Added");
  //         } else {
  //           click = false;
  //         }
  //         setState(() {});
  //       });
  //     }
  //   }
    
  //   else {
  //     String seedphared =
  //         await SharedPreferenceClass.GetSharedData("seedPhrase") ??
  //             "";
  //     String pvtkey = await Blockchain().genartepvtkey(seedphared.split(" "));
  //     String walladdress = await SharedPreferenceClass.GetSharedData(
  //         AppContant.WalletaddresTron);

  //     if (_coindata!.coinAbi != null) {
  //       AddressTron()
  //           .trc20Transfer(
  //               address: walladdress,
  //               toAddress: address.text,
  //               sendAmount: amount.text,
  //               coinData: _coindata!,
  //               seed: seedphared)
  //           .then((value) {
  //         if (value) {
  //           click = false;
  //           Get.back();
  //           showCustomSnackBar(message: "Transitions Added");
  //         } else {
  //           click = false;
  //         }
  //         setState(() {});
  //       });
  //     } else {
  //       String seedphared =
  //           await SharedPreferenceClass.GetSharedData(AppContant.WalletSeed) ??
  //               "";
  //       String pvtkey =
  //           await Blockchain().genartepvtkey(seedphared.split(" "));
  //       String walladdress = await SharedPreferenceClass.GetSharedData(
  //           AppContant.WalletaddresTron);
  //       AddressTron()
  //           .sendtron(
  //               address: walladdress,
  //               toAddress: address.text,
  //               sendAmount: amount.text,
  //               coinData: _coindata!,
  //               seed: seedphared)
  //           .then((value) {
  //         if (value) {
  //           click = false;
  //           Get.back();
  //           showCustomSnackBar(message: "Transitions Added");
  //         } else {
  //           click = false;
  //         }
  //         setState(() {});
  //       });
  //       // AddressTron().sendTRX(
  //       //     walladdress, address.text, double.parse(amount.text), pvtkey);

  //       // NEWApi().sendTRX(
  //       //     walladdress, address.text, double.parse(amount.text), pvtkey);
  //     }
  //     Logger.logprint(pvtkey);
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
