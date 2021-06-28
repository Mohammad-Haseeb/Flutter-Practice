import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(
          title: const Text("Layout Practice"),
          backgroundColor: Colors.green,
        ),
        body: const SafeArea(child: MyApp())),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: const Text("Helo"),
          color: Colors.yellow,
          height: 100.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          child: const Text("Helo"),
          color: Colors.pinkAccent,
          height: 100.0,
        ),
        Container(
          child: const Text("Helo"),
          color: Colors.grey,
          height: 100.0,
        )
      ],
    );
  }
}
