import 'dart:convert';

import 'package:extensionapp/views/home/packageControler.dart';
import 'package:get/get.dart';

import '../../Utils/Constant.dart';
import '../../Utils/snackbar.dart';
import '../../data/base/preferences.dart';
import 'Repo.dart';

class ExtensionController extends GetxController implements GetxService {

String funding = '', presale = '', referalamount = '';



  LoginCheck() async {
    String address =
        await SharedPreferenceClass.GetSharedData(AppContant.Walletaddres);
    final paramDic = {"wallet_address": "$address"};



      // try {
      //   var data = json.decode(value.body);
      //   if (data['status'] == 200) {
      //     presale = data['data']['presale_stake_amount'].toString();
      //     funding = data['data']['seed_funds_stake_amount'].toString();
      //     referalamount = data['data']['referral_amount_earned'].toString();
      //   }
      // } 
      // catch (e) {
      //   showCustomSnackBar(message: e.toString());
      // }
      // update();






    AuthRepo().Login(paramDic).then((value) async {
      try {
        var data = json.decode(value.body);
        if (data['status'] == 200) {
          presale = data['data']['presale_stake_amount'].toString();
          funding = data['data']['seed_funds_stake_amount'].toString();
          referalamount = data['data']['referral_amount_earned'].toString();
        }
      } 
      catch (e) {
        showCustomSnackBar(message: e.toString());
      }
      update();
    });

    // Get.find<Package_update>().packageinfo();
  }








}