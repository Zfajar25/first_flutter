import 'package:flutter/material.dart';

class BottomSheetData extends StatefulWidget {
  List<dynamic>? jsonUserData;
  int index;
  BottomSheetData({Key? key, required this.jsonUserData, required this.index})
      : super(key: key);

  @override
  _BottomSheetDataState createState() =>
      _BottomSheetDataState(jsonUserData, index);
}

class _BottomSheetDataState extends State<BottomSheetData> {
  List<dynamic>? jsonUserData;
  int index;
  _BottomSheetDataState(this.jsonUserData, this.index);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Text('Name : ${jsonUserData![index].name}'),
            Text('Email : ${jsonUserData![index].email}'),
            Text('Username: ${jsonUserData![index].username}'),
            Text('Street: ${jsonUserData![index].address.street}'),
            Text('Zipcode: ${jsonUserData![index].address.zipcode}'),
            Text('Latitude: ${jsonUserData![index].address.geo.lat}')
          ],
        ),
      ),
    );
  }
}
