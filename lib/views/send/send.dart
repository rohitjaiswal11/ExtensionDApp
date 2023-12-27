import 'package:extensionapp/Blockchain/blockchain%20.dart';
import 'package:extensionapp/Controller/controller.dart';
import 'package:extensionapp/Utils/common.dart';
import 'package:extensionapp/Utils/common_Acc.dart';
import 'package:extensionapp/Utils/customfonts.dart';
import 'package:extensionapp/Utils/dialogwidget.dart';
import 'package:extensionapp/Utils/sharedpref.dart';
import 'package:extensionapp/views/add_account.dart';
import 'package:extensionapp/views/home/home.dart';
import 'package:extensionapp/views/home/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Send extends StatefulWidget {
  const Send({super.key});

  @override
  State<Send> createState() => _SendState();
}

bool backbool = false;

TextEditingController _textFieldController = TextEditingController();

class _SendState extends State<Send> {
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
              padding: EdgeInsets.symmetric(
                 vertical: Get.height / 40),
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
                  controller: _textFieldController,
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
                //      controller: _textFieldController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
      hintText:"Enter amount",
      
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
                    padding: EdgeInsets.all( 10,),
                    decoration: BoxDecoration( shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(child: CustomFonts.Text16("Max", Colors.white))),  
              ],
            ),
      


        SizedBox(
              height: Get.height * 0.06,
            ),
    btncustom(
            btntxt: "Send",
            BtnPressed: () {
             // Get.to(MyHomePage());
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

  void _getClipboardText() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);

    if (clipboardData != null && clipboardData.text != null) {
      setState(() {
        _textFieldController.text = clipboardData.text!;
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
