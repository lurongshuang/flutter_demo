import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @description 作用:多级筛选item
/// @date: 2021/10/14
/// @author:卢融霜
class DropDownHeadWidget extends StatefulWidget {
  String title;
  bool isForward;
  Function onClick;
  double headFontSize;
  IconData iconData;

  DropDownHeadWidget(this.title, this.isForward, this.onClick,
      {this.headFontSize = 12.0,
      this.iconData = Icons.arrow_drop_down_outlined,
      key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DropDownHeadWidgetState();
  }
}

class _DropDownHeadWidgetState extends State<DropDownHeadWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation shAnimation;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant DropDownHeadWidget oldWidget) {
    if (widget.isForward) {
      controller.forward();
    } else {
      controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    shAnimation = Tween(begin: .0, end: .5).animate(controller)
      ..addStatusListener((status) {
        setState(() {
          if (status == AnimationStatus.completed) {
          } else {}
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle headTextStyle;
    Icon iconData;
    if (shAnimation.isCompleted) {
      headTextStyle ??=
          TextStyle(fontSize: widget.headFontSize, color: Colors.blue);
      iconData = Icon(
        widget.iconData ?? Icons.arrow_drop_down_sharp,
        color: Colors.blue,
        size: 20.sp,
      );
      //
    } else {
      headTextStyle = TextStyle(
          fontSize: widget.headFontSize, color: const Color(0xff333333));
      iconData = Icon(
        widget.iconData ?? Icons.arrow_drop_down_sharp,
        size: 20.sp,
        color: const Color(0xff333333),
      );
    }
    return InkWell(
      onTap: () {
        widget.onClick();
      },
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(left: 5.r, right: 5.r),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(widget.title,
                overflow: TextOverflow.ellipsis, style: headTextStyle),
            RotationTransition(
              turns: shAnimation,
              child: iconData,
            )
          ])),
    );
  }
}
