import 'package:extensionapp/Utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class ListItem {
//   String name;
//   ListItem(this.name);
// }



class Accpage extends StatefulWidget {
   Accpage(BuildContext context, {super.key, });

  @override
  _AccpageState createState() => _AccpageState();
}

class _AccpageState extends State<Accpage> {
  List<ListItem> accountlist = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedItems = prefs.getStringList('items');
    if (savedItems != null) {
      setState(() {
        accountlist = savedItems.map((itemName) => ListItem(itemName)).toList();
      });
    }
  }

  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> itemNames = accountlist.map((item) => item.name).toList();
    prefs.setStringList('items', itemNames);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter List App'),
      ),
      body:
      
     
     
     
       Container( child: ConstantClass.accountlist.isNotEmpty
          ? 
         ListView.builder(
          shrinkWrap: true,
          itemCount:  ConstantClass.accountlist.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(accountlist[index].name),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'edit',
                    child: Text('Edit Name'),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Text('Delete'),
                  ),
                ],
                onSelected: (value) {
                  if (value == 'edit') {
                    _showEditDialog(index);
                  } else if (value == 'delete') {
                    _deleteItem(index);
                  }
                },
              ),
            );
          },
             )
      
      : SizedBox()
      
       ),
     
     
     
     
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
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
                if (itemName.isNotEmpty) {
                  setState(() {
                    accountlist.add(ListItem(itemName));
                  });
                  _saveData();
                  Navigator.of(context).pop();
                }
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
        String newName = accountlist[index].name;
        return AlertDialog(
          title: Text('Edit Item Name'),
          content: TextField(
            onChanged: (value) {
              newName = value;
            },
            decoration: InputDecoration(labelText: 'New Name'),
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
                setState(() {
                  accountlist[index].name = newName;
                });
                _saveData();
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteItem(int index) {
    setState(() {
      accountlist.removeAt(index);
    });
    _saveData();
  }

}
