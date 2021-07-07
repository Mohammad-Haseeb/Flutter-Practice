import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home:Scaffold(
       backgroundColor: Colors.blueAccent,
      body: MyApp(),
    )
  ));
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
        child: Text("Hello"),
      ),
    );
  }
}
