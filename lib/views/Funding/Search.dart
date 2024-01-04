import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/Repo.dart';


class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List search = [];
  bool change = false;
  FocusNode f1 = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    FocusScope.of(context).requestFocus(f1);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          width: Get.width * 0.7,
          child: TextFormField(
            focusNode: f1,
            style: TextStyle(color: Colors.white),
            onChanged: (val) {
              change = true;
              setState(() {});
              getSearch(val.toString());
            },
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.white),
              suffixIcon: Icon(
                Icons.search,
              ),
            ),
          ),
        ),
      ),
      body: change
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: search.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      f1.unfocus();
                      Get.back(result: search[index]['user_id'].toString());
                    },
                    tileColor: Theme.of(context).cardColor,
                    title: Text(
                      search[index]['name'].toString(),
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color),
                    ),
                    subtitle: Text(
                      search[index]['user_id'].toString(),
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color),
                    ),
                  ),
                );
              }),
    );
  }

  getSearch(String value) {
    final param = {
      "name": "$value",
    };
    AuthRepo().Search(param).then((value) {
      var data = json.decode(value.body);
      if (data['status'] == 200) {
        search.clear();
        search = data['data'];
        change = false;
        setState(() {});
      }
    });
  }
}
