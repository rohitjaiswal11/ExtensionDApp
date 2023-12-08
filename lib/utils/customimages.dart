import 'package:flutter/material.dart';

class CustomImages {
  static Image Customimg(context, String img,
      {double? scale,
      Color? color,
      double? width,
      double? height,
      BoxFit? fit}) {
    return Image.asset(
      img,
      fit: BoxFit.contain,
      scale: scale,
      color: color,
      width: width,
      height: height,
    );
  }

  static Image setAssetImage(String imagePath,
      {Color? color, BoxFit? fit, double? height, double? width}) {
    return Image.asset(
      imagePath,
      fit: fit ?? BoxFit.fill,
      height: height,
      width: width,
      color: color,
    );
  }

  static String intro = "assets/images/intro.png";

  static String successgreen = "assets/images/checked.png";

  /// HOME ...........................................................
  // static String iconwhite = "Assets/Home/iconWhite.png";
  // static String icon = "Assets/Home/icon.png";
  // static String mode = 'Assets/Home/mode.png';
}
