import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({@required this.title, @required this.pressed});
  final  String? title;
  final Function()?  pressed;
  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
          onPressed: pressed,
          style: ElevatedButton.styleFrom(
            elevation: 15,
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0),),),
          child:  Text(title ?? "",style:  const TextStyle(
              fontSize: 18,
              fontFamily:'sans-serif-condensed',
              fontWeight: FontWeight.bold
          ),)),
    );
  }
}
