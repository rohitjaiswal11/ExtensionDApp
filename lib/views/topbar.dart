
import 'package:extensionapp/views/Utils/common_Acc.dart';
import 'package:extensionapp/views/home/home.dart';
import 'package:extensionapp/views/send/send.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:url_launcher/url_launcher.dart';

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

  String img = 'assets/images/ethlogo.png';
  toptaphandler(String img2) {
    print(img2);
    setState(() {
      img = img2;
    });
    Get.back();
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
      color: Colors.black54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              showDialog(
                  context: context, // Use the context from the GestureDetector
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
                                            MainAxisAlignment.center,
                                        children: [
                                          Spacer(),
                                          Text(
                                            "Select a network",
                                            style: TextStyle(
                                                fontSize: 20,
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
                                      SizedBox(
                                        height:
                                            Get.height * 0.09 * mainnet.length,
                                        child: ListView.builder(
                                            itemCount: mainnet.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  toptaphandler(mainnet[index]);
                                                  Get.back();
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Image.asset(
                                                        mainnet[index],
                                                        height:
                                                            Get.height * 0.05,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "Etherium Mainnet",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Show test Network",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Spacer(),
                                          Switch(
                                            onChanged: (value) {
                                              setState(() {
                                                isSwitched = value;
                                              });
                                            },
                                            value: isSwitched,
                                            activeColor: Colors.white,
                                            activeTrackColor: Colors.blue,
                                            inactiveThumbColor: Colors.white,
                                            inactiveTrackColor:
                                                Colors.grey.withOpacity(0.5),
                                          ),
                                        ],
                                      ),
                                      if (isSwitched == true)
                                        SingleChildScrollView(
                                          child: Container(
                                            //  color: Colors.green,
                                            height: Get.height / 3,
                                            width: Get.width,
                                            child: ListView.separated(
                                                itemCount: TestNetwork
                                                    .testnetworklist.length,
                                                itemBuilder: (context, index) {
                                                  return Row(
                                                    children: [
                                                      Image.asset(
                                                        TestNetwork
                                                            .testnetworklist[
                                                                index]
                                                            .coinimage,
                                                        fit: BoxFit.contain,
                                                        height: Get.height / 20,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        TestNetwork
                                                            .testnetworklist[
                                                                index]
                                                            .coinname
                                                            .toString(),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ],
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SizedBox(
                                                          height: 20,
                                                        )),
                                          ),
                                        ),
                                      Container(
                                        width: Get.width,
                                        height: Get.height / 20,
                                        padding: EdgeInsets.only(top: 5),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.blue),
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
              });
            },
            child: Container(
              padding: EdgeInsets.all(5),
              // margin: EdgeInsets.all(30),
              width: Get.width / 6,
              height: Get.height / 20,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    img,
                    fit: BoxFit.fitHeight,
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/images/down.png',
                    fit: BoxFit.fitHeight,
                  ),
                ],
              ),
            ),
          ),
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
                                                "Select a network",
                                                style: TextStyle(
                                                    fontSize: 20,
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
                                         Account(),
                                          SizedBox(
                                            height: Get.height / 20,
                                          ),
                                          Container(alignment: AlignmentDirectional.center,
                                            width: Get.width,
                                            height: Get.height / 20,
                                            padding: EdgeInsets.only(top: 5),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.blue),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: InkWell(onTap:() =>   DialogBox(context),
                                              child: Text(
                                                "Add Another Account",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
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
              padding: EdgeInsets.all(5),
              // margin: EdgeInsets.all(30),
              //  width: Get.width / 3,
              height: Get.height / 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/images/pie.png',
                  ),
                  const Text(
                    "Account 1",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Image.asset(
                    'assets/images/down.png',
                  ),
                ],
              ),
            ),
          ),
          Container(
            //color: Colors.blue,
            padding: EdgeInsets.all(5),
            // margin: EdgeInsets.all(30),
            // width: Get.width / 3,
            height: Get.height / 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            alignment: Alignment.center,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              height: Get.height / 6,
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "New tab",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      Spacer(),
                                      IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: Icon(Icons.close,
                                              color: Colors.white, size: 30))
                                    ],
                                  ),
                                  Container(),
                                  Text(
                                    'MetaMask is not connected to this site. To connect to a web3 site, find and click the connect button.',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Image.asset(
                    'assets/images/globe.png',
                  ),
                ),
                SizedBox(
                  width: Get.width / 20,
                ),
                //Spacer(),
                // InkWell(
                //   onTap: () {
                // print("CHECKKKKKK");
                PopupMenuButton<int>(
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
                        value: i,
                        // row has two child icon and text
                        child: Row(
                          children: [
                            menuicon[i],
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
                  offset: Offset(25, 50),
                  color: Colors.black,
                  elevation: 2,

                  icon: Icon(Icons.more_vert,color: Colors.white),
                //;.  iconSize: 70,
                  // icon: Image.asset("assets/images/more.png",height: 90, color: Colors.white,),
                )

                // },
                //   child: Image.asset(
                //     'assets/images/more.png',
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class icon_txt_btn extends StatelessWidget {
  final String btn_name;

 final  btn_icon;
  icon_txt_btn({
    super.key,
   required this.btn_name, required this.btn_icon,
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
