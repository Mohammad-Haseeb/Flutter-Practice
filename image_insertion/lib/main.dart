import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Image Insertion Practice"),
          backgroundColor: Colors.amberAccent,
        ),
        body: SafeArea(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Image(
                image: NetworkImage(
                    'http://thequotes.in/wp-content/uploads/2016/09/Noam-Chomsky-Quotes-4.jpg'),
              ),
              const Image(
                image: AssetImage('image/diamond.jpg'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
