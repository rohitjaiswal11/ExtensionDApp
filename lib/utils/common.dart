import 'package:extensionapp/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:toast/toast.dart';

class Common{


 static List<String> accountsCreated = [];

 static List<String> walletcreated=[];
static String ? txtaccountglobal;
static String ?privatekeytxt;
static String ?publicgenerated;



  



  bool isDuplicate(String enteredData, List<String> existingList) {
  for (String item in existingList) {
    if (item == enteredData) {
      return true; // The entered data is a duplicate
    }
  }
  return false; // The entered data is not a duplicate
}




  // void showSnackbar(String message) {
  //   ScaffoldMessenger.of(Get.context!).showSnackBar(
  //     SnackBar(
  //       content: Text(message, selectionColor: Colors.white,),
  //     ),
  //   );
  // }

   void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }



}