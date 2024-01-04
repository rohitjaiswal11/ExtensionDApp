import 'dart:convert';

import 'package:extensionapp/Utils/customfonts.dart';
import 'package:extensionapp/Utils/dialogwidget.dart';
import 'package:extensionapp/views/Funding/Funding.dart';
import 'package:extensionapp/views/send/send.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Utils/Constant.dart';
import '../../Utils/custombtn.dart';
import '../../data/base/preferences.dart';
import '../home/Repo.dart';

class FundHistory extends StatefulWidget {
  const FundHistory({super.key});

  @override
  State<FundHistory> createState() => _FundHistoryState();
}

class _FundHistoryState extends State<FundHistory> {
  List _datalist = [];
  bool load = true;
  String args = '';
  @override
  void initState() {
    args = Get.arguments;
    getdata();
    super.initState();
  }

  getdata() async {
    String id = await SharedPreferenceClass.GetSharedData(AppContant.id);
    final paramDic = {
      "user_id": '$id',
    };
    AuthRepo().Transactions(paramDic).then((value) {
      var data = json.decode(value.body);
      if (data['status'] == 200) {
        if (Get.arguments == 'Funding') {
          _datalist = data['data']['seed_transactions'];
        } else {
          _datalist = data['data']['wallet_transactions'];
        }
      }
      print(_datalist.length);
      load = false;
      setState(() {});
    });
    // Get.find<DashboardController>().LoginCheck();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black87,
  
      bottomNavigationBar: Container(
        // height: height * 0.06,
        padding: const EdgeInsets.symmetric(horizontal:10.0, vertical: 20),
        child:btncustom(btntxt: "Share",BtnPressed:(){
              Get.to(() => funding(), arguments: args)!
                  .then((value) => getdata());
            }, )
        

      ),
      body: Column(children: [
      
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
                  args,
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  ),
                ),
            
              ]),
            ),
      
      load
          ? SizedBox(height: Get.height*0.5,
            child: Center(
                child: CircularProgressIndicator(),
              ),
          )
          : _datalist.length == 0
              ? NOdata()
              : ListView.builder(
                  itemCount: _datalist.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (args == 'Funding') {
                      return list(
                          _datalist[index]['amount_in_token'].toString() +
                              " " +
                              'UNC',
                          _datalist[index]['sender_id'].toString(),
                          _datalist[index]['reciever_id'].toString(),
                          _datalist[index]['updated_at'].toString());
                    } else {
                      return list(
                          _datalist[index]['debit'].toString(),
                          _datalist[index]['user_id'].toString(),
                          _datalist[index]['from_id'].toString(),
                          _datalist[index]['updated_at'].toString());
                    }
                  }),],)
    );
  }

  list(String amt, String to, String from, String date) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border:
              Border.all(color: Theme.of(context).hoverColor.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(4)),
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.03, vertical: Get.height * 0.016),
      margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Amount: ',
                    style: TextStyle(
                        color: Colors.orange.shade900,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${amt}",
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: Get.width * 0.015,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.red),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("out",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          )),
                    ),
                  ),
                ],
              ),
              Text(
                '${DateFormat.yMd().format(DateTime.parse(date))}',
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text('To: ' + to,
              overflow: TextOverflow.fade,
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                  fontSize: 13,
                  fontWeight: FontWeight.w500)),
          SizedBox(
            height: Get.height * 0.005,
          ),
          Text('From: ' + from,
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                  fontSize: 13,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  NOdata() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Image.asset("assets/images/image.png"),
        ),
        Text(
          "No data",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
