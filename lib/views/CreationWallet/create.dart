import 'dart:convert';

import 'package:extensionapp/Blockchain/blockchain%20.dart';
import 'package:extensionapp/views/CreationWallet/backup_Mnemonic.dart';
import 'package:extensionapp/views/CreationWallet/wallet_Created_Success.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:hex/hex.dart';

import '../../Utils/Constant.dart';
import '../../Utils/Dimensions.dart';
import '../../Utils/customfonts.dart';

class Create_Wallet extends StatefulWidget {
  const Create_Wallet({super.key});

  @override
  State<Create_Wallet> createState() => _Create_WalletState();
}

class _Create_WalletState extends State<Create_Wallet> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController wallet_Controller = TextEditingController();
  TextEditingController pass_Controller = TextEditingController();
  TextEditingController repass_Controller = TextEditingController();
  bool? upper = false;
  bool? lower = false;
  bool? number = false;
  bool? complete = false;
  bool? load = false;

  createMnemonics() {
    ConstantClass.mnemonic =        bip39.generateMnemonic();
        //  Wallet().generateMnemonic();



    print("12-word mnemonic phrase: ${ConstantClass.mnemonic}");

    setState(() {
      load = false;
    });

      //  savedata(); 
  }

  @override
  void initState() {
    super.initState();
  }

  //   String hexToTronAddress(String hexAddress) {
  //   List<int> decodedHex = hex.decode(hexAddress);
  //   String base58Address = bs58check.encode(Uint8List.fromList(decodedHex));
  //   return base58Address;
  // }
  // void ChangeToPoxx(){
  //   String base58Address =  ConstantClass.walletBsc.toString();
  //   final Uint8List decodedBase58 = bs58check.decode(base58Address);
  //   final String encodedHex = HEX.encode(decodedBase58);
  //   print("===> $encodedHex");
  //   String hexAddress = encodedHex.replaceFirst(RegExp('4'), '3', 0);
  //   String hexAddress1 = hexAddress.replaceFirst(RegExp('1'), '7', 0);
  //   print(">>>>>>>>>>>>>   "+hexAddress1.toString());
  //    String address = hexToTronAddress(hexAddress1);
  //   setState(() {
  //     ConstantClass.fakewallet=address.toString();
  //   });

  //   savedata();
  // }

  @override
  void dispose() {
    wallet_Controller.clear();
    pass_Controller.clear();
    repass_Controller.clear();
    upper = false;
    lower = false;
    number = false;
    complete = false;
    load = false;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: CustomDimension.myheight(context) / 9,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,
                size: 32, color: Get.isDarkMode ? Colors.white : Colors.black)),
        centerTitle: true,
        title: CustomFonts.heading20(
            'Create Wallet', Get.isDarkMode ? Colors.white : Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: CustomDimension.mywidth(context) / 20,
            right: CustomDimension.mywidth(context) / 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              height: CustomDimension.myheight(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: CustomDimension.myheight(context) / 25,
                  ),
                  CustomFonts.text14(
                      "Name", Theme.of(context).textTheme.bodyLarge!.color!),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      padding: EdgeInsets.only(
                        // top: CustomDimension.myheight(context) / 120,
                        left: CustomDimension.myheight(context) / 35,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: Get.isDarkMode
                                ? Colors.grey.shade300
                                : Colors.black12),
                      ),
                      child: TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) return 'Enter valid Name';
                        },
                        controller: wallet_Controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Wallet",
                          hintStyle: TextStyle(
                            color: Get.isDarkMode
                                ? Colors.grey.shade300
                                : Colors.black12,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: CustomDimension.myheight(context) / 35,
                  ),
                  CustomFonts.text14("Set a password",
                      Get.isDarkMode ? Colors.white : Colors.black),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      padding: EdgeInsets.only(
                        // top: CustomDimension.myheight(context) / 120,
                        left: CustomDimension.myheight(context) / 35,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: Get.isDarkMode
                                ? Colors.grey.shade300
                                : Colors.black12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) return 'Enter Password';
                              },
                              controller: pass_Controller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Wallet",
                                hintStyle: TextStyle(
                                  color: Get.isDarkMode
                                      ? Colors.grey.shade300
                                      : Colors.black12,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                labelStyle: TextStyle(
                                  color: Get.isDarkMode
                                      ? Colors.grey.shade300
                                      : Colors.black12,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  RegExp regEx = new RegExp(r"(?=.*[A-Z])");
                                  RegExp regExL = new RegExp(r"(?=.*[a-z])");
                                  RegExp regExN = new RegExp(r"(?=.*?[0-9])");
                                  RegExp regExC = new RegExp(r".{8,}");

                                  upper = regEx.hasMatch(value);
                                  lower = regExL.hasMatch(value);
                                  number = regExN.hasMatch(value);
                                  complete = regExC.hasMatch(value);
                                });
                              }),
                        ],
                      )),
                  SizedBox(
                    height: CustomDimension.myheight(context) / 35,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check_circle,
                              color: upper == true
                                  ? Colors.green
                                  : Get.isDarkMode
                                      ? Colors.grey.shade300
                                      : Colors.black12),
                          SizedBox(
                            width: 15,
                          ),
                          CustomFonts.text12(
                              "Uppercase",
                              upper == true
                                  ? Colors.green
                                  : Get.isDarkMode
                                      ? Colors.grey.shade300
                                      : Colors.black12),
                        ],
                      ),
                      SizedBox(
                        width: CustomDimension.mywidth(context) / 4.6,
                      ),
                      Row(
                        children: [
                          Icon(Icons.check_circle,
                              color: lower == true
                                  ? Colors.green
                                  : Get.isDarkMode
                                      ? Colors.grey.shade300
                                      : Colors.black12),
                          SizedBox(
                            width: 15,
                          ),
                          CustomFonts.text12(
                              "Lowecase",
                              lower == true
                                  ? Colors.green
                                  : Get.isDarkMode
                                      ? Colors.grey.shade300
                                      : Colors.black12),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: CustomDimension.myheight(context) / 35,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check_circle,
                              color: number == true
                                  ? Colors.green
                                  : Get.isDarkMode
                                      ? Colors.grey.shade300
                                      : Colors.black12),
                          SizedBox(
                            width: 15,
                          ),
                          CustomFonts.text12(
                              "Number",
                              number == true
                                  ? Colors.green
                                  : Get.isDarkMode
                                      ? Colors.grey.shade300
                                      : Colors.black12),
                        ],
                      ),
                      SizedBox(
                        width: CustomDimension.mywidth(context) / 4,
                      ),
                      Row(
                        children: [
                          Icon(Icons.check_circle,
                              color: complete == true
                                  ? Colors.green
                                  : Get.isDarkMode
                                      ? Colors.grey.shade300
                                      : Colors.black12),
                          SizedBox(
                            width: 15,
                          ),
                          CustomFonts.text12(
                              "At least 8 character",
                              complete == true
                                  ? Colors.green
                                  : Get.isDarkMode
                                      ? Colors.grey.shade300
                                      : Colors.black12),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: CustomDimension.myheight(context) / 35,
                  ),
                  CustomFonts.text14("Reenter Password",
                      Get.isDarkMode ? Colors.white : Colors.black),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      // height: CustomDimension.myheight(context) / 15,
                      width: CustomDimension.myheight(context),
                      padding: EdgeInsets.only(
                        left: CustomDimension.myheight(context) / 35,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: Get.isDarkMode
                                ? Colors.grey.shade200
                                : Colors.grey.shade300),
                      ),
                      child: TextFormField(
                        validator: (val) {
                          if (val != pass_Controller.text.toString())
                            return 'Enter correct password';
                        },
                        controller: repass_Controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter the Password Again",
                          hintStyle: TextStyle(
                            color: Get.isDarkMode
                                ? Colors.grey.shade200
                                : Colors.grey.shade300,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          labelStyle: TextStyle(
                            color: Get.isDarkMode
                                ? Colors.grey.shade200
                                : Colors.grey.shade300,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),

      bottomSheet: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: InkWell(
          onTap: () {
            Get.to(BackUp_Mnemonic());
            createMnemonics();
            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Wallet_Created()),(Route route) => false);
            setState(() {
              ConstantClass.Name = wallet_Controller.text.toString();
              ConstantClass.password = pass_Controller.text.toString();
              load = true;
            });
            if (ConstantClass.imported == true) {
              //  ChangeToPoxx();
            } else {
              setState(() {});
            }

            if (_formKey.currentState!.validate() &&
                lower == true &&
                upper == true &&
                complete == true &&
                number == true) {
              Future.delayed(Duration(seconds: 2), () {
                createMnemonics();
                // Get.to( BackUp_Mnemonic());

                //    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>ConstantClass.imported==true?BottomNavBar(): Wallet_Created()),(Route route) => false);
              });
            } else {
              setState(() {
                load = false;
              });
            }
          },
          child: Container(
            height: CustomDimension.myheight(context) / 15,
            width: CustomDimension.myheight(context),
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                  color: Get.isDarkMode
                      ? Colors.grey.shade200
                      : Colors.grey.shade300),
            ),
            child: load == true
                ? LoadingAnimationWidget.threeRotatingDots(
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                    size: 30,
                  )
                : Center(
                    child: CustomFonts.text15(
                    "CREATE WALLET",
                    Get.isDarkMode ? Colors.black : Colors.white,
                  )),
          ),
        ),
      ),
    );
  }

  savedata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // await prefs.setString('privatekey', ConstantClass.privateKey.toString());
    await prefs.setString('seedPhrase', ConstantClass.mnemonic.toString());
    await prefs.setString('name', ConstantClass.Name.toString());
    await prefs.setString('password', ConstantClass.password.toString());
    // await prefs.setString('fakewallet', ConstantClass.fakewallet.toString());
    // await prefs.setBool('DontShowkeystore', false);
    // await prefs.setBool('DontShowprivate', false);
    // await prefs.setBool('DontShowmnemonic', false);
  }
}
