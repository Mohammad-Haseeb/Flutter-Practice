import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: const Text("Quizz App"),
      backgroundColor: Colors.cyan,
    ),
    backgroundColor: Colors.cyan[600],
    body: MyApp(),
  )));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                  child: const Text(
                    "How're you",
                    style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 60,
                        fontFamily: 'OtomanopeeOne'),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 240.0),
              child: Column(
                children: [
                  FlatButton(
                    onPressed: () {},
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 100),
                      child: Text("True"),
                    ),
                    color: Colors.orange,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 100),
                      child: Text("True"),
                    ),
                    color: Colors.orange,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
