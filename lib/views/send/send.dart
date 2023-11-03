import 'package:extensionapp/Blockchain/blockchain%20.dart';
import 'package:extensionapp/Controller/controller.dart';
import 'package:extensionapp/utils/common.dart';
import 'package:extensionapp/views/Utils/common_Acc.dart';
import 'package:extensionapp/views/Utils/dialogwidget.dart';
import 'package:extensionapp/views/Utils/sharedpref.dart';
import 'package:extensionapp/views/add_account.dart';
import 'package:extensionapp/views/home/home.dart';
import 'package:extensionapp/views/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Send extends StatefulWidget {
  const Send({super.key});

  @override
  State<Send> createState() => _SendState();
}

bool backbool = false;

class _SendState extends State<Send> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Topbar(),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "Send to",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Container(
              child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter public address(0x) or ENS name',
              suffixIcon: Icon(Icons.qr_code),
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
            alignment: Alignment.topLeft,
            child: Text(
              'Your accounts',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Colors.grey),
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Container(
            height: Get.height / 2,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, Index) {
                  return InkWell(onTap: () {}, child: Account());
                },
                separatorBuilder: ((context, index) {
                  return SizedBox(
                    height: Get.height / 100,
                  );
                }),
                itemCount: 1),
          )
        ],
      ),
    );
  }
}

// On tap of add
Future<dynamic> DialogBox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
              alignment: Alignment.topCenter,
              child: Container(
                  color: Colors.black87,
                  height: Get.height * 0.8,
                  width: Get.width / 0.7,
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
                                      Get.back();
                                    },
                                    icon: Icon(Icons.arrow_back_ios,
                                        color: Colors.white),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Add account",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon:
                                        Icon(Icons.close, color: Colors.white),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: Get.height / 20,
                              ),
                              icon_txt_btn(
                                btn_icon: Icons.add,
                                btn_name: "Add an account ",
                                ontap: () {
                                  //  backbool=!backbool;
                                  //  Get.back();
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return DialogCustom(
                                          hnttxt: 'Account',
                                          txtfieldname: 'Account',
                                          w1: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              btncustom(
                                                  btncolor: Colors.white,
                                                  btntxt: 'cancel',
                                                  btntxtclr: Colors.blue,
                                                  BtnPressed: () {
                                                    Get.to(MyHomePage);

// Get.to();
                                                  }),
                                              btncustom(
                                                  btncolor: Colors.blue,
                                                  btntxt: 'create',
                                                  BtnPressed: () {saveaccount();
                                                    Wallet().generateMnemonic();
                                                    Wallet().walletaddress();

                                                   
                                                  }),
                                            ],
                                          ),
                                          titletxt: "Add account",
                                          cheight: Get.height * 0.4,
                                          cwidth: null,
                                        );
                                      });
                                },
                              ),
                              SizedBox(
                                height: Get.height / 40,
                              ),
                              icon_txt_btn(
                                ontap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return DialogCustom(
                                          impvalue: 1,
                                          titletxt: "Import Account",
                                          cheight: Get.height * 0.4,
                                          cwidth: null,
                                          txtfieldname:
                                              "Enter your private key string here:",
                                          hnttxt: 'Enter Private key',
                                        );
                                      });
                                },
                                btn_icon: Icons.download,
                                btn_name: "Import account",
                              ),
                              SizedBox(
                                height: Get.height / 50,
                              ),
                              icon_txt_btn(
                                ontap: () {
                                  print("gggggggg");
                                },
                                btn_icon: Icons.badge_rounded,
                                btn_name: "Add hardware wallet ",
                              ),
                            ]),
                      ))));
        });
      });
}

 saveaccount() async {
  SharedPreferencesManager().writeString('account',   Common.txtaccountglobal.toString());

  print('printing writestring  ${Common.txtaccountglobal}');
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
