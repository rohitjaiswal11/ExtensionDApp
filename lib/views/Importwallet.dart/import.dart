import 'package:extensionapp/Utils/Constant.dart';
import 'package:extensionapp/Utils/custombtn.dart';
import 'package:extensionapp/Utils/customfonts.dart';
import 'package:extensionapp/Utils/customimages.dart';
import 'package:extensionapp/export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_tag_editor/tag_editor.dart';

import 'importsuccess.dart';

class ImportWalletPage extends StatefulWidget {
  const ImportWalletPage({super.key});

  @override
  State<ImportWalletPage> createState() => _ImportWalletPageState();
}

class _ImportWalletPageState extends State<ImportWalletPage> {
  List<String> _values = [];
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  String? hint = "Enter Import your mnemonic, \nPrivate Key, or keystor....";
  String? Valid;
  bool isValid = false;
  bool nextbool = false;
  bool next = false;

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
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        title: CustomFonts.heading18("Import Wallet", Colors.black),
        centerTitle: true,
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
              child: CustomButton(
                  btnname: "Next Step",
                  pressed: () {
                    Get.to(ImportSuccess());
                  }),
              width: Get.width * 0.0,
            )
          ]),
        ),
      ),
    );
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
