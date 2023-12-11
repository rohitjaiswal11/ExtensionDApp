

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletconnect_flutter_v2/apis/core/verify/verify.dart';

import '../../Utils/Dimensions.dart';
import '../../Utils/custombtn.dart';
import '../../Utils/customfonts.dart';
import 'VerifyMnemonics.dart';

class Wallet_Created_Success extends StatefulWidget {
  const Wallet_Created_Success({super.key});

  @override
  State<Wallet_Created_Success> createState() => _Wallet_Created_SuccessState();
}

class _Wallet_Created_SuccessState extends State<Wallet_Created_Success> {
  @override

  Widget build(BuildContext context) {
    return Scaffold( appBar:AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: CustomDimension.myheight(context) / 9,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,
                size: 32, color: Get.isDarkMode ? Colors.white : Colors.black)),
        centerTitle: true,
        title: CustomFonts.heading20(
            'Success', Get.isDarkMode ? Colors.white : Colors.black),
      ),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Center(
            child: Image.asset(
          "assets/images/checked.png",
          height: Get.height * 0.2,
        )),
        CustomFonts.heading18("Success", Colors.black26),
        Spacer(),
        CustomButton(btnname: "Backup", pressed: () {



       //   Get.to(BackupMnemonics());
        }),
        SizedBox(
          height: Get.height * 0.05,
        )
      ],
    ));
  }
  }
