import 'package:flutter/material.dart';
import 'package:body_index_app/input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main(){
  runApp(MaterialApp(
    theme: ThemeData.dark().copyWith(
      primaryColor: const Color(0xFF0A0E21),
      scaffoldBackgroundColor: const Color(0xFF0A0E21)
    ),

    home:Scaffold(
      appBar: AppBar(title:  const Text("BMIT"),),
      body:  InputPage(),
    ),

  ));
}