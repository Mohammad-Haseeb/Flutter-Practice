import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: SafeArea(
        child:  MyApp()
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
       Expanded  WidgetProvider(Color color,int number ){
           return  Expanded(
             child: FlatButton(
               color: color,
               onPressed: (){
                 final player = AudioCache();
                 player.play('note$number.wav');
               },
               child: const Text("Play"),
             ),
           );

         }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        WidgetProvider(Colors.red,  1),
        WidgetProvider(Colors.black12,  2),
        WidgetProvider(Colors.yellowAccent,  3),
        WidgetProvider(Colors.pink,  4),
        WidgetProvider(Colors.purple,  5),
        WidgetProvider(Colors.greenAccent,  6),
        WidgetProvider(Colors.orangeAccent,  7),

      ],
    );
  }
}
