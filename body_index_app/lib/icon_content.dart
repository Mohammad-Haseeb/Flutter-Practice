import 'package:flutter/material.dart';

class IconsContent extends StatelessWidget {
  IconsContent({@required this.icon, @required this.label});
  final String? label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 80,
          ),
        const  SizedBox(
            height: 15,
          ),
          Text(
            label.toString(),
            style: const  TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
          ),
        ]);
  }
}
