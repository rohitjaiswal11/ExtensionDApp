import 'package:extensionapp/Blockchain/blockchain%20.dart';
import 'package:extensionapp/Utils/common.dart';
import 'package:extensionapp/Utils/common_Acc.dart';
import 'package:extensionapp/Utils/customfonts.dart';
import 'package:extensionapp/Utils/sharedpref.dart';
import 'package:extensionapp/views/home/home.dart';
import 'package:extensionapp/views/send/send.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/Constant.dart';
import '../../Utils/dialogwidget.dart';

class Topbar extends StatefulWidget {
  const Topbar({super.key});

  @override
  State<Topbar> createState() => _TopbarState();
}

class _TopbarState extends State<Topbar> {
  _launchURL() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  String img = 'assets/images/bsc.png';
  int networkchange(int indexNetwork) {
//     setState(() {
//       print("Before Index ${indexNetwork}");
// indexNetwork==0?indexNetwork++:indexNetwork--;

// print("After Index ${indexNetwork}");

//     });

    // For BSC
    if (indexNetwork == 0) {
      print("network1 --------------BSC");
      setState(() {
        ConstantClass.network0 = false;
        ConstantClass.network1 = true;
      });
      print("Network0  ${ConstantClass.network0}");
      print("Network1  ${ConstantClass.network1}");

      setState(() {
        ConstantClass.currentIndex = indexNetwork;
      });
      Future<void> pref() async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        ConstantClass.wallet = prefs.getString('walletBsc');
        ConstantClass.publicKey = prefs.getString('publickeyBsc');
        ConstantClass.privateKey = prefs.getString('privatekeyBsc');

        ConstantClass.Name = prefs.getString('name');
        ConstantClass.mnemonic = prefs.getString('seedPhrase');

        await prefs.setInt('currentIndex', ConstantClass.currentIndex);
      }
    }

    //for Tron
    if (indexNetwork == 1) {
      print("Network1-----------------Tron");
      ConstantClass.network0 = false;
      Future<void> pref() async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        ConstantClass.wallet = prefs.getString('walletTron');
        ConstantClass.publicKey = prefs.getString('publickeyTron');
        ConstantClass.privateKey = prefs.getString('privatekeyTron');
        ConstantClass.Name = prefs.getString('name');
        ConstantClass.mnemonic = prefs.getString('seedPhrase');
        ConstantClass.password = prefs.getString('password');
        ConstantClass.fakewallet = prefs.getString('fakewallet');
      }

