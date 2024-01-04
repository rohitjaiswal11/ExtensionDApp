import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Item {
  String name;

  Item(this.name);
}
class ItemController extends GetxController {
  RxList<Item> itemList = <Item>[].obs;

  void addItem(String itemName) {
    itemList.add(Item(itemName));
    saveItemsToPrefs();
  }

  void removeItem(int index) {
    itemList.removeAt(index);
    saveItemsToPrefs();
  }

  void changeItemName(int index, String newName) {
    itemList[index].name = newName;
    saveItemsToPrefs();
  }

  void saveItemsToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> itemNames = itemList.map((item) => item.name).toList();
    prefs.setStringList('itemList', itemNames);
  }

  void loadItemsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? itemNames = prefs.getStringList('itemList');

    if (itemNames != null) {
      itemList.assignAll(itemNames.map((itemName) => Item(itemName)).toList());
    }
  }
}