import 'dart:convert';

import 'package:extensionapp/Utils/Colors%20copy.dart';
import 'package:extensionapp/Utils/Constant.dart';
import 'package:extensionapp/Utils/customfonts.dart';
import 'package:extensionapp/export.dart';
import 'package:extensionapp/views/CreationWallet/VerifyMnemonics.dart';
import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

import '../../Utils/Dimensions.dart';
import '../../Utils/customimages.dart';

class BackUp_Mnemonic extends StatefulWidget {
  bool? view;
   BackUp_Mnemonic({super.key,this.view});

  @override
  State<BackUp_Mnemonic> createState() => _BackUp_MnemonicState();
}

class _BackUp_MnemonicState extends State<BackUp_Mnemonic> {

  List<String> mimonic=ConstantClass.mnemonic.toString().split(" ");

  Future<void> showQR(BuildContext context) async {
    return await showDialog(
        useSafeArea: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: ColorsCustom.white,
              shadowColor: ColorsCustom.grey,
              insetPadding: EdgeInsets.symmetric(horizontal: 15),
              contentPadding: EdgeInsets.all(20),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomFonts.heading18("Mnemonic's QR Code",ColorsCustom.black),
                  SizedBox(height: Get.height*0.5,),
                  Container(
                    height: 350,
                    width: CustomDimension.mywidth(context),
                    child: Center(
                      child: QrImageView(
                        data: ConstantClass.mnemonic.toString(),
                        version: QrVersions.auto,
                      ),
                    ),
                  ),
              ]),
              //   title: CustomFonts.heading16("Filter",ColorsCustom.black),
              actions: <Widget>[
                InkWell(
                  child: Container(
                    width: CustomDimension.mywidth(context),
                    padding: EdgeInsets.only(top: 10,bottom: 10,right: 20,left: 20),
                    decoration: BoxDecoration(
                        boxShadow:  [
                          BoxShadow(
                            color: Colors.grey,
                          )
                        ],
                        borderRadius: BorderRadius.circular(5),
               color: Colors.black
                    ),
                    child: Center(child: CustomFonts.text13("Close", ColorsCustom.white)),
                  ),
                  onTap: () {
                      // Do something like updating SharedPreferences or User Settings etc.
                      Navigator.of(context).pop();

                  },
                ),
              ],
            );
          });
        });
  }
  @override
  void initState() {
   //saveHistory();
    // TODO: implement initState
    super.initState();
  }



  // Future<void> saveHistory() async {
  //   var time = DateTime.now();
  //   String Time = DateFormat('yyyy-MM-dd HH:mm').format(time);
  //   ConstantClass.backupHistory.add(BackupHistory(
  //     accname: "Mnemonic",
  //     time: Time.toString(),
  //   ));

  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String> history = ConstantClass.backupHistory.map((item) => jsonEncode(item.toMap())).toList();
  //   await prefs.setStringList('Backuphistory',history);




  // }


  @override
  Widget build(BuildContext context) {

    final appbar = AppBar(backgroundColor: ColorsCustom.transparent,
      automaticallyImplyLeading: false, // Don't show the leading button
      toolbarHeight: CustomDimension.myheight(context)/9,
      leading:   InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,
              size: 32, color: ColorsCustom.black)),
      centerTitle: true,
      title: CustomFonts.heading20('Back Up Mnemonic', ColorsCustom.black),
    );

    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: CustomDimension.myheight(context),
          padding: EdgeInsets.symmetric(horizontal: 20),
          // color: Colors.red,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: CustomDimension.myheight(context)/35,),
            CustomFonts.text12("Please Write down the following words in the correct order.", ColorsCustom.black54),
            SizedBox(height: CustomDimension.myheight(context)/35,),
            GridView.count(
              crossAxisCount:3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: (1 / .4),
              shrinkWrap: true,
              children: List.generate(mimonic.length, (index) {
                return Container(
                    height: Get.height*0.01,
                   padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: ColorsCustom.black12),

                    ),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Center(child: CustomFonts.text14600(mimonic[index], ColorsCustom.black)),
                        CustomFonts.heading20((index+1).toString(), ColorsCustom.black.withOpacity(0.3))

                      ],
                    ));
              }),
            ),
            SizedBox(height: CustomDimension.myheight(context)/35,),
            InkWell(
              onTap: (){
                showQR(context);
              },
              child: Container(
                 height: Get.height*0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: ColorsCustom.black12),),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.qr_code_scanner,size: 30.0,color: ColorsCustom.black),
                      SizedBox(width: 10,),
                      CustomFonts.text14("Mnemonic QR Code", ColorsCustom.black),
                    ],
                  )
              ),
            ),
            SizedBox(height: CustomDimension.myheight(context)/25,),
            Row(
              children: [
                CustomImages.Customimg(context, CustomImages.idea,scale:1.5),
                SizedBox(width: 10,),
                CustomFonts.text14("Keep Mnemonic Safe", ColorsCustom.black),
              ],
            ),
            SizedBox(height: CustomDimension.myheight(context)/55,),
            CustomFonts.text12("Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore et doloremagna aliqua. Ut enim ad minim veniam, quis nostrudexercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit involuptate velit esse cillum dolore eu fugiat nulla pariatur.Lorem ipsum dolor sit amet.", ColorsCustom.black.withOpacity(0.5)) ,             // SizedBox(height: 10,),
              //   Spacer(),

               // SizedBox(height: 5),


    ],
          ),
        ),
      ),
      bottomSheet:Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: InkWell(
        onTap: (){
        Get.to(Verify_Mnemonic());
        //  widget.view==true? Navigator.of(context).push(MaterialPageRoute(
        //       builder: (context) => BottomNavigation(index: 3,))):
        //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => Verify_Mnemonic()));
        },
        child: Container(
          alignment: Alignment.bottomCenter,
          height: CustomDimension.myheight(context)/15,
          width: CustomDimension.myheight(context),
        
          decoration:   const BoxDecoration(
            borderRadius:BorderRadius.all(Radius.circular(10)),
       color: Colors.black
          ),
          child: Center(child: CustomFonts.text15("Already Back Up", ColorsCustom.white)),
        ),
      ),
    ),
    );
  }
}
