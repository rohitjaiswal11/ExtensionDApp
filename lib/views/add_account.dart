import 'package:extensionapp/views/Utils/dialogwidget.dart';
import 'package:extensionapp/views/send/send.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AddAccount extends StatelessWidget {
  const AddAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogCustom(      
      titletxt: "Add Account",
    //  cheight: Get.height * 0.4,
      cwidth: Get.width,
      txtfieldname: 'Account name',
      hnttxt: 'Account 3',


    );
  }
}
