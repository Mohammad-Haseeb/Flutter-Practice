import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
          appBar: AppBar(
            title: const Text("Dice Game"),
            backgroundColor: Colors.red,
          ),
          // ignore: prefer_const_constructors
          body: SafeArea(
            child: MyDiceApp(),
          ))));
}

class MyDiceApp extends StatefulWidget {
  const MyDiceApp({Key? key}) : super(key: key);

  @override
  _MyDiceAppState createState() => _MyDiceAppState();
}

class _MyDiceAppState extends State<MyDiceApp> {
  @override
  int imageNumber=3;
  int SecondNumber =4;
  changePostionOfImage(){
    imageNumber=Random().nextInt(6)+1;
    SecondNumber=Random().nextInt(6)+1;
  }
  Widget build(BuildContext context) {
    return Center(
      child: Row(

        children: [
          Expanded(
            child: FlatButton(
              onPressed: (){
                setState(() {
                         changePostionOfImage();
                });
              },
              child: Image.asset('images/dice$imageNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: (){
                setState(() {
                  changePostionOfImage();
                });
              },
              child: Image.asset('images/dice$SecondNumber.png'),
            ),
          )
                ],
      ),
    );
  }
}
