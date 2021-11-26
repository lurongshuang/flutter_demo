import 'dart:ui';

import 'package:flutter/material.dart';

// @description 作用:bottom_sheet标题
// @date: 2021/11/26
// @author: 卢融霜

class SheetTitle extends StatelessWidget {
  final String title;
  final double fontSize;

  const SheetTitle({Key key, this.title, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.white, fontSize: fontSize, fontWeight: FontWeight.bold),
    );
  }
}
