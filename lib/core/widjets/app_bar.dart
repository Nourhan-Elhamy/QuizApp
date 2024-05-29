import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.name});
final String name;
  @override
  Widget build(BuildContext context) {
    return AppBar(
    backgroundColor: AppColors.primaryColor,
    centerTitle: true,
    title: Text(name,style: TextStyle(color: AppColors.white),),
    toolbarHeight: 106,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(25),
    bottomRight: Radius.circular(25)
    )
    ),
    );
  }
}