      setState(() {});
    }

    return indexNetwork;
  }

  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is $isSwitched');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }

  bool isdata = false;
  var selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height / 10,
        color: Colors.black26,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context:
                        context, // Use the context from the GestureDetector
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
                                  child: Column(
                                      //  mainAxisAlignment:MainAxisAlignment.,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomFonts.Text17(
                                                "Select a network",
                                                Colors.white),
                                            IconButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon: Icon(Icons.close,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: Get.height *
                                              0.09 *
                                              MainNet.mainnetworklist.length,
                                          child: ListView.builder(
                                              itemCount: MainNet
                                                  .mainnetworklist.length,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () async {
                                                    // print(  "index $index_network");
                                                    setState(
                                                      () {
                                                        ConstantClass
                                                                .currentIndex =
                                                            networkchange(
                                                                index);

                                                        print(
                                                            "ConstantClass.currentIndex       -----${ConstantClass.currentIndex}");
                                                      },
                                                    );

                                                    Get.back();

// Get.to(const MyHomePage())?.then((value) {

//   Get.back();
// });
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        child: Image.asset(
                                                          MainNet
                                                              .mainnetworklist[
                                                                  index]
                                                              .coinimage,
                                                          height:
                                                              Get.height * 0.04,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        MainNet
                                                            .mainnetworklist[
                                                                index]
                                                            .coinname,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Show test Network",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            Transform.scale(
                                              scale: 0.7,
                                              child: CupertinoSwitch(
                                                onChanged: (value) {
                                                  setState(() {
                                                    isSwitched = value;
                                                  });
                                                },
                                                value: isSwitched,
                                                activeColor: Colors.white,
                                                thumbColor: Colors.blue,
                                                trackColor: Colors.grey
                                                    .withOpacity(0.5),
                                                // inactiveThumbColor: Colors.white,
                                                // inactiveTrackColor:
                                                //     Colors.grey.withOpacity(0.5),
                                              ),
                                            ),
                                          ],
                                        ),
                                        if (isSwitched == true)
                                          SingleChildScrollView(
                                            child: SizedBox(
                                              height: Get.height *
                                                  0.09 *
                                                  TestNetwork
                                                      .testnetworklist.length,
                                              child: ListView.builder(
                                                  itemCount: TestNetwork
                                                      .testnetworklist.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return InkWell(
                                                      onTap: () async {
                                                        Get.back();
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          CircleAvatar(
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            child: Image.asset(
                                                              TestNetwork
                                                                  .testnetworklist[
                                                                      index]
                                                                  .coinimage,
                                                              height:
                                                                  Get.height *
                                                                      0.04,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            TestNetwork
                                                                .testnetworklist[
                                                                    index]
                                                                .coinname,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          ),
                                        Container(
                                          padding: EdgeInsets.zero,
                                          width: Get.width,
                                          height: Get.height / 20,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.blue),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Text(
                                              "Add network",
                                              textAlign: TextAlign.center,
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                          ),
                                        )
                                      ]),
                                )));
                      });
                    }).then((value) {
                  print("tap");
                  setState(() {});
                }).whenComplete(() {
                  setState(() {
                    print("Executindfkgndindfkynjdlg");
                  });
                });
              },
              child: Container(
                padding: EdgeInsets.all(7),
                //   margin: EdgeInsets.all(30),
                width: Get.width / 6,
                height: Get.height / 20,
                decoration: BoxDecoration(
                  //color: Colors.amber,
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      MainNet.mainnetworklist[ConstantClass.currentIndex]
                              .coinimage ??
                          img,
                      fit: BoxFit.fitHeight,
                    ),
                    Image.asset(
                      'assets/images/down.png',
                      height: 10,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                showDialog(
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Spacer(),
                                                Text(
                                                  "Select an Account",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.white),
                                                ),
                                                Spacer(),
                                                IconButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  icon: Icon(Icons.close,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                            Account(context),
                                            SizedBox(
                                              height: Get.height / 40,
                                            ),
                                            InkWell(
                                              onTap: () => DialogBox(context),
                                              child: Container(
                                                alignment:
                                                    AlignmentDirectional.center,
                                                width: Get.width,
                                                height: Get.height / 20,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.blue),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Text(
                                                  "Add Another Account",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.blue),
                                                ),
                                              ),
                                            )
                                          ]),
                                    ))));
                      });
                    });
              },
              child: Container(
                //   padding: EdgeInsets.all(8),
                margin:
                    EdgeInsets.only(left: Get.width / 8, right: Get.width / 20),
                //  width: Get.width / 3,
                // height: Get.height / 25,
                child: Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/images/pie.png',
                      height: 20,
                    ),
                    const Text(
                      " Account 1 ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                    Image.asset(
                      'assets/images/down.png',
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  // color: Colors.blue,
                  padding: EdgeInsets.all(7),
                  //  margin: EdgeInsets.all(30),
                  width: Get.width / 6,
                  height: Get.height / 20,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              alignment: Alignment.center,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: Get.height * 0.005,
                                    horizontal: Get.width * 0.05),
                                height: Get.height / 3.5,
                                decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: CustomFonts.text14(
                                          "New Tab", Colors.white),
                                      trailing: IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: Icon(Icons.close,
                                              color: Colors.white, size: 20)),
                                    ),
                                    CustomFonts.Text12(
                                        " 'MetaMask is not connected to this site. To connect to a web3 site, find and click the connect button.',",
                                        Colors.white)
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      //       margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        'assets/images/globe.png',
                        height: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: PopupMenuButton<int>(
                    //constraints: const BoxConstraints.expand(width: 50, height: 100),
                    onSelected: (int value) {
                      // Handle the item selection here
                      switch (value) {
                        case 0:
                          _launchURL();
                          break;
                        case 1:
                          _launchURL();
                          // Navigate to a new screen or perform an action for item 1

                          break;
                        case 2:
                          // Navigate to a different screen or perform an action for item 2
                          _launchURL();
                          break;
                        case 3:
                          _launchURL();
                          break;

                        case 4:
                          _launchURL();
                          break;
                        case 5:
                          _launchURL();
                          break;
                      }
                    },
                    itemBuilder: (context) => [
                      // popupmenu item 1

                      for (int i = 0; i < 5; i++)
                        PopupMenuItem(
                          //padding: EdgeInsets.all(100),
                         height: Get.height * 0.045,
                          textStyle: const TextStyle(fontSize: 13, fontFamily: 'popins'),

                          value: i,
                          // row has two child icon and text
                          child: Row(
                            children: [
                              Transform.scale(child:    menuicon[i],scale: 0.8,),
                           

                              //  Icon(Icons.settings, color: Colors.white),
                              SizedBox(
                                // sized box with width 10
                                width: 10,
                              ),
                              menutxt[i],
                            ],
                          ),
                        ),
                    ],
                    // offset: Offset(25, 50),

                    color: Colors.black,
                    //   elevation: 2,

                    icon: Image.asset(
                      'assets/images/more.png',
                      height: 20,
                      fit: BoxFit.fitHeight,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                )
              ],
            )
          ],
        ));
  }

  Future<dynamic> DialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setStat) {
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
                                          fontSize: 17, color: Colors.white),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.close,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height / 20,
                                ),
                                icon_txt_btnSecond(
                                  btn_icon: Icons.add,
                                  btn_name: "Add an account ",
                                  ontap: () {
                                    //  backbool=!backbool;
                                    //  Get.back();
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return StatefulBuilder(
                                              builder: (context, set) {
                                            ToastContext().init(context);

                                            return DialogCustom(
                                              hnttxt: 'Account',
                                              txtfieldname: 'Account',
                                              w1: !isLoad
                                                  //   ?

                                                  // InkWell(child:   Text("data",style: TextStyle(color: Colors.red),) ,onTap: (){
                                                  // print("isLoad "+isLoad.toString());
                                                  //     set((){
                                                  //        isLoad =true;
                                                  //     });
                                                  //       print("isLoad 2"+isLoad.toString());
                                                  //       Future.delayed(Duration(seconds: 10)).then((value) {

                                                  //         setState(() {
                                                  //                 isLoad=false;
                                                  //         });
                                                  //   });

                                                  //     print("set state   ++ ${isLoad.toString()}");

                                                  //   },)

                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        btncustom(
                                                            btncolor:
                                                                Colors.white,
                                                            btntxt: 'Cancel',
                                                            btntxtclr:
                                                                Colors.blue,
                                                            BtnPressed: () {
                                                              Get.back();
                                                            }),

                                                        InkWell(
                                                          onTap: () {
                                                            print("00");
                                                            set(() {
                                                              print("01");
                                                              isLoad = true;
                                                              print("fffffffffffffff" +
                                                                  isLoad
                                                                      .toString());
                                                            });
                                                            call();

                                                            saveaccount();
                                                            print("4");
                                                          },
                                                          child: Container(
                                                              // padding: EdgeInsets.only(top: 7),
                                                              height:
                                                                  Get.height /
                                                                      20,
                                                              width:
                                                                  Get.width / 4,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .blue,
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .blue),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              25))),
                                                              child: Center(
                                                                child: Text(
                                                                  "Create",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              )),
                                                        ),

                                                        // btncustom(
                                                        //     btncolor: Colors.blue,
                                                        //     btntxt: 'create',
                                                        //     BtnPressed: () {

                                                        //       print("object    Circular progress Indicator" +
                                                        //           isLoad.toString());
                                                        //       //   isLoad = true;
                                                        //       set(() {
                                                        //         isLoad = true;
                                                        //       });

                                                        //       print("-----================>  " + isLoad.toString());

                                                        //       String mnemonicsfetched = Wallet().generateMnemonic();
                                                        //       Wallet().walletaddress(mnemonicsfetched);
                                                        //       saveaccount();
                                                        //       print("-----================>1  " + isLoad.toString());
                                                        //       Get.to(MyHomePage());

                                                        //       // bool check =dfafda

                                                        //       // txtaccountglobal
                                                        //       if (Common().isDuplicate(Common.txtaccountglobal!,
                                                        //               Common.accountsCreated) ==
                                                        //           true) {
                                                        //         Common().showToast("Duplicate",
                                                        //             gravity: Toast.center, duration: Toast.lengthLong);
                                                        //       } else {
                                                        //         Common().showToast("Added",
                                                        //             gravity: Toast.center, duration: Toast.lengthLong);
                                                        //       }

                                                        //       // isLoad = false;

                                                        //       print("Load end $isLoad");
                                                        //       //    Get.to(const MyHomePage());
                                                        //     }),
                                                      ],
                                                    )
                                                  : CircularProgressIndicator(),
                                              titletxt: "Add account",
                                              cheight: Get.height * 0.4,
                                              cwidth: null,
                                            );
                                          });
                                        });
                                  },
                                ),
                                SizedBox(
                                  height: Get.height / 40,
                                ),
                                icon_txt_btnSecond(
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
                                icon_txt_btnSecond(
                                  ontap: () {
                                    _launchURL();
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
    SharedPreferencesManager()
        .writeString('account', Common.txtaccountglobal.toString());

    print('printing write string  ${Common.txtaccountglobal}');
  }
}

call() async {
  String mnemonicsfetched = await Wallet().generateMnemonic();
  Wallet().walletaddresstron(mnemonicsfetched);

  Wallet().walletaddressBSc(mnemonicsfetched);
}

class icon_txt_btnSecond extends StatelessWidget {
  final String btn_name;
  final VoidCallback ontap;
  final btn_icon;

  icon_txt_btnSecond({
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
            style: TextStyle(fontSize: 12, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class icon_txt_btn extends StatelessWidget {
  final String btn_name;

  final btn_icon;
  icon_txt_btn({
    super.key,
    required this.btn_name,
    required this.btn_icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(btn_icon),
        SizedBox(
          width: 2,
        ),
        Text(btn_name)
      ],
    );
  }
}

bool isLoad = false;
