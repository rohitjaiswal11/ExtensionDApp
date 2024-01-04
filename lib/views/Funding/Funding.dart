// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Utils/Constant.dart';
import '../../Utils/custombtn.dart';
import '../../Utils/snackbar.dart';
import '../../data/base/preferences.dart';
import '../home/ExtensionController.dart';
import '../home/Repo.dart';
import 'Search.dart';

class funding extends StatefulWidget {
  funding({super.key});

  @override
  State<funding> createState() => _fundingState();
}

class _fundingState extends State<funding> {
  // late TextEditingController funding;
  TextEditingController amountController = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController Amount = TextEditingController();
  TextEditingController otpfield = TextEditingController();
  TextEditingController Balance = TextEditingController(text: '0.0');
  String? senderid, OTP;
  bool otp = false, click = false;
  List search = [];
  final _formKey = GlobalKey<FormState>();
  String args = '';
  @override
  void initState() {
    args = Get.arguments;
    getdata();
    super.initState();
  }

  getdata() async {
    var data;
    if (args.toString() == 'Funding') {
      data = Get.find<ExtensionController>().funding.toString();
    } else {
      data = Get.find<ExtensionController>().presale.toString();
    }

    senderid = await SharedPreferenceClass.GetSharedData(AppContant.id);
    Balance.text = data.toString();
    setState(() {});
  }

  @override
  void dispose() {
    Amount.text = "";
    id.text = "";
    otpfield.text = "";
    Balance.text = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // appBar: CustomAppBar(title: args.toString(), backbool: true),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "User ID",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(Search())!.then((value) {
                      if (value.toString().isNotEmpty &&
                          value.toString() != "null") {
                        id.text = value.toString();
                        setState(() {});
                      }
                    });
                  },
                  child: container_grey(
                      width: Get.width * 0.9,
                      w1: Padding(
                        padding: EdgeInsets.only(left: 10, top: 3, bottom: 3),
                        child: TextFormField(
                          controller: id,
                          enabled: false,
                          style: TextStyle(color: Colors.black87),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ' enter userID';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              errorBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none),
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Amount",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            container_grey(
                height: Get.height / 20,
                width: Get.width * 0.9,
                w1: Padding(
                  padding: EdgeInsets.only(left: 10, top: 2, bottom: 2),
                  child: TextFormField(
                    controller: amountController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9][0-9]*'))
                    ],
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black87),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ' enter amount';
                      } else if (double.parse(value.toString()) >
                          double.parse(Balance.text.toString())) {
                        return 'Insufficent funds';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        errorBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none),
                  ),
                )),
            SizedBox(
              height: 25,
            ),
            Text(
              "Total Balance",
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: 10,
            ),
            container_grey(
                width: Get.width * 0.9,
                w1: Padding(
                  padding: EdgeInsets.only(left: 8, top: 3, bottom: 3),
                  child: TextFormField(
                    enabled: false,
                    controller: Balance,
                    style: TextStyle(color: Colors.black87),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            Visibility(
                visible: otp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "OTP",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    container_grey(
                        width: Get.width * 0.9,
                        w1: Padding(
                          padding: EdgeInsets.only(left: 8, top: 3, bottom: 3),
                          child: TextFormField(
                            controller: otpfield,
                            textInputAction: TextInputAction.done,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^[0-9]*'))
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ' enter OTP';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              errorBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        )),
                  ],
                ))
          ]),
        ),
      ),
      bottomSheet: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        width: Get.width,
        padding: const EdgeInsets.all(15.0),
        child: click
            ? SizedBox(
                height: 30,
                width: 30,
                child: Center(child: CircularProgressIndicator()),
              )
            : otp
                ? CustomButton(
                    btnname: "SEND",
                    pressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          click = true;
                        });
                        _Transfer();
                      }
                    })
                : CustomButton(
                    btnname: "Send OTP",
                    pressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          click = true;
                        });
                        senotp();
                      }
                      // Get.to(SelectCrypto());
                    }),
      ),
    );
  }

  _Transfer() {
    final paraDic = {
      "token_amount": amountController.text,
      "sender_id": "$senderid",
      "reciever_id": id.text,
      "otp": otpfield.text,
      "type": args.toString() == 'Funding' ? "2" : '1',
    };
    print(paraDic);
    AuthRepo().TransferFund(paraDic).then((value) {
      var data = json.decode(value.body);
      if (data['status'] == 201) {
        Get.back();
        showCustomSnackBar(message: 'Trastion Done', isError: false);
      } else {
        showCustomSnackBar(message: data['message']);
      }
      click = false;
      setState(() {});
    });
  }

  senotp() {
    final param = {
      "sender_id": senderid.toString(),
    };
    AuthRepo().OTP(param).then((value) {
      var data = json.decode(value.body);
      if (data['status'] == 200) {
        otp = true;
        showCustomSnackBar(message: data['message']);
      } else {
        showCustomSnackBar(message: data['message']);
      }
      click = false;
      setState(() {});
    });
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
      width: width,
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8)),
      child: w1,
    );
  }
}
