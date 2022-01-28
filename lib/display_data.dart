import 'dart:io';

import 'package:flutter/material.dart';

class DisplayData extends StatefulWidget {
  String name = "";
  String alamat = "";
  String tanggal = "";
  File? image;

  DisplayData(
      {Key? key,
      required this.name,
      required this.alamat,
      required this.tanggal,
      required this.image})
      : super(key: key);

  @override
  _DisplayDataState createState() =>
      _DisplayDataState(name, alamat, tanggal, image);
}

class _DisplayDataState extends State<DisplayData> {
  String name = "";
  String alamat = "";
  String tanggal = "";
  File? image;
  _DisplayDataState(this.name, this.alamat, this.tanggal, this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is the data'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 30, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: image != null
                  ? Image.file(
                      image!,
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    )
                  : const FlutterLogo(size: 100),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Nama :',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'Alamat :',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                alamat,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ]),
            SizedBox(
              height: 5,
            ),
            Row(children: [
              Text(
                'Birth date :',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                tanggal,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
