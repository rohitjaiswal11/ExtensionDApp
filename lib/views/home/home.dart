// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:extensionapp/views/Utils/sharedpref.dart';
import 'package:extensionapp/views/home/home_const.dart';
import 'package:extensionapp/views/send/send.dart';
import 'package:extensionapp/views/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

 String cliptext='account';
 getcliptext()async{
  cliptext=  await SharedPreferencesManager().readString('publickey');
  setState(() {
    
  });

}


  late TabController _tabController;
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {

  //     _counter++;
  //   });
  // }
  @override
  void initState() {
    super.initState();
    getcliptext();

    _tabController = TabController(length: 3, vsync: this);
  }

  // bool isSwitched = false;

  // void toggleSwitch(bool value) {
  //   if (isSwitched == false) {
  //     setState(() {
  //       isSwitched = true;
  //     });
  //     print('Switch Button is $isSwitched');
  //   } else {
  //     setState(() {
  //       isSwitched = false;
  //     });
  //     print('Switch Button is OFF');
  //   }
  // }

  bool isdata = false;
  var selectedItem = '';
  _launchURL() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  // String img = 'assets/images/ethlogo.png';
  // toptaphandler(String img2) {
  //   print(img2);
  //   setState(() {
  //     img=img2;
  //   });
  //    Get.back();
  
  // }
  
  @override
  Widget build(BuildContext context) {
 
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
              onTap: () {Clipboard.setData(ClipboardData(text: cliptext));
                Fluttertoast.showToast(
                    msg: 'Copied',
                    toastLength: Toast.LENGTH_SHORT,
                    webPosition: 'center',
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    // backgroundColor: Colors.white,
                    // webBgColor: Colors.white,
                    textColor: Colors.black);
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue.shade400,
                  ),
                  height: Get.height / 20,
                  width: Get.width / 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: Get.width / 6,
                        child: Text( 
                                   cliptext,
                                  
                          style: TextStyle(
                              color: Colors.blue.shade900, fontSize: 13, fontWeight: FontWeight.w300),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                        child: Image.asset(
                          'assets/images/copy.png',
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Text('0 ETH', style: TextStyle(color: Colors.white, fontSize: 35)),
            SizedBox(
              height: 5,
            ),
            Text('\$ 0.00 USD ',
                style: TextStyle(color: Colors.white, fontSize: 15)),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ListView.builder(shrinkWrap: true,
                //     itemCount: ButtonTabs.btntaps.length,
                //     itemBuilder: (context, index) {
                //       return
          
                for (int i = 0; i < ButtonTabs.btntaps.length; ++i)
                  Column(
                    children: [
                      InkWell(

                        onTap: () {

                          Get.to(Send());
                          //Get.toNamed(ButtonTabs.btntaps[i].nav.toString());
                        },
                        child: Container(
                        //   height: Get.height / 8,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          width: Get.width / 9,
                          decoration: BoxDecoration(
                              color: Colors.blue, shape: BoxShape.circle),
                          child: Padding(
                              padding: EdgeInsets.all(2),
                              child: Image.asset(ButtonTabs.btntaps[i].img,
                                  fit: BoxFit.contain)),
                        ),
                      ),
                      Text(
                        ButtonTabs.btntaps[i].btntapname,
                        style: TextStyle(color: Colors.white),
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
              //color: Colors.blueAccent,
              height: Get.height / 20,
              child: TabBar(
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.blue.shade900,
                  labelColor: Colors.blue,
                  labelStyle: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
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
                          padding: EdgeInsets.all(20),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.all(10),
                                  height: Get.height / 17,
                                  child: Row(
                                    children: [
                                      Image.asset('assets/images/ethlogo.png'),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Etherium",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text("0 ETH",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 13))
                                        ],
                                      ),
                                      Spacer(),
                                      Text("\$0.00",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w100,
                                              fontSize: 13))
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
                        TextButton.icon(
                            style: ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15)),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.blue)),
                            onPressed: () {},
                            icon: Icon(Icons.refresh),
                            label: Text('Refresh list')),
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
                                          Image.asset('assets/images/ethlogo.png')
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
                                          Image.asset('assets/images/ethlogo.png')
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

List<String> mainnet = [
  'assets/images/ethlogo.png',
  'assets/images/linealogo.jpg'
];

class TestNetwork {
  final String coinname;
  final String coinimage;

  TestNetwork({required this.coinimage, required this.coinname});

  static List<TestNetwork> testnetworklist = [
    TestNetwork(coinimage: 'assets/images/letter-g.png', coinname: 'Georila'),
    TestNetwork(
        coinimage: 'assets/images/letter-l.png', coinname: 'Linea Georila'),
    TestNetwork(coinimage: 'assets/images/letter-s.png', coinname: 'Sepolia'),
  ];
}

//

//
class ButtonTabs {
  final String img;
  final String btntapname;
final String ?nav;

  ButtonTabs({required this.img, required this.btntapname, this.nav, });

  static List<ButtonTabs> btntaps = [
    ButtonTabs(img: 'assets/icons/plus-minus.png', btntapname: 'Buy & Sell', nav:""),
    ButtonTabs(img: 'assets/icons/send.png', btntapname: 'Send', nav:"/Send()"),
    ButtonTabs(img: 'assets/icons/exchange.png', btntapname: 'Swap'),
    ButtonTabs(img: 'assets/icons/bridge.png', btntapname: 'Bridge'),
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

