// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Profile Panel'),
        backgroundColor: Colors.black12,
      ),
      body: SafeArea(child: const MyApp()),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('images/profile.jpg'),
        ),
        SizedBox(
          height: 40,
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.phone,
              color: Colors.pinkAccent,
              size: 30,
            ),
            title: Text("+9232145667"),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.email,
              size: 30,
              color: Colors.redAccent,
            ),
            title: Text("qwekhr@gmail.com"),
          ),
        )
      ],
    );
  }
}
