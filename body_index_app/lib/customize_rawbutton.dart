import 'package:flutter/material.dart';
class RawMaterialBtn extends StatelessWidget {
  RawMaterialBtn({@required this.icon,this.pressed});
  final IconData? icon;
  final  VoidCallback? pressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed:pressed,
      child: Icon(icon,color: Colors.black,),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      elevation: 30.0,
      fillColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }
}