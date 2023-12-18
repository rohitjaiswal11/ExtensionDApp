import 'package:extensionapp/Utils/Constant.dart';
import 'package:extensionapp/Utils/customfonts.dart';
import 'package:extensionapp/Utils/sharedpref.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:extensionapp/views/send/send.dart';
import 'package:extensionapp/views/home/topbar.dart';
import 'package:extensionapp/views/swap/swap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:trust_wallet_core/protobuf/Polkadot.pb.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Blockchain/DataExtension/Api.dart';
import '../Receive/Receive .dart';
import 'tokenItem.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<Token_Item> currentlist = [];

  String? walletaddress = ConstantClass.currentIndex == 0
      ? ConstantClass.walletBsc
      : ConstantClass.walletTron;

  //'loading';
// getaddress()  {

//   print(
//       "{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{walet}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}");
//   print("Wallet Address${ConstantClass.walletTron}");

//   return walletaddress;

// }

  // getcliptext() async {
  //   cliptext = await SharedPreferencesManager().readString('publickey');
  //   setState(() {});
  // }

  late TabController _tabController;
  late Map<String, dynamic> bnbData;
  late Map<String, dynamic> usdData;
  late Map<String, dynamic> tronData;
  late Map<String, dynamic> ethData;
  bool isDataLoaded = false;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    changetroken();
    loadcoinData();

    ConstantClass.totalBalance =
        get_TotalBalance(Token_Item.Bsclist, Token_Item.Tronlist);
    ConstantClass.currentBalance = getbalance(currentlist);
    super.initState();
  }

  getbalance(List<Token_Item> network_coin) {
    double balances = 0;

    for (int i = 0; i < network_coin.length; i++) {
      balances += network_coin[i].balance;
    }

    return balances;
  }

  get_TotalBalance(List<Token_Item> one, List<Token_Item> two) {
    double bal1 = 0;
    double bal2 = 0;

    bal1 = getbalance(one);
    bal2 = getbalance(two);

    return bal1 + bal2;
  }

  Future<void> loadcoinData() async {
    try {
      usdData = (await APIClass()
          .fetchcoindata('https://api.coingecko.com/api/v3/coins/usd'));

      bnbData = (await APIClass().fetchcoindata(
          'https://api.coingecko.com/api/v3/coins/binance-coin-wormhole'));

      tronData = (await APIClass()
          .fetchcoindata('https://api.coingecko.com/api/v3/coins/tron'));


          
      ethData = (await APIClass()
          .fetchcoindata('https://api.coingecko.com/api/v3/coins/ethereum'));


      setState(() {
        isDataLoaded = true;

        ConstantClass.usdrate =
            (usdData["market_data"]["current_price"]["usd"]);

        ConstantClass.bnbrate =
            (bnbData["market_data"]["current_price"]["usd"]);

        ConstantClass.tronrate =
            (tronData["market_data"]["current_price"]["usd"]);


        ConstantClass.ethrate =
            (ethData["market_data"]["current_price"]["usd"]);


        Token_Item.Bsclist[0].rate = ConstantClass.bnbrate!;
        Token_Item.Bsclist[1].rate = ConstantClass.usdrate!;
        Token_Item.Tronlist[0].rate = ConstantClass.tronrate!;

        Token_Item.Bsclist[2].rate=ConstantClass.ethrate!;
        print("dfdsfdf---->   " +
            ConstantClass.usdrate.toString() +
            "   ++item mrate     " +
            Token_Item.Bsclist[1].rate.toString());
      });
    } catch (error) {
      print('Error: $error');
      // Handle error appropriately
    }

    getbalance(currentlist);
  }

  changetroken() {
    currentlist = ConstantClass.currentIndex == 0
        ? [...Token_Item.Bsclist]
        : [...Token_Item.Tronlist];
    setState(() {});
    print("object---------------------");
    return currentlist;
  }

  bool isdata = false;
  var selectedItem = '';
  _launchURL() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(ConstantClass.currentIndex);
    print("Home55555555555555555555555");
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Topbar(),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Clipboard.setData(
                    ClipboardData(text: walletaddress ?? "loading"));
              ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,duration: Duration(seconds: 1),
          content: Text(
            'Copied',
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromRGBO(38, 123, 235, 0.3)),
                  height: Get.height / 20,
                  width: Get.width / 2.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Get.width / 5,
                        child: Text(
//ConstantClass.wallet??"loading",

                          ConstantClass.currentIndex == 0
                              ? ConstantClass.walletBsc!
                              : ConstantClass.walletTron!,

                          //??ConstantClass.walletTron!,
                          //??
//  walletaddress ,

                          // walletaddress,
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 13,
                              fontWeight: FontWeight.w300),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Image.asset(
                        'assets/images/copy.png',
                        color: Colors.blue,
                        width: 20,
                        height: 15,
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Text('\$ ${ConstantClass.totalBalance}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 5,
            ),
            //  isDataLoaded ?Text(usdData['ethereum']['usd'].toString(),
            Container(
                height: Get.height / 35,
                padding: EdgeInsets.all(Get.height * 0.003),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ConstantClass.currentIndex == 0
                        ? Color.fromRGBO(245, 241, 0, 0.514)
                        : Color.fromARGB(255, 223, 75, 64).withOpacity(0.5)),
                child: CustomFonts.text13(
                    '\ ${ConstantClass.currentBalance} USD ', Colors.white)),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
//                 ListView.builder(itemBuilder: (context,index)

//                 {
// return

//                 }
                //   )
                // ListView.builder(shrinkWrap: true,
                //     itemCount: ButtonTabs.btntaps.length,
                //     itemBuilder: (context, index) {
                //       return

                for (int i = 0; i < ButtonTabs.btntaps.length; ++i)
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          ButtonTabs.btntaps[i].Pressed?.call();
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            width: Get.width / 9,
                            decoration: BoxDecoration(
                                color: Colors.blue, shape: BoxShape.circle),
                            child: i == 1
                                ? Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Image.asset(
                                        ButtonTabs.btntaps[1].img,
                                        fit: BoxFit.contain),
                                  )
                                : Image.asset(ButtonTabs.btntaps[i].img,
                                    fit: BoxFit.contain)),
                      ),
                      Text(
                        ButtonTabs.btntaps[i].btntapname,
                        style: TextStyle(
                            fontFamily: 'popins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: Get.height / 30,
                      )
                    ],
                  ),
                //    })
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 25),
              //color: Colors.blueAccent,
              height: Get.height / 20,
              child: TabBar(
                  controller: _tabController,
                  //     indicatorPadding: EdgeInsets.only(top: Get.height * 0.05),

                  //indicatorPadding: EdgeInsets.only(top: 20),
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelColor: Colors.white,
                  indicatorColor: Colors.blue,
                  labelColor: Colors.blue,
                  labelStyle: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  ),
                  tabs: [
                    Text('Token'),
                    Text('NFTs'),
                    Text('Activity'),
                  ]),
            ),
            Container(
              height: Get.height / 2.5,
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: Get.height / 70),
                          child: currentlist.length == 0 &&
                                  isDataLoaded == false
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: currentlist.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      //   color: Colors.pink,
                                      margin: EdgeInsets.all(10),
                                      height: Get.height / 17,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            child: Image.asset(
                                              currentlist[index].coinimage,
                                              height: Get.height / 22,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width / 35,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                currentlist[index].coinname,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                  currentlist[index]
                                                      .balance
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      fontSize: 13)),
                                            ],
                                          ),
                                          Spacer(),
                                          Text(
                                              //ConstantClass.usdrate.toString(),
                                              "\$  ${currentlist[index].rate.toString()}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14))
                                        ],
                                      ),
                                    );
                                  }),
                        ),
                        TextButton.icon(
                            style: ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15)),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.blue)),
                            onPressed: () {},
                            icon: Icon(Icons.add),
                            label: Text(
                              'Import Token',
                            )),
                        SizedBox(
                          height: Get.height / 70,
                        ),
                        TextButton.icon(
                            style: ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15)),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.blue)),
                            onPressed: () {
                              setState(() {
                                Get.to(() => MyHomePage());
                              });
                            },
                            icon: Icon(Icons.refresh),
                            label: Text('Refresh list')),
                        SizedBox(
                          height: Get.height / 70,
                        ),
                        TextButton.icon(
                            style: ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15)),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.blue)),
                            onPressed: () {},
                            icon: Icon(Icons.chat),
                            label: Text('support'))
                      ],
                    ),
                  ),

                  isdata
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 20,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: Get.height / 20,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              'assets/images/ethlogo.png')
                                        ],
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/empty-folder.png'),
                            SizedBox(
                              height: Get.height / 30,
                            ),
                            Text(
                              'No NFT Yet',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                _launchURL();
                              },
                              child: Text(
                                "Learn More",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        ),

                  isdata
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 20,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: Get.height / 20,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              'assets/images/ethlogo.png')
                                        ],
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'You have no transcations',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: Get.height / 30,
                            ),
                            TextButton.icon(
                                icon: Icon(Icons.chat),
                                style: ButtonStyle(
                                    iconColor:
                                        MaterialStatePropertyAll(Colors.blue)),
                                onPressed: () {
                                  _launchURL();
                                },
                                label: Text(
                                  "MetaMask support",
                                  style: TextStyle(color: Colors.blue),
                                ))
                          ],
                        ),

                  // ListView.builder( itemCount: 20,itemBuilder: (context, index) {
                  //   return Container(
                  //     height: Get.height / 20,
                  //     child: Row(
                  //       children: [Image.asset('assets/images/copy.png')],
                  //     ),
                  //   );
                  // }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainNet {
  final int networkindex;
  final String coinname;
  final String coinimage;

  MainNet(
      {required this.networkindex,
      required this.coinimage,
      required this.coinname});

  static List<MainNet> mainnetworklist = [
    MainNet(
        networkindex: 0,
        coinimage: 'assets/images/bsc.png',
        coinname: 'Binance  Mainnet'),
    MainNet(
        networkindex: 1,
        coinimage: 'assets/images/tron.png',
        coinname: 'Tron  Mainnet'),
  ];
}

