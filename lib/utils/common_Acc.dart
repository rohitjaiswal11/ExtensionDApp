import 'package:extensionapp/export.dart';
import 'package:extensionapp/Utils/common.dart';
import 'package:extensionapp/Utils/sharedpref.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  void initState() {
    super.initState();
    getcliptext();
    //   addEntry();
  }

  String cliptext = '';
  String? accountname;

  getcliptext() async {
    accountname = await SharedPreferencesManager().readString('account');
    print('Account name==== $accountname');
    cliptext = await SharedPreferencesManager().readString('publickey');

    addEntry(accountname!,cliptext);
    print('Cliptext  ' + cliptext);

    setState(() {});
    return (accountname,cliptext);
    
  }

//

// to do

//
  importedwallet() {
    String? impublickey = Common.publicgenerated;
  }

  bool hasDuplicates = false;

  dupicatecheck(List datchk) {
    // Check for duplicates in the list
    for (int i = 0; i < datchk.length; i++) {
      for (int j = i + 1; j < datchk.length; j++) {
        if (datchk[i] == datchk[j]) {
          hasDuplicates = true;
          break;
        }
      }
      if (hasDuplicates) {
        break;
      }
    }
    return hasDuplicates;
  }

  addEntry(String accname, String walladdr) {
    dupicatecheck(Common.accountsCreated);
    setState(() {
      if (hasDuplicates == false) {
        Common.walletcreated.add(cliptext);
        Common.accountsCreated.add(accountname!);
       
      }
      print("List ii   ${Common.accountsCreated}");


      print("txtaccountglobal  ${Common.txtaccountglobal}");
      print("Account___ name  ${accountname!}");
    });

    //   dupicatecheck(Common.walletcreated);
    // setState(() {
    //   if (hasDuplicates == false) {
        
        Common.walletcreated.add(cliptext);
  //     }
  
  //     //Common.txtaccountglobal=null;
   
  //     print("wallet add name  ${cliptext}");
  //   });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //   height: Get.height/2,
      child: Common.accountsCreated!.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: Common.accountsCreated!.length,
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
                              Common.accountsCreated[index]
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
                                "   ${Common.walletcreated[index]}",
                                style: TextStyle(
                                  fontSize: 13,
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
                            Text(
                              '0 ETH',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '\$ 0.00 USD',
                              style: TextStyle(   fontSize: 13,color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                                        
                          print("dfdffd");
PopupMenuButton<int>(
                    onSelected: (int value) {
                      // Handle the item selection here
                      switch (value) {
                        case 0:
                         print(value);
                          break;
                        case 1:
                     print(value);
                          // Navigate to a new screen or perform an action for item 1
                
                          break;
                        case 2:
                          // Navigate to a different screen or perform an action for item 2
                            print(value);
                          break;
                    
                      }
                    },
                    itemBuilder: (context) => [
                      // popupmenu item 1
                
                      for (int i = 0; i < 2; i++)
                        PopupMenuItem(
                          value: i,
                          // row has two child icon and text
                          child: Row(
                            children: [
                              menuicon[i],
                              //  Icon(Icons.settings, color: Colors.white),
                              SizedBox(
                                // sized box with width 10
                                width: 10,
                              ),
                              menutxt[i],
                            ],
                          ),
                        ),
                    ],
                   // offset: Offset(25, 50),
                
                    color: Colors.black,
                    //   elevation: 2,
                
                    icon:Image.asset(
                      'assets/images/more.png',
                    height: 20,
                      fit: BoxFit.fitHeight,
                    ),
                  padding: EdgeInsets.zero,
                    
                  );


// PopupMenuButton(
//           onSelected: (value) {
//             // your logic
//           },
//           itemBuilder: (BuildContext bc) {
//             return const [
//               PopupMenuItem(
//                 child: Text("Hello"),
//                 value: '/hello',
//               ),
//               PopupMenuItem(
//                 child: Text("About"),
//                 value: '/about',
//               ),
//               PopupMenuItem(
//                 child: Text("Contact"),
//                 value: '/contact',
//               )
//             ];
//           },
//         );


                        },
                        child: Container(
                          alignment: Alignment.topCenter,
                          height: 20,
                          child: Image.asset('assets/images/more.png'),
                        ),
                      )
                    ],
                  ),
                );
              })
          : SizedBox(),
    );
  }
}
