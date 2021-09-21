import 'package:flutter/material.dart';

class PasswordShowIcon extends StatelessWidget {
  const PasswordShowIcon({
    Key? key,
    required bool isObscure,
  }) : _isObscure = isObscure, super(key: key);

  final bool _isObscure;

  @override
  Widget build(BuildContext context) {
    return Icon(
        _isObscure ? Icons.visibility : Icons.visibility_off);
  }
}



class Sizer extends StatelessWidget {
  const Sizer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10,
    );
  }
}


