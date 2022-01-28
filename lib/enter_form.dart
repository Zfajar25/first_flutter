import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'display_data.dart';

class EnterForm extends StatefulWidget {
  const EnterForm({Key? key}) : super(key: key);

  @override
  _EnterFormState createState() => _EnterFormState();
}

class _EnterFormState extends State<EnterForm> {
  final _nameText = TextEditingController();
  final _addressText = TextEditingController();
  String name = "";
  String alamat = "";
  DateTime pickedDate = DateTime.now();
  final DateFormat theformat = DateFormat('dd-MM-yyyy');
  String tanggal = "";
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter your information and picture'),
        backgroundColor: Colors.blue[600],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          image != null
              ? Image.file(
                  image!,
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                )
              : FlutterLogo(size: 100),
          SizedBox(
            height: 5,
          ),
          ElevatedButton.icon(
              onPressed: () => theImage(),
              icon: Icon(Icons.image_outlined),
              label: Text('Picture')),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _nameText,
            decoration: InputDecoration(
                hintText: "Enter Name",
                labelText: "Name",
                labelStyle: TextStyle(fontSize: 20),
                border: OutlineInputBorder(),
                icon: Icon(
                  Icons.people_outline,
                  color: Colors.blue,
                )),
          ),
          SizedBox(
            height: 8,
          ),
          TextField(
            controller: _addressText,
            decoration: InputDecoration(
                hintText: "Enter Address",
                labelText: "Address",
                labelStyle: TextStyle(fontSize: 20),
                border: OutlineInputBorder(),
                icon: Icon(
                  Icons.location_city,
                  color: Colors.blue,
                )),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  onPressed: () => _dateTimePick(context),
                  icon: Icon(Icons.date_range),
                  label: Text('Birth Date')),
              Spacer(),
              Text(
                tanggal,
                style: TextStyle(color: Colors.blue, fontSize: 20),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                name = _nameText.text;
                alamat = _addressText.text;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisplayData(
                            name: name,
                            alamat: alamat,
                            tanggal: tanggal,
                            image: image)));
              },
              child: Text('Submit')),
        ]),
      ),
    );
  }

  Future _dateTimePick(BuildContext context) async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2023));
    if (date != null) {
      setState(() {
        pickedDate = date;
        tanggal = theformat.format(pickedDate);
      });
    }
  }

  Future theImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
    }
  }
}
