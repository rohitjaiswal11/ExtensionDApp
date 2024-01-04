import 'dart:ui';

import 'package:extensionapp/Utils/customfonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/Colors copy.dart';
import '../../Utils/Constant.dart';
import '../../Utils/snackbar.dart';
import '../../Utils/word_truncate.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  void init() {
    getdata();

    super.initState();
  }


  getdata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    ConstantClass.walletBsc = prefs.getString('walletBsc');
    ConstantClass.walletTron = prefs.getString('walletTron');
    ConstantClass.privateKeyBsc = prefs.getString('privatekeyBsc');
    ConstantClass.privateKeyTron = prefs.getString('privatekeyTron');
    ConstantClass.publicKeyBsc = prefs.getString('publickeyBsc');
    ConstantClass.publicKeyTron = prefs.getString('publickeyTron');
    ConstantClass.Name = prefs.getString('name');
    ConstantClass.mnemonic = prefs.getString('seedPhrase');
    ConstantClass.password = prefs.getString('password');
    ConstantClass.fakewallet = prefs.getString('fakewallet');

    print("Text in " + "${ConstantClass.walletBsc}");
    print("Get Wallet Constanrt class executed");
  }

  bool bscpriv = false;
  bool trnpriv = false;

  @override
  Widget build(BuildContext context) {
  List<String> mimonic = ConstantClass.mnemonic.toString().split(" ");
 String cliptext = mimonic.toString().replaceAll('[', '').replaceAll(']', '');
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    "Account Detail",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
              child: CustomFonts.Text16(
                  "Name:  ${ConstantClass.Name}", Colors.white),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
              child: Container(
                padding: EdgeInsets.all(8),
                height: Get.height * 0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                //BSC chain
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/bsc.png",
                          height: 20,
                        ),
                        title: CustomFonts.text12("BSC Chain", Colors.white),
                      ),
                    ),
                    Row(children: [
                      CustomFonts.text14("Wallet Address :", Colors.white),
                      Flexible(
                        child: Text(
                          ConstantClass.walletBsc.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade700),
                        ),
                      ),
                    ]),
                    SizedBox(
                      width: Get.height * 0.2,
                    ),
                    Row(
                      children: [
                        CustomFonts.text14("Public Key :", Colors.white),
                        Flexible(
                          child: Text(
                            ConstantClass.publicKeyBsc.toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade700),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: Get.width * 0.9,
                      child: Row(children: [
                        CustomFonts.text14("Private Key:", Colors.white),
                        Flexible(
                          child: Text(
                            "${bscpriv ? ConstantClass.privateKeyBsc.toString() : '*************************************'}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade700),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              bscpriv = !bscpriv;
                            });
                          },
                          icon: Icon(
                            bscpriv ? Icons.visibility : Icons.visibility_off,
                            color: Colors.white,
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
              child: Container(
                padding: EdgeInsets.all(8),
                height: Get.height * 0.27,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                //Tron chain
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/tron.png",
                          height: 20,
                        ),
                        title: CustomFonts.text12("Tron Chain", Colors.white),
                      ),
                    ),
                    Row(children: [
                      CustomFonts.text14("Wallet Address : ", Colors.white),
                      Flexible(
                        child: Text(
                          ConstantClass.walletTron.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade700),
                        ),
                      ),
                    ]),
                    SizedBox(
                      width: Get.height * 0.2,
                    ),
                    Row(
                      children: [
                        CustomFonts.text14("Public Key : ", Colors.white),
                        Flexible(
                          child: Text(
                            ConstantClass.publicKeyTron.toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade700),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: Get.width * 0.9,
                      child: Row(children: [
                        CustomFonts.text14("Private Key:", Colors.white),
                        Flexible(
                          child: Text(
                            "${trnpriv ? ConstantClass.privateKeyTron.toString() : '*************************************'}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 12),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              trnpriv = !trnpriv;
                            });
                          },
                          icon: Icon(
                            trnpriv ? Icons.visibility : Icons.visibility_off,
                            color: Colors.white,
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Center(
              child: InkWell(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Show Mnemonics",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          //   height: Get.height * 0.5,
                          child: Dialog(
                            alignment: Alignment.center,
                            shadowColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.black87,
                                ),
                                height: Get.height * 0.6,
                                child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomFonts.heading16(
                                            "Mnemoinics", Colors.white),
                                        SizedBox(
                                          height: Get.height * 0.04,
                                        ),
                                        GridView.count(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 15,
                                          crossAxisSpacing: 15,
                                          childAspectRatio: (1 / .4),
                                          shrinkWrap: true,
                                          children: List.generate(
                                              mimonic.length, (index) {
                                            return Container(
                                                height: Get.height * 0.01,
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                ),
                                                child: Stack(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  children: [
                                                    Center(
                                                        child: CustomFonts
                                                            .text14600(
                                                                mimonic[index],
                                                                Colors.white)),
                                                    CustomFonts.heading20(
                                                        (index + 1).toString(),
                                                        Colors.grey)
                                                  ],
                                                ));
                                          }),
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.03,
                                        ),
                                        InkWell(
                                          onTap: () { Clipboard.setData(ClipboardData(text: cliptext));
                                            showCustomSnackBar(
                                                message: "Mnemonics Copied");
                        
                        
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade800,
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              "Copy",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ))),
                          ),
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
