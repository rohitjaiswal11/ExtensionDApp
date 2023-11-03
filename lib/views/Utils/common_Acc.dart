import 'package:extensionapp/export.dart';
import 'package:extensionapp/views/Utils/sharedpref.dart';
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
  }

  String cliptext = '';
    String accountname = '';

  getcliptext() async {
    accountname= await   SharedPreferencesManager().readString('account');
    print('Account name==== $accountname');
    cliptext = await SharedPreferencesManager().readString('publickey');
    print('Cliptext'+ cliptext);
    setState(() {});
  }
List<String> AccountsCreated = [];
//  final TextEditingController entryController = TextEditingController();
 

  void addEntry() {
    setState(() {
      
    
        AccountsCreated.add(accountname);
        print("List ii   $AccountsCreated");
       // entryController.clear();
      
    });
    }


  @override
  Widget build(BuildContext context) {
    return Container(
      //   height: Get.height/2,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (context, index) {
            return SizedBox(
              height: Get.height / 12,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/pie.png',
                    height: 30,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(

accountname
                         // AccountsCreated[index]
                      ,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: Get.width / 5,
                          child: Text(
                           "   $cliptext",
                            style: TextStyle(
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
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: 20,
                      child: Image.asset('assets/images/more.png'),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
