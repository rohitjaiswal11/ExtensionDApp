import 'package:extensionapp/views/home/Account/accountcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Item {
  String name;

  Item(this.name);
}

class TotalAccount extends StatelessWidget {


  
  final ItemController itemController = Get.put(ItemController());

   TotalAccount(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    itemController.loadItemsFromPrefs();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetX List Example'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: itemController.itemList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(itemController.itemList[index].name),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'changeName') {
                          _showChangeNameDialog(context, index);
                        } else if (value == 'delete') {
                          itemController.removeItem(index);
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'changeName',
                          child: Text('Change Name'),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Text('Delete'),
                        ),
                      ],
                    ),
                  );
                },
              )),
            ),
            ElevatedButton(
              onPressed: () => _showAddItemDialog(context),
              child: Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddItemDialog(BuildContext context) {
    TextEditingController itemNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Item'),
          content: TextField(
            controller: itemNameController,
            decoration: InputDecoration(labelText: 'Item Name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (itemNameController.text.isNotEmpty) {
                  itemController.addItem(itemNameController.text);
                  Get.back();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showChangeNameDialog(BuildContext context, int index) {
    TextEditingController newNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Name'),
          content: TextField(
            controller: newNameController,
            decoration: InputDecoration(labelText: 'New Name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newNameController.text.isNotEmpty) {
                  itemController.changeItemName(index, newNameController.text);
                  Get.back();
                }
              },
              child: Text('Change'),
            ),
          ],
        );
      },
    );
  }
}
