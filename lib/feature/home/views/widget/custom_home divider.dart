import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomHomeDivider extends StatelessWidget {
  const CustomHomeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Color(0xff006672),
      indent: 30,
      endIndent: 30,
    );
  }
}