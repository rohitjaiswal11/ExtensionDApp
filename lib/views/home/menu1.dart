// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu1 extends StatelessWidget {
  String btname;
  String amount;
  String? image;
  Color? colr;
  VoidCallback press;   
  Menu1({
    required this.press,
    required this.btname,
    this.image,
    this.colr,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.zero,
            child: Image.asset(
              image ?? "assets/icons/lock.png",
              height: 20,
            ),
          ),
          Text(
            "\$${amount.toString()}",
            style: TextStyle(
                fontSize:10,
                fontWeight: FontWeight.w600,
                color: colr ?? Colors.grey.shade700),
          ),
          Text(
            btname,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: colr ?? Colors.grey.shade700),
          )
        ],
      ),
    );
  }
}
