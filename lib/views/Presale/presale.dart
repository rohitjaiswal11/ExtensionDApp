// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:extensionapp/Utils/dialogwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Utils/Colors copy.dart';
import '../../Utils/Dimensions.dart';
import '../../Utils/custombtn.dart';
import '../../Utils/customfonts.dart';


class presale extends StatelessWidget {
  const presale({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
  
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          
          
          crossAxisAlignment: CrossAxisAlignment.start,
          
           children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height / 40),
              child: Stack(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.white)),
                ),
                Center(
                  child: Text(
                    "Presale",
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  ),
                ),
            
              ]),
            ),
            Text(
              "Recipient Address",
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            ),
        
            SizedBox(
        
              height:10
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Container(
                    width: Get.width * 0.7,
                    height: Get.height * 0.06,
                    child: Padding(
                      padding: EdgeInsets.only(left:10,),
                      child: TextFormField(    style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                           enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                            disabledBorder: InputBorder.none),
                      ),
                    )),
                // container_grey(
                //     height: Get.height / 20,
                //     w1: Padding(
                //       padding: const EdgeInsets.all(10.0),
                //       child: Image.asset("assets/icons/receive.png"),
                //     )),
               Container(
                    width: Get.width / 6,
                    height: Get.height / 18,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "Paste",
                      style: TextStyle(color:Colors.white, fontSize: 15),
                    ))),
              ],
            ),
          SizedBox(
            height: 30,
          ),
          Text(
              "Total Amount",
              style: TextStyle(color:Colors.white,fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10,),
            Container(
       
              
                height: Get.height / 20,
                width: Get.width*0.9,     
                child: Padding(
                 padding: EdgeInsets.only(left:10,),
                  child: TextFormField(    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                               enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: InputBorder.none),
                  ),
                )),
          SizedBox(
            height: 25,
          ),
        
          Text(
            "Sending Amount",
            style: TextStyle(color:Colors.white,
              fontSize: 16),
          ),
        
        
        
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                       height: Get.height / 15,
                 width: Get.width * 0.7,
                  child: Padding(
                    padding: EdgeInsets.all(7),
                    child: TextFormField(    style: TextStyle(color: Colors.white),
                      scrollPadding: EdgeInsets.only(left: 40),
                      decoration: InputDecoration(

                               enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                    
                        errorBorder: InputBorder.none,
                        // contentPadding:
                        // EdgeInsets.only(left: 15, bottom: 11, top: 0, right: 15),
                        // hintText: "21",
                        hintStyle: TextStyle(
                            color: Colors.black
                        ),
                        // hintText: "21",
                        
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  )),
        
        
              GestureDetector(
                onTap: () {
                  // calculate();
                },
              child: Container(
                    //   width:Get.height * 0.06,
                    height: Get.height * 0.07,
                    padding: EdgeInsets.all(
                      10,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child:
                        Center(child: CustomFonts.text15("Max", Colors.white))),
              ),
            ],
          ),
        
        SizedBox(height: Get.height*0.07,),
        Center(
          child: Container(
              
          // width: Get.width,
          padding: const EdgeInsets.all(15.0),
          child: btncustom(
              btntxt: "SEND",
              BtnPressed: () {
                // Get.to(SelectCrypto());
              }, ),
              ),
        ),
        ]),
      ),

    );
  }


}

class container_grey extends StatelessWidget {
  Widget w1;
  double? height;
  double? width;

  container_grey({
    Key? key,
    required this.w1,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(10)),
      child: w1,
    );
  }
}