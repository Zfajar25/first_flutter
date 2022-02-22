import 'package:contact_layout/screens/json_http.dart';
import 'package:flutter/material.dart';
import 'enter_form.dart';
import 'play_video.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: const Text(
          'My Information',
          style: TextStyle(fontSize: 18, color: Colors.amber),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: CircleAvatar(
              backgroundImage: AssetImage('web/images/smaller.jpg'),
              radius: 80,
            )),
            Text(
              'NAME',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Oxygen-Regular',
                  letterSpacing: 2,
                  color: Colors.grey[200]),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Muhamad Nur Fajar, S.T.',
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.amber[300],
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Location',
              style: TextStyle(
                  fontSize: 18, letterSpacing: 2, color: Colors.grey[200]),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Indonesia',
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.amber[300],
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(
                  Icons.mail,
                  color: Colors.grey,
                ),
                Text(
                  'muhamadnurfajar@gmail.com',
                  style: TextStyle(color: Colors.grey[400], letterSpacing: 1),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(children: [
              Icon(
                Icons.phone_android,
                color: Colors.green[500],
              ),
              Text(
                '085-703-063-240',
                style: TextStyle(color: Colors.green[300]),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(Icons.school_sharp, color: Colors.grey),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'University of Padjadjaran',
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 15,
                      letterSpacing: 1,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'FLUTTER FOR ANDROID',
                style: TextStyle(
                    fontFamily: 'web/font/BebasNeue-Regular.ttf',
                    color: Colors.grey[500],
                    fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Icon(
                Icons.android_sharp,
                size: 75,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PlayVideo()));
                    },
                    icon: const Icon(
                      Icons.near_me_rounded,
                    ),
                    label: const Text('Play Video'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EnterForm()));
                      },
                      icon: const Icon(
                        Icons.whatshot,
                      ),
                      label: const Text('Enter Form')),
                ),
                Expanded(
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JsonWidget()));
                      },
                      icon: Icon(Icons.web),
                      label: Text('Json HTTP')),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
