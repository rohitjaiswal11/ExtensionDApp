// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:extensionapp/Utils/customfonts.dart';
import 'package:flutter/material.dart';

import 'package:extensionapp/Utils/common.dart';

import 'package:extensionapp/Utils/sharedpref.dart';
import 'package:extensionapp/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/Constant.dart';

class Account extends StatefulWidget {
  const Account(BuildContext context, {super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  void initState() {
    super.initState();
    // getcliptextprefs();
    _loadDataAccount();
    //   addEntry();
  }

_loadDataAccount() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? savedItems = prefs.getStringList('items');

  if (savedItems != null) {
    setState(() {
      ConstantClass.accountlist = savedItems
          .map((jsonString) => jsonDecode(jsonString))
          .map((map) => AccountItem(
                name: map['name'],
                publicKeyBsc: map['publicKeyBsc'],
                privatekeyBsc: map['privatekeyBsc'],
                wallet_addressBsc: map['wallet_addressBsc'],
                publicKeyTron: map['publicKeyTron'],
                privatekeyTron: map['privatekeyTron'],
                wallet_addressTron: map['wallet_addressTron'],
                mnemonics: map['mnemonics'],
              ))
          .toList();
    });
  }
}
// _saveData() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();

//   // Map each AccountItem to a Map<String, dynamic>
//   List<Map<String, dynamic>> itemList = ConstantClass.accountlist.map((item) {


//     print(  'publicKeyBsc from s  '+ item.name.toString());
//     return {
//       'name': item.name,
//       'publicKeyBsc': item.publicKeyBsc,
//       'privatekeyBsc': item.privatekeyBsc,
//       'wallet_addressBsc': item.wallet_addressBsc,
//       'publicKeyTron': item.publicKeyTron,
//       'privatekeyTron': item.privatekeyTron,
//       'wallet_addressTron': item.wallet_addressTron,
//       'mnemonics': item.mnemonics,
//     };
//   }).toList();

//   // Save the list of Maps to SharedPreferences
//   prefs.setStringList('items', itemList.map((map) => jsonEncode(map)).toList());
// }





  // _loadData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String>? savedItems = prefs.getStringList('items');
  //   if (savedItems != null) {
  //     setState(() {
  //       ConstantClass.accountlist =
  //           savedItems.map((itemName) => AccountItem(name:itemName)).toList();
  //     });
  //   }
  // }

  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> itemNames =
        ConstantClass.accountlist.map((item) => item.name).cast<String>().toList();
    prefs.setStringList('items', itemNames);
  }

  String cliptext = '';
  String accountname = "Wallet";

  getcliptextprefs() async {
    accountname = await SharedPreferencesManager().readString('account');
    print('Account name==== $accountname');
    cliptext = await SharedPreferencesManager().readString('publickey');

    // addEntry(accountname!, cliptext);
    print('Cliptext  ' + cliptext);

    setState(() {});
    return (accountname, cliptext);
  }

//

//
  // importedwallet() {
  //   String? impublickey = Common.publicgenerated;
  // }

  // bool hasDuplicates = false;

  // dupicatecheck(List datchk) {
  //   // Check for duplicates in the list
  //   for (int i = 0; i < datchk.length; i++) {
  //     for (int j = i + 1; j < datchk.length; j++) {
  //       if (datchk[i] == datchk[j]) {
  //         hasDuplicates = true;
  //         break;
  //       }
  //     }
  //     if (hasDuplicates) {
  //       break;
  //     }
  //   }
  //   return hasDuplicates;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      //   height: Get.height/2,
      child: ConstantClass.accountlist.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: ConstantClass.accountlist.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: Get.height / 12,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/pie.png',
                        height: 25,
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "   ${ConstantClass.accountlist[index].name}",
                              // accountname
                              // ??Common.txtaccountglobal!
                              textAlign: TextAlign.left,

                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: Get.width / 5,
                              child: Text(
                                "   ${ConstantClass.accountlist[index].wallet_addressBsc}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    color: Colors.grey,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomFonts.text12("0.0", Colors.white),
                            Text(
                              '\$ 0.00 USD',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      PopupMenuButton(
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                        color: Colors.grey.shade800,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                              height: Get.height * 0.05,
                              value: 'edit',
                              child:
                                  CustomFonts.Text12("Rename", Colors.white)),
                          PopupMenuItem(
                              height: Get.height * 0.05,
                              value: 'delete',
                              child:
                                  CustomFonts.Text12("Delete", Colors.white)),
                        ],
                        onSelected: (value) {
                          if (value == 'edit') {
                            _showEditDialog(index);
                          } else if (value == 'delete') {
                            _showDeleteDialog(index);
                          }
                        },
                      ),
                    ],
                  ),
                );
              })
          : SizedBox(),
    );
  }

  void _addItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String itemName = '';
        return AlertDialog(
          title: Text('Add Item'),
          content: TextField(
            onChanged: (value) {
              itemName = value;
            },
            decoration: InputDecoration(labelText: 'Item Name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // if (itemName.isNotEmpty) {
                //   setState(() {
                //     ConstantClass. accountlist.add(AccountItem(itemName));
                //   });
                //   _saveData();
                //   Navigator.of(context).pop();
                // }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? newName = ConstantClass.accountlist[index].name;
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            'Edit Item Name',
          ),
          titleTextStyle: TextStyle(
              fontSize: 14, fontFamily: 'Poppins', color: Colors.white),
          content: TextField(
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              newName = value;
            },
            decoration: InputDecoration(
              labelText: 'New Name',
              labelStyle: TextStyle(
                  fontSize: 13, fontFamily: 'Poppins', color: Colors.grey),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                    fontSize: 14, fontFamily: 'Poppins', color: Colors.white),
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    ConstantClass.accountlist[index].name = newName;
                  });
                  _saveData();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                      fontSize: 14, fontFamily: 'Poppins', color: Colors.white),
                )),
          ],
        );
      },
    );
  }

  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? newName = ConstantClass.accountlist[index].name;
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            'Are you Sure to delete',
          ),
          titleTextStyle: TextStyle(
              fontSize: 14, fontFamily: 'Poppins', color: Colors.white),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                    fontSize: 14, fontFamily: 'Poppins', color: Colors.white),
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    ConstantClass.accountlist.removeAt(index);
                  });
                  _saveData();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Delete',
                  style: TextStyle(
                      fontSize: 14, fontFamily: 'Poppins', color: Colors.white),
                )),
          ],
        );
      },
    );
  }
}
