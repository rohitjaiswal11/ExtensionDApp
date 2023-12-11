import 'dart:async';

import 'package:extensionapp/Utils/Dimensions.dart';
import 'package:extensionapp/Utils/customimages.dart';
import 'package:extensionapp/export.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils/Colors copy.dart';
import '../../Utils/Constant.dart';
import '../Register/Register.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
 late var  _controller;

  @override
  void initState() {
    var widtg = CustomDimension.mywidth(context);
    print(":::::::::::::::::::::::::      " + widtg.toString());
    pref();

    ConstantClass.wallet != null ? ConstantClass.getWallet() : "";


    // _controller = Image.asset(CustomImages.splash);
    // _controller.initialize().then((_) {
    //   _controller.setLooping(false);
    //   setState(() {
    //     _controller.play();
    //   });
    // }
    // );

    Timer(
      Duration(seconds: 6),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              //BottomNavigation(index: 0),
              ConstantClass.wallet == null
                  ? Register()
                  : MyHomePage()
        ),
      ),
    );

    // TODO: implement initState
    super.initState();
  }

  Future<void> pref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    ConstantClass.wallet = prefs.getString('wallet');
    ConstantClass.Name = prefs.getString('name');
    ConstantClass.mnemonic = prefs.getString('seedPhrase');
    ConstantClass.password = prefs.getString('password');
    ConstantClass.fakewallet = prefs.getString('fakewallet');
    // ConstantClass.Network = prefs.getString('Network') ??"Pox Testnet";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCustom.black,
      body: 
      

      
      Center(
        child: Container(
            width: CustomDimension.mywidth(context),
            height: CustomDimension.myheight(context) / 1.2,
            child: Column(
              children: [
                Image.asset(
                  CustomImages.splash,
                  height: Get.height * 0.3,
                  width: Get.height * 0.3,
                ),
                SizedBox(height: Get.height*0.09,)
                ,

               CircularProgressIndicator(color: Colors.green,)
              ],
            )),
      ),
    );
  }
}
