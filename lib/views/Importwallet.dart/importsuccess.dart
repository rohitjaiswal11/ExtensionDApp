import 'package:extensionapp/Utils/CustomImages.dart';
import 'package:extensionapp/Utils/custombtn.dart';
import 'package:extensionapp/Utils/customfonts.dart';
import 'package:extensionapp/export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImportSuccess extends StatelessWidget {
  const ImportSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        CustomButton(btnname: "Import", pressed: () {}),
        SizedBox(
          height: Get.height * 0.05,
        )
      ],
    ));
  }
}
