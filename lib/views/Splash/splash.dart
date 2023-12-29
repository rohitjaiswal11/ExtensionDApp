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
//  late var  _controller;

  @override
  void initState() {
  
    getdata();


    print("wallet Tron splash   " + ConstantClass.walletTron.toString());

    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                //BottomNavigation(index: 0),
                ConstantClass.walletBsc == null ? Register() : MyHomePage()),
      ),
    );

    // TODO: implement initState
    super.initState();
  }



  getdata() async {
    if (await paastoprint()) {
      setState(() {});

      printfun();
    }
  }  Future<bool> paastoprint() async {
    await ConstantClass.getWallet();
    print("paastoprint Executed");
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCustom.black,
      body: Center(
        child: Container(
            width: CustomDimension.mywidth(context),
            height: CustomDimension.myheight(context) / 1.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  CustomImages.splash,
                  height: Get.height * 0.3,
                  width: Get.height * 0.3,
                ),
                SizedBox(
                  height: Get.height * 0.09,
                ),
                CircularProgressIndicator(
                  color: Colors.green,
                )
              ],
            )),
      ),
    );
  }

  void printfun() {
    print(" ConstantClass.name   ${ConstantClass.Name}");
    print(" ConstantClass.walletBsc   ${ConstantClass.walletBsc}");
    print(" ConstantClass.walletTron   ${ConstantClass.walletTron}");
    print(" ConstantClass.walletBsc   ${ConstantClass.walletBsc}");
  }
}
