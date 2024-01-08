import 'package:extensionapp/Utils/dialogwidget.dart';
import 'package:extensionapp/views/home/tokenItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Utils/Constant.dart';
import '../../Utils/customfonts.dart';
import '../../Utils/snackbar.dart';

class ImportToken extends StatefulWidget {
  ImportToken({
    super.key,
  });

  @override
  State<ImportToken> createState() => _ImportTokenState();
}

class _ImportTokenState extends State<ImportToken> {
  String selectedValue = 'BNB';

  List<Map<String, dynamic>> dropdownItems = [
    {'value': 'BNB', 'image': 'assets/images/Bnb.png'},
    {'value': 'TRON', 'image': 'assets/images/Tron.png'},
  ];

  void _getClipboardText() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);

    if (clipboardData != null && clipboardData.text != null) {
      setState(() {
        token_address.text = clipboardData.text!;
      });
    }
  }

  TextEditingController token_address = TextEditingController();

  TextEditingController token_name = TextEditingController();

  TextEditingController token_decimal = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            alignment: Alignment.topCenter,
            child: Container(
              color: Colors.black87,
              height: Get.height * 0.8,
              width: Get.width * 0.7,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                        ),
                        Center(
                          child: CustomFonts.Text17(
                            "Add Token",
                            Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton<String>(
                          underline: Container(),
                          style: TextStyle(color: Colors.white),
                          dropdownColor: Colors.grey.shade700,
                          value: selectedValue,
                          items: dropdownItems.map((item) {
                            return DropdownMenuItem<String>(
                              alignment: Alignment.center,
                              value: item['value'],
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: Image.asset(
                                      item['image'],
                                      height: Get.height * 0.04,
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Text(item['value']),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    CustomFonts.text13("Token Address", Colors.white),
                    Container(
                        height: Get.height * 0.07,
                        child: TextField(
                          controller: token_address,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '',
                            suffixIcon: IconButton(
                              onPressed: () {
                                _getClipboardText();
                              },
                              icon: Icon(Icons.paste),
                            ),
                            suffixIconColor: Colors.blue,
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12),
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
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    CustomFonts.text13("Name", Colors.white),
                    Container(
                        height: Get.height * 0.07,
                        child: TextField(
                          controller: token_name,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '',
                            suffixIconColor: Colors.blue,
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12),
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
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    CustomFonts.text13("Symbol", Colors.white),
                    Container(
                        height: Get.height * 0.07,
                        child: TextField(
                          //    controller: address,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '',
                            suffixIconColor: Colors.blue,
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12),
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
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    CustomFonts.text13("Decimal", Colors.white),
                    Container(
                        height: Get.height * 0.07,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: token_decimal,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '',
                            suffixIconColor: Colors.blue,
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12),
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
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Center(
                        child: btncustom(
                            btntxt: "ADD",
                            BtnPressed: () {
                              if (token_address.text.isNotEmpty ||
                                  token_decimal.text.isNotEmpty ||
                                  token_name.text.isNotEmpty) {
                                addToken();
                              } else
                                showCustomSnackBar(
                                    message: "Please fill all the fields");
                            }))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> addToken() async {

    selectedValue=='BNB'?
    Token_Item.Bsclist.add(Token_Item(
        balance: 0.0,
        coindecimal: int.parse(token_decimal.text.toString()),
        coinimage: 'assets/images/Bnb.png',
        coinname: token_name.text,
        rate: 0.0,
        contractAddress: token_address.text,
        networkindex: Token_Item.Bsclist.length,
        coinAbi: null

     
        )):Token_Item.Tronlist.add(Token_Item(
        balance: 0.0,
        coindecimal: int.parse(token_decimal.text.toString()),
        coinimage: 'assets/images/tron.png',
        coinname: token_name.text,
        rate: 0.0,
        contractAddress: token_address.text,
        networkindex: Token_Item.Tronlist.length,
        coinAbi: null

     
        )

          
        );
        
        
        
        ;

    print(ConstantClass.genWalletTron);
    print(" Wallet Data Added to List");
  }
}
