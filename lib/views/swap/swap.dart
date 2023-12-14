import 'package:extensionapp/Utils/customfonts.dart';
import 'package:extensionapp/Utils/dialogwidget.dart';
import 'package:extensionapp/export.dart';
import 'package:extensionapp/views/home/topbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/custombtn.dart';

class Swap extends StatefulWidget {
  const Swap({super.key});

  @override
  State<Swap> createState() => _SwapState();
}

bool swapswitch = false;
@override
void init() {
  prefe();
}

Future<void> prefe() async {
  final prefs = await SharedPreferences.getInstance();

  swapswitch = prefs.getBool('swapswitch')!;
}

class _SwapState extends State<Swap> {
  String dropdownvalue = 'USDT';

  // List of items in our dropdown menu
  var items = [
    'USDT',
    'ETH',
    'BNB',
    'TRX',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          //  Topbar(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            color: Colors.black,
            //  Get.isDarkMode ? Colors.black : Colors.white,
            height: Get.height * 0.1,
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.grey.shade300
                        // Get.isDarkMode ? Colors.grey : Colors.black,
                        )),
                Text(
                  "Swap",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                                builder: (context, setState) {
                              return Dialog(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Get.height * 0.03,
                                      horizontal: Get.width * 0.05),
                                  height: Get.height / 3,
                                  decoration: BoxDecoration(
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomFonts.Text16(
                                              "Smart Swap", Colors.white),
                                          IconButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Dialog(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        child: Container(
                                                          child: CustomFonts.Text12(
                                                              "Simulate transactions before submitting to decrease transaction costs and reduce failures. To learn more, read our",
                                                              Colors.grey),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      Get.height *
                                                                          0.03,
                                                                  horizontal:
                                                                      Get.width *
                                                                          0.05),
                                                          height:
                                                              Get.height / 3,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .black87,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          20))),
                                                        ),
                                                      );
                                                    });
                                              },
                                              icon: Icon(Icons.info)),
                                          Spacer(),
                                          CupertinoSwitch(
                                              value: swapswitch,
                                              onChanged: (val) {
                                                setState(() {
                                                  swapswitch = val;
                                                  print(swapswitch);
                                                });
                                              }),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.05,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomFonts.Text16(
                                              "Slippage", Colors.white),
                                          Spacer(),
                                          Container(
                                            height: 20,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(2))),
                                            child: TextFormField(
                                              style: TextStyle(
                                                  color: Colors.white),
                                              decoration: InputDecoration(),
                                            ),
                                          ),
                                          CustomFonts.Text12("%", Colors.white)
                                        ],
                                      ),
                                      Spacer(),
                                      btncustom(
                                          btntxt: "Update",
                                          BtnPressed: () {
                                            Get.back();
                                          })
                                    ],
                                  ),
                                ),
                              );
                            });
                          });
                    },
                    icon: Icon(
                      Icons.settings,
                      color: Colors.grey.shade300,
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      DropdownButton(
                        dropdownColor: Colors.grey.withOpacity(.9),
                        iconEnabledColor: Colors.white,
                        value: dropdownvalue,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                      SizedBox(
                          width: Get.width *
                              0.45), // Add some space between Dropdown and TextFormField
                      Container(
                        height: 40, // Adjust the height as needed
                        width: 80, // Adjust the width as needed
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.9),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none,
                            labelText: '0',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
       

,
       Container(padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
        decoration: BoxDecoration(

border: Border.all(width: 1, color: Colors.grey,),
borderRadius:BorderRadius.circular(100)

        )
        ,
        
        child: IconButton(onPressed: (){



        }, icon: Icon(Icons.swap_vert, color: Colors.grey,))),
           Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      DropdownButton(
                        dropdownColor: Colors.grey.withOpacity(.9),
                        iconEnabledColor: Colors.white,
                        value: dropdownvalue,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                      SizedBox(
                          width: Get.width *
                              0.45), // Add some space between Dropdown and TextFormField
                      Container(
                        height: 40, // Adjust the height as needed
                        width: 80, // Adjust the width as needed
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.9),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none,
                            labelText: '0',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
       ,
SizedBox(height: Get.height*0.04,),

       btncustom(btntxt: "Swap", BtnPressed: (){


        Get.to(MyHomePage());
       })
        ],
      ),
    );
  }
}
