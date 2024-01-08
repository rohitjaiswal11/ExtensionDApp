// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';
import 'dart:convert';
import 'dart:js_interop_unsafe';

import 'package:extensionapp/Blockchain/blockchain%20.dart';
import 'package:extensionapp/Utils/Constant.dart';
import 'package:extensionapp/Utils/common.dart';
import 'package:extensionapp/Utils/sharedpref.dart';
import 'package:flutter/material.dart';

import 'package:extensionapp/export.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Blockchain/generate.dart';

// ignore: must_be_immutable
class DialogCustom extends StatefulWidget {
  var cheight;
  var cwidth;
  String titletxt;
  String? hnttxt;
  String? txtfieldname;
  Color? btncolor;
  int? impvalue;
  Widget? w1;
  Widget? suffixwidget;

//  GestureTapCallback? BtnPressed;

  TextEditingController? mytextController;

  DialogCustom({
    Key? key,
    this.cheight,
    this.cwidth,
    required this.titletxt,
    this.hnttxt,
    this.txtfieldname,
    this.btncolor,
    this.w1,
    this.suffixwidget,
    this.impvalue,
    this.mytextController,
  }) : super(key: key);

  @override
  State<DialogCustom> createState() => _DialogCustomState();
}

class _DialogCustomState extends State<DialogCustom> {
  // TextEditingController mytextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    // Clean up the controller when the widget is disposed.
    widget.mytextController?.dispose();
    // super.dispose();
  }

  // var items = ["Private key", "Json File"];
  // String dropdownvalue = "Private key";

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Dialog(
            alignment: Alignment.topCenter,
            child: Container(
                color: Colors.black87,
                height: Get.height * 0.8,
                width: widget.cwidth ?? Get.width / 0.7,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                        child: Column(
                      //  mainAxisAlignment:MainAxisAlignment.,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.back(result: true);
                              },
                              icon:
                                  Icon(Icons.arrow_back_ios, color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              widget.titletxt,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                Get.back();
                                Get.to(MyHomePage());
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
      
                        SizedBox(
                          height: Get.height / 20,
                        ),
      
                        // SizedBox(
                        //   height: Get.height / 20,
                        // ),
      
                        if (widget.impvalue == 1)
                          Column(
                            children: [
                              Text(
                                'Imported accounts won’t be associated with your MetaMask Secret Recovery Phrase. Learn more about imported accounts ',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: Get.height / 20,
                              ),
      
                              //   Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Text(
                              //         'Select Type',
                              //         style: TextStyle(
                              //             color: Colors.white, fontSize: 15),
                              //       ),
                              //       //   Spacer(),
                              //       Container(
                              //         width: Get.width / 4,
                              //         decoration: BoxDecoration(
                              //             border: Border.all(color: Colors.white),
                              //             borderRadius: BorderRadius.circular(10)),
                              //         child:
      
                              //          DropdownButton(
                              //           // Initial Value
                              //           value: dropdownvalue,
                              //  // Down Arrow Icon
                              //           icon: const Icon(Icons.keyboard_arrow_down),
      
                              //           // Array list of items
                              //           items: items.map((String items) {
      
                              //             return DropdownMenuItem(
                              //               value: items,
                              //               child: Text(items),
                              //             );
      
                              //           }).toList(),
      
                              //           // After selecting the desired option,it will
                              //           // change button value to selected value
                              //           onChanged: (String? newValue) {
                              //             setState(() {
                              //               dropdownvalue = newValue!;
                              //             });
                              //           },
                              //         ),
      
                              //       )
                              //     ],
                              //   ),
      
                              // Sizeconst dBox(
                              //   height: Get.height / 20,
                              // ),
                            ],
                          ),
      
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.txtfieldname.toString(),
                              style: TextStyle(color: Colors.white, fontSize: 13),
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: Get.height / 12,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              value;
                              if (widget.impvalue == 1) {
                                Common.privatekeytxt = value;
                                print("private key name $value");
                                setState(
                                  () {
                                    Common.privatekeytxt = value;
                                    print(
                                        " Common.privatekeytxt  ${Common.privatekeytxt} ");
                                  },
                                );
                              }
                              print("import wallet account name $value");
                              setState(
                                () {
                                  Common.txtaccountglobal = value;
                                  print(
                                      "import wallet  Common.txtaccountglobal  ${Common.txtaccountglobal} ");
                                },
                              );
                            },
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Poppins'),
                            controller: widget.mytextController,
                            decoration: InputDecoration(
                              suffixIcon: widget.suffixwidget,
                              //                suffixIcon: IconButton(
                              //   onPressed: () {
                              //     _getClipboardText();
                              //   },
                              //   icon: Icon(Icons.paste),
                              // ),
                              suffixIconColor: Colors.blue,
                              hintText: widget.hnttxt,
                              
                              //   suffixIcon: Icon(Icons.qr_code),
      
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade400),
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
                          ),
                        ),
                        SizedBox(
                          height: Get.height / 20,
                        ),
                        if (widget.impvalue == 1)
                          btncustom(
                              btntxt: "Add Wallet",
                              btncolor: Colors.blue,
                              BtnPressed: () {
                                ConstantClass.last_accountlist =
                                    ConstantClass.last_accountlist + 1;
      
                                BlockchainGenerate()
                                    .importfunctionaddwallet(
                                        widget.mytextController!.text.toString())
                                    .then((value) => addAccountitem())
                                    .then((value) => _saveDataAccount());
      
                                print(
                                    "=====================================================");
      
                                // Get.to(MyHomePage());
                              }),
                        SizedBox(
                          child: widget.w1,
                        )
                      ],
                    ))))),
      );
    });
  }

  void _getClipboardText() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);

    if (clipboardData != null && clipboardData.text != null) {
      setState(() {
        widget.mytextController!.text = clipboardData.text!;
      });
    }
  }

  Future<void> addAccountitem() async {
    ConstantClass.accountlist.add(AccountItem(
        mnemonics: "",
        name: "Wallet",
        privatekeyBsc: ConstantClass.genPrivateBsc,
        privatekeyTron: ConstantClass.genprivateTron,
        publicKeyBsc: ConstantClass.genPublicTron,
        publicKeyTron: ConstantClass.genPublicTron,
        wallet_addressBsc: ConstantClass.genwalletBsc,
        wallet_addressTron: ConstantClass.genWalletTron));
    print("Data Added to List");
  }

  _saveDataAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Map each AccountItem to a Map<String, dynamic>
    List<Map<String, dynamic>> itemList = ConstantClass.accountlist.map((item) {
      print('publicKeyTron from _savedData  ' + item.publicKeyTron.toString());
      return {
        'name': item.name,
        'publicKeyBsc': item.publicKeyBsc,
        'privatekeyBsc': item.privatekeyBsc,
        'wallet_addressBsc': item.wallet_addressBsc,
        'publicKeyTron': item.publicKeyTron,
        'privatekeyTron': item.privatekeyTron,
        'wallet_addressTron': item.wallet_addressTron,
        'mnemonics': item.mnemonics,
      };
    }).toList();

    // Save the list of Maps to SharedPreferences
    prefs.setStringList(
        'items', itemList.map((map) => jsonEncode(map)).toList());
  }
}

InkWell btncustom({
  btncolor,
  btntxtclr,
  required btntxt,
  BtnPressed,
}) {
  return InkWell(
    onTap: BtnPressed,
    child: Container(
        // padding: EdgeInsets.only(top: 7),
        height: Get.height / 20,
        width: Get.width / 4,
        decoration: BoxDecoration(
            color: btncolor ?? Colors.transparent,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Center(
          child: Text(
            btntxt!,
            style: TextStyle(color: btntxtclr ?? Colors.white),
            textAlign: TextAlign.center,
          ),
        )),
  );
}
