import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({ @required this.totalRdius });
   final double? totalRdius;
  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius: totalRdius ?? 10 ,
      backgroundImage:  AssetImage('images/logo.jpg'),
    );
  }
}
