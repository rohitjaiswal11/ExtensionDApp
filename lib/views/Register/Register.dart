import 'package:extensionapp/Utils/customfonts.dart';
import 'package:extensionapp/Utils/customimages.dart';
import 'package:extensionapp/Utils/custombtn.dart';
import 'package:extensionapp/Utils/dialogwidget.dart';
import 'package:extensionapp/views/Importwallet.dart/import.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../CreationWallet/create.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.04,
          ),
          Container(
            child: Center(
                child: CustomFonts.heading18(
              "Dapp Extension",
              Colors.black,
            )),
          ), 
          Container(
              padding: EdgeInsets.all(10),
              height: Get.height * 0.7,
              width: Get.width * 0.8,
              child:CustomImages.setAssetImage(CustomImages.intro , fit: BoxFit.contain)),
          CustomButton(
            btnname: "Create Account",
            pressed: () {



             Get.to(Create_Wallet());
            },
            width: Get.height * 0.5,
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          CustomButton(
            btnname: "Import Account",
            pressed: () {


              Get.to(ImportWalletPage());
            },
            width: Get.height * 0.5,
          )
        ],
      ),
    );
  }
}
