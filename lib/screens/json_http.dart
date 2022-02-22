import 'dart:convert';

import 'package:contact_layout/screens/bottom_sheet.dart';
import 'package:contact_layout/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonWidget extends StatefulWidget {
  JsonWidget({Key? key}) : super(key: key);

  @override
  State<JsonWidget> createState() => _JsonWidgetState();
}

class _JsonWidgetState extends State<JsonWidget> {
  List<dynamic>? jsonUserData;

  Future getUserData() async {
    Response response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var jsonData = jsonDecode(response.body);
    setState(() {
      jsonUserData =
          jsonData.map((jsonData) => UserData.fromJson(jsonData)).toList();
    });
    return jsonUserData;

    // for (var user in jsonData) {
    //   UserData userNew = UserData(
    //       name: user['name'], email: user['email'], username: user['username']);
    //   jsonUserData.add(userNew);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Fetch Json File'),
          elevation: 0,
          actions: [
            ElevatedButton(
                onPressed: () {
                  getUserData();
                },
                child: Text('Get Data'))
          ],
        ),
        body: jsonUserData != null
            ? ListView.builder(
                itemCount: jsonUserData!.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: ListTile(
                          title: Text(jsonUserData![index].name),
                          onTap: () => showDropDown(index),
                        ),
                      ),
                    ],
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Please press Get Data button'),
                    CircularProgressIndicator()
                  ],
                ),
              ));
  }

  void showDropDown(int index) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            child: BottomSheetData(jsonUserData: jsonUserData, index: index),
            color: Colors.white,
          );
        });
  }
}
