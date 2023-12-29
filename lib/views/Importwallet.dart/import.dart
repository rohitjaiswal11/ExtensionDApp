import 'package:convert/convert.dart';
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:extensionapp/Blockchain/blockchain%20.dart';
import 'package:extensionapp/Utils/Constant.dart';
import 'package:extensionapp/Utils/custombtn.dart';
import 'package:extensionapp/Utils/customfonts.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:extensionapp/export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hd_wallet/hd_wallet.dart';
import 'package:hex/hex.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils/Dimensions.dart';
import '../../Utils/common.dart';
import '../../Utils/sharedpref.dart';
import 'importsuccess.dart';

class ImportWalletPage extends StatefulWidget {
  const ImportWalletPage({super.key});

  @override
  State<ImportWalletPage> createState() => _ImportWalletPageState();
}

class _ImportWalletPageState extends State<ImportWalletPage> {
    savedata() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
     

    await prefs.setString('wallet', ConstantClass.walletBsc.toString());
    await prefs.setString('privatekeyBsc', ConstantClass.privateKeyBsc.toString());
    await prefs.setString('seedPhrase', ConstantClass.mnemonic.toString());
    await prefs.setString('name', ConstantClass.Name.toString());
    await prefs.setString('password', ConstantClass.password.toString());
    await prefs.setString('fakewallet', ConstantClass.fakewallet.toString());
    await prefs.setBool('DontShowkeystore', false);
    await prefs.setBool('DontShowprivate', false);
    await prefs.setBool('DontShowmnemonic', false);

  }

  List<String> _values = [];
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  String? hint = "Enter Import your mnemonic, \nPrivate Key, or keystor....";
  String? Valid;
  bool isValid = false;
  bool nextbool = false;
  bool next = false;
  bool load = false;
  _onDelete(index) {
    setState(() {
      _values.removeAt(index);
    });
    if (_values.isEmpty) {
      setState(() {
        hint = "Enter Import your mnemonic, \nPrivate Key, or keystor....";
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: CustomDimension.myheight(context) / 9,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,
                size: 32, color: Get.isDarkMode ? Colors.white : Colors.black)),
        centerTitle: true,
        title: CustomFonts.heading20(
            'Import Wallet', Get.isDarkMode ? Colors.white : Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
            // CustomFonts.text16ex("Input", Colors.black),

            SizedBox(height: Get.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Input',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 17),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
                height: Get.height / 2.5,
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.05, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 5.0,
                      spreadRadius: 5, //New
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TagEditor(
                      length: _values.length,
                      controller: _textEditingController,
                      focusNode: _focusNode,
                      delimiters: [',', ''],
                      hasAddButton: false,
                      resetTextOnSubmitted: true,
                      // This is set to grey just to illustrate the `textStyle` prop
                      textStyle: const TextStyle(color: Colors.grey),
                      onSubmitted: (outstandingValue) {
                        setState(() {
                          hint = "";
                          _values.add(outstandingValue);
                        });
                      },
                      inputDecoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                        hintText: hint.toString(),
                      ),

                      onTagChanged: (newValue) {
                        setState(() {
                          _values.add(newValue);
                        });
                      },
                      tagBuilder: (context, index) => _Chip(
                        index: index,
                        label: _values[index],
                        onDeleted: _onDelete,
                      ),
                      // InputFormatters example, this disallow \ and /
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'[/\\]'))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Visibility(
                          visible: ConstantClass.Imported_mnemonic == ""
                              ? false
                              : true,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                hint =
                                    "Enter Import your mnemonic, \nPrivate Key, or keystor....";
                                _textEditingController.text = "";
                                ConstantClass.Imported_mnemonic = "";

                                _values.clear();
                              });
                            },
                            child: CustomFonts.text14600(
                              "clear",
                              Color(0xFFDE5151),
                            ),
                          ),
                        ),
                        SizedBox(width: Get.width / 12),
                        InkWell(
                          onTap: () {
                            Clipboard.getData(Clipboard.kTextPlain)
                                .then((value) {
                              print("my data ????????? " +
                                  value!.text.toString());
                              setState(() {
                                ConstantClass.Imported_mnemonic = value.text
                                    .toString()
                                    .split(' ')
                                    .where((word) => word.isNotEmpty)
                                    .toList();
                                print("my data ????????? " +
                                    ConstantClass.Imported_mnemonic.toString());
                              });
                            }).then((value) {
                              setState(() {
                                _values = ConstantClass.Imported_mnemonic;
                                hint = "";
                                print(_values.toString() + "memememememmememe");

                                // widget.Scanned=true;
                                // reload();
                              });
                            });
                          },
                          child: CustomFonts.text14600(
                            "Paste",
                            Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: Get.height * 0.3,
            ),

            Positioned(
              top: 10,
              width: Get.width * 0.0,
              child: load == true
                  ? Container(
                      height: Get.height / 15,
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Get.isDarkMode ? Colors.white : Colors.black

                          //Theme.of(context).primaryColor
                          ),
                      child: LoadingAnimationWidget.threeRotatingDots(
                        color: Colors.white,
                        size: 30,
                      ))
                  : CustomButton(
                      btnname: "Next Step",
                      pressed: () {
                        setState(() {
                          load = true;
                        });

                        // if(load==true){
                        // importfunction(_values.toString())
                        //   .then((_) {
                        //     Get.to(ImportSuccess());
                        //   });}
                        importfunction(_values.toString());

                        savedata();
                        Get.to(ImportSuccess());
                      }),
            )
          ]),
        ),
      ),
    );
  }

  importfunction(String mnemonics) {
    bool isValid = bip39.validateMnemonic(mnemonics);
    if (isValid == true) {
      print("----valid mnemonoics--------");
      String mnemonicsfetched = _values.toString();
     Blockchain().walletaddresstron(mnemonicsfetched);

      // Blockchain().walletaddressBSc(mnemonicsfetched);
    } else {
      print("-----Invalid mnemonoics--------");

      String mnemonicsfetched = _values.toString();
      Blockchain().walletaddresstron(mnemonicsfetched);

      Blockchain().walletaddressBSc(mnemonicsfetched);
    }
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
