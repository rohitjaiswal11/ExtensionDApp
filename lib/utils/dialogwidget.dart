// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:js_interop_unsafe';

import 'package:extensionapp/Blockchain/blockchain%20.dart';
import 'package:extensionapp/Utils/common.dart';
import 'package:extensionapp/Utils/sharedpref.dart';
import 'package:flutter/material.dart';

import 'package:extensionapp/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

//  GestureTapCallback? BtnPressed;

  // TextEditingController mytextController;

  DialogCustom({
    Key? key,
    this.cheight,
    this.cwidth,
    required this.titletxt,
    this.hnttxt,
    this.txtfieldname,
    this.btncolor,
    this.w1,
    this.impvalue,
    //required this.mytextController,
  }) : super(key: key);

  @override
  State<DialogCustom> createState() => _DialogCustomState();
}

class _DialogCustomState extends State<DialogCustom> {
  TextEditingController mytextController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    mytextController.dispose();
    // super.dispose();
  }

  var items = ["Private key", "Json File"];
  String dropdownvalue = "Private key";

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Dialog(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Select Type',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                //   Spacer(),
                                Container(
                                  width: Get.width / 4,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  child:
                                  
                                  
                                  
                                  
                                   DropdownButton(
                                    // Initial Value
                                    value: dropdownvalue,
                           // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),

                                    // Array list of items
                                    items: items.map((String items) {
                                 
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );

                                    }).toList(),

                                    
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },
                                  ),

                                )
                              ],
                            ),
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
                        child: TextField(
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
                          style: TextStyle(color: Colors.amber),
                          controller: mytextController,
                          decoration: InputDecoration(
                            hintText: widget.hnttxt,
                            //   suffixIcon: Icon(Icons.qr_code),
                            suffixIconColor: Colors.blue,
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
                              savedprivate();
                              // Get.back();

                              Wallet().getpublic(mytextController.toString());
                            }),
                      SizedBox(
                        child: widget.w1,
                      )
                    ],
                  )))));
    });
  }
}

void savedprivate() {
  SharedPreferencesManager()
      .writeString('importprivate', Common.privatekeytxt.toString());

  print('printing private writestring  ${Common.privatekeytxt}');
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
