import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../Utils/Colors copy.dart';
import '../../Utils/Constant.dart';
import '../../Utils/Dimensions.dart';
import '../../Utils/customfonts.dart';
import '../home/home.dart';

class Receive extends StatefulWidget {
  @override
  _ReceiveState createState() => _ReceiveState();
}

class _ReceiveState extends State<Receive> {
  String generatedQrCode = ConstantClass.currentIndex == 0
      ? ConstantClass.walletBsc!
      : ConstantClass.walletTron!;
      String Cointype= (ConstantClass.currentIndex == 0?"Binance":Text("Tron")).toString();

//  final ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      //  backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 30, vertical: Get.height / 40),
              child: Stack(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.white)),
                ),
                const Center(
                  child: Text(
                    "Receive",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.to(MyHomePage());
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: Get.height * 0.4,
              width: Get.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    ConstantClass.currentIndex == 0
                        ? ConstantClass.walletBsc!
                        : ConstantClass.walletTron!,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: Get.height / 60,
                  ),
                  // generatedQrCode.isNotEmpty
                  //     ?
                  QrImageView(
                    size: CustomDimension.myheight(context) / 4,
                    eyeStyle: QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                      color: Colors.black,
                    ),
                    padding: EdgeInsets.all(15),
                    dataModuleStyle: QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.circle,
                        color: Colors.black),
                    data: generatedQrCode.toString(),
                    version: QrVersions.auto,
                    gapless: false,
                    backgroundColor: ColorsCustom.white,
                  )
                  //  : Container(),
                ],
              ),
            ),
            SizedBox(
              height: Get.height / 30,
            ),
            Text(
              "Send only $Cointype network coin to this address.\nSending any other coins may result in \npermanent loss.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,color: Colors.white30,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: Get.height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    String Cliptext = controller.text.toString();
                    print("Copppppied" + Cliptext);
                    Clipboard.setData(ClipboardData(text: Cliptext)).then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Copied to your clipboard!'),
                        ),
                      );
                    });
                  },
                  child: rowBottomMenu(
                    "assets/images/copy2.png",
                    "Copy",
                    Colors.orange,
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AddAmountDialog(
                        onAmountAdded: (amount) {
                          generateQrCode(amount);
                        },
                      ),
                    );
                  },
                  child: rowBottomMenu(
                    "assets/images/amount.png",
                    "Set Amount",
                    Colors.red.shade400,
                  ),
                ),
                // InkWell(
                //   onTap: () {
                // //    captureAndShareScreenshot();
                //   },
                //   child: rowBottomMenu(
                //     "assets/qr/share.png",
                //     "Share",
                //     Colors.green,
                //   ),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column rowBottomMenu(String img, String txt, Color ttcolor) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          height: Get.height / 15,
          width: Get.height / 15,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Image.asset(img),
        ),
        SizedBox(
          height: Get.height / 40,
        ),
        Text(
          txt,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: ttcolor,
          ),
        )
      ],
    );
  }

  // Future<void> captureAndShareScreenshot() async {
  //   try {
  //     final Uint8List? imageBytes =
  //         await screenshotController.capture(pixelRatio: 3.0);

  //     if (imageBytes != null) {
  //       final directory = await getTemporaryDirectory();
  //       final filePath = '${directory.path}/screenshot.png';
  //       File(filePath).writeAsBytesSync(imageBytes);
  //     }
  //     Share.share('Check out my screenshot!');
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  void generateQrCode(String amount) {
    if (amount.isNotEmpty) {
      // You can customize the QR code data as needed
      setState(() {
        generatedQrCode =
            '${ConstantClass.currentIndex == 0 ? ConstantClass.walletBsc! : ConstantClass.walletTron!} $amount';
      });
    } else {
      // Handle empty amount
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            'Please enter a valid amount.',
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    }
  }
}

class AddAmountDialog extends StatelessWidget {
  final TextEditingController amountController = TextEditingController();
  final Function(String) onAmountAdded;

  AddAmountDialog({required this.onAmountAdded});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade800,
      title: CustomFonts.Text17("Set Amount", Colors.white),
      content: TextField(
        controller: amountController,
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.white),


        decoration: InputDecoration(
            focusColor: Colors.white,
            labelText: 'Enter Amount',
            labelStyle: TextStyle(fontSize: 13, color: Colors.white)),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: CustomFonts.text14("Cancel", ColorsCustom.white),
        ),
        TextButton(
          onPressed: () {
            String amount = amountController.text.trim();
            onAmountAdded(amount);
            Navigator.of(context).pop();
          },
          child: CustomFonts.text14("Set Amount", ColorsCustom.white),
        ),
      ],
    );
  }
}
