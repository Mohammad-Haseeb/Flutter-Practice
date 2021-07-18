import 'package:flutter/material.dart';

class ResuableCard extends StatelessWidget {
  ResuableCard({@required this.color,  this.childWidget,this.onPress});
  final Color? color;
  final Widget? childWidget;
  final VoidCallback?  onPress;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,

          ),
          child: childWidget,
        ),
      ),
    );
  }
}