class TestNetwork {
  final int testnetworkindex;
  final String coinname;
  final String coinimage;

  TestNetwork(
      {required this.testnetworkindex,
      required this.coinimage,
      required this.coinname});

  static List<TestNetwork> testnetworklist = [
    TestNetwork(
        testnetworkindex: 0,
        coinimage: 'assets/images/letter-g.png',
        coinname: 'Georila'),
    TestNetwork(
        testnetworkindex: 1,
        coinimage: 'assets/images/letter-l.png',
        coinname: 'Linea Georila'),
    TestNetwork(
        testnetworkindex: 2,
        coinimage: 'assets/images/letter-s.png',
        coinname: 'Sepolia'),
  ];
}

//

//
class ButtonTabs {
  final String img;
  final String btntapname;
  final String? nav;

  void Function()? Pressed;

  ButtonTabs({
    this.Pressed,
    required this.img,
    required this.btntapname,
    this.nav,
  });

  static List<ButtonTabs> btntaps = [
    ButtonTabs(
      img: 'assets/icons/plus-minus.png',
      btntapname: 'Buy & Sell',
      nav: "",
    ),
    ButtonTabs(
        img: 'assets/icons/send.png',
        btntapname: 'Send',
        nav: "/Send()",
        Pressed: () {
          print("dfbnihbsighhfg");
          Get.to(Send());
        }),
    ButtonTabs(
        img: 'assets/icons/exchange.png',
        btntapname: 'Swap',
        Pressed: () => Get.to(Swap())),
    ButtonTabs(
        img: 'assets/icons/receive.png',
        btntapname: 'Receive',
        Pressed: () {
          Get.to(Receive());
        }),
    ButtonTabs(img: 'assets/icons/stock.png', btntapname: 'Portfolio'),
  ];
}

List menuicon = [
  Icon(Icons.menu, color: Colors.white),
  Icon(Icons.send_to_mobile, color: Colors.white),
  Icon(Icons.wifi, color: Colors.white),
  Icon(Icons.expand, color: Colors.white),
  Icon(Icons.chat, color: Colors.white),
];
List menutxt = [
  Text(
    'Account detils',
    style: TextStyle(color: Colors.white),
  ),
  Text(
    'View in Explorer',
    style: TextStyle(color: Colors.white),
  ),
  Text(
    'Connected sites',
    style: TextStyle(color: Colors.white),
  ),
  Text(
    'Expanded View',
    style: TextStyle(color: Colors.white),
  ),
  Text(
    'Support',
    style: TextStyle(color: Colors.white),
  ),
];
