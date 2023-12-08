import 'package:extensionapp/views/home/topbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class Swap extends StatefulWidget {
  const Swap({super.key});

  @override
  State<Swap> createState() => _SwapState();
}

class _SwapState extends State<Swap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Topbar(),
          Container(
            color: Colors.black,
            //  Get.isDarkMode ? Colors.black : Colors.white,
            height: Get.height * 0.08,
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back, color: Colors.grey.shade300
                        // Get.isDarkMode ? Colors.grey : Colors.black,
                        )),
                Text(
                  "Swap",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: Colors.grey.shade300,
                    ))
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  height: 20,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                )
              ],
            ),
          )
        ],
      ),


      
    );
  }
}
