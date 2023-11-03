// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:js_interop_unsafe';

import 'package:extensionapp/Blockchain/blockchain%20.dart';
import 'package:extensionapp/utils/common.dart';
import 'package:extensionapp/views/Utils/sharedpref.dart';
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

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      String dropdownvalue = "";

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
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              Get.back();
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Select Type',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                Spacer(),
                                Container(
                                    width: Get.width / 5,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: DropdownButton<String>(
                                      items: <String>[
                                        'Private key',
                                        'Json File'
                                      ].map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (_) {},
                                    )

                                    //                                 child: DropdownButton(items:            ,

                                    //                                     icon: const Icon(Icons.keyboard_arrow_down),
                                    //                                 onChanged:  (String? newValue){
                                    //   setState(() {
                                    //     selectedValue = newValue!;
                                    //   });
                                    // },value: selectedValue,)
                                    )
                              ],
                            ),
                            // Sizeconst dBox(
                            //   height: Get.height / 20,
                            // ),
                          ],
                        ),

                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.txtfieldname.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                      TextField(
                        onChanged: (value) {
                          print("import wallet $value");
                          setState(
                            () {
                        Common.txtaccountglobal = value;
                            },
                          );
                        },
                        style: TextStyle(color: Colors.amber),
                        controller: mytextController,
                        decoration: InputDecoration(
                          hintText: widget.hnttxt,
                          //   suffixIcon: Icon(Icons.qr_code),
                          suffixIconColor: Colors.blue,
                          hintStyle: TextStyle(color: Colors.grey.shade400),
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
                      SizedBox(
                        height: Get.height / 20,
                      ),
                      if (widget.impvalue == 1)
                        btncustom(
                            btntxt: "Add Wallet",
                            btncolor: Colors.blue,
                            BtnPressed: () {
                              savedprivate();

                            //  Wallet().getpublic(mytextController.toString());
                            }),
                      SizedBox(
                        child: widget.w1,
                      )
                      //  for(int i=0;i<i;i++)
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     btncustom(
                      //         btncolor: btncolor,
                      //         btntxt: 'cancel',
                      //         BtnPressed: null),
                      //     btncustom(
                      //         btncolor: Colors.blue,
                      //         btntxt: 'create',
                      //         BtnPressed: null),
                      //   ],
                      // )
                    ],
                  )))));
    });
  }
}

void savedprivate() {
  SharedPreferencesManager()
      .writeString('importprivate', Common.privatekeytxt.toString());

  print('printing writestring  ${Common.privatekeytxt}');
}

Widget btncustom({
  btncolor,
  btntxtclr,
  required btntxt,
  required GestureTapCallback BtnPressed,
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
