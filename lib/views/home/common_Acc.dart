// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    _loadData();
    //   addEntry();
  }

  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedItems = prefs.getStringList('items');
    if (savedItems != null) {
      setState(() {
        ConstantClass.accountlist =
            savedItems.map((itemName) => ListItem(itemName)).toList();
      });
    }
  }

  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> itemNames =
        ConstantClass.accountlist.map((item) => item.name).toList();
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
                          children: [
                            Text(
                              ConstantClass.accountlist[index].name
                              // accountname
                              // ??Common.txtaccountglobal!

                              ,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: Get.width / 5,
                              child: Text(
                                "   ${ConstantClass.accountlist[index]}",
                                style: TextStyle(
                                    fontSize: 12,fontFamily: 'Poppins',
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
                      PopupMenuButton(icon: Icon(Icons.more_vert, color: Colors.white,),
                        color: Colors.grey.shade800,
                       
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            height: Get.height * 0.05,
                            value: 'edit',
                            child: CustomFonts.Text12("Rename", Colors.white)
                          ),
                          PopupMenuItem(height: Get.height*0.05,
                            value: 'delete',
                            child:CustomFonts.Text12("Delete", Colors.white)
                          ),
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
                //     ConstantClass. accountlist.add(ListItem(itemName));
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
        String newName = ConstantClass.accountlist[index].name;
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
        String newName = ConstantClass.accountlist[index].name;
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
