import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter1/widget/drop_down_head_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @description 作用:多级筛选
/// @date: 2021/10/14
/// @author:卢融霜
class DropDownWidget extends StatefulWidget {
  //标题集合
  List<String> titles;

  //展开视图集合
  List<Widget> listWidget;

  // 高度
  double height;

  //子集
  Widget child;

  //筛选文字大小
  double headFontSize;

  // 筛选图标icons
  IconData iconData;

  //筛选高度 限制
  // BoxConstraints constraints;
  double bottomHeight;

  ScreenControl screenControl;

  DropDownWidget(this.titles, this.listWidget,
      {this.child,
      this.height = 42,
      this.headFontSize,
      this.iconData,
      this.bottomHeight,
      this.screenControl,
      Key key})
      : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

AnimationController _controller;
Animation<double> curve;
//按钮旋转状态
List<bool> rotateState = [];

class _DropDownWidgetState extends State<DropDownWidget>
    with SingleTickerProviderStateMixin {
  int tabIndex = 0;
  final ScreenControl _screenControl = ScreenControl();
  bool showBottom = false;

  @override
  void initState() {
    super.initState();
    widget.bottomHeight ??= 400.r;
    //展开隐藏控制器，动画初始化
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    curve = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    curve = Tween(begin: 0.0, end: widget.bottomHeight).animate(curve)
      ..addListener(() {
        setState(() {
          if (curve.value > 0) {
            showBottom = true;
          } else {
            showBottom = false;
          }
        });
      });
    rotateState = [];
    widget.titles.toList().forEach((element) {
      rotateState.add(false);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          height: widget.height,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: const Color(0xffe4e7ed), width: 0.4.r))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getScreenTitle(),
          ),
        ),
        widget.child,
        getBottomScreen()
      ],
    );
  }

  List<Widget> getScreenTitle() {
    List<Widget> widgets = [];
    if (widget.titles.isNotEmpty) {
      for (int i = 0; i < widget.titles.length; i++) {
        widgets.add(Expanded(
            flex: 1,
            child: DropDownHeadWidget(
              widget.titles[i],
              getRoState(i),
              () {
                setState(() {
                  tabIndex = i;
                  for (int j = 0; j < rotateState.length; j++) {
                    if (i == j) {
                      if (rotateState[j]) {
                        rotateState = rotateState.map((e) => false).toList();
                        _controller.reverse();
                      } else {
                        rotateState = rotateState.map((e) => false).toList();
                        rotateState[j] = !rotateState[j];
                        _controller.forward();
                      }
                    }
                  }
                });
              },
              headFontSize: widget.headFontSize,
              iconData: widget.iconData,
            )));
      }
    } else {
      widgets.add(Text(
        "数组为空",
        style: TextStyle(fontSize: 14.sp),
      ));
    }
    return widgets;
  }

  Widget getBottomScreen() {
    return SizedBox(
      height: showBottom ? double.infinity : 0.0,
      child: GestureDetector(
        onTap: () {
          _screenControl.screenHide();
        },
        child: getBottomIndex(),
      ),
    );
  }

  bool getRoState(int i) {
    if (rotateState.isEmpty || rotateState.length < i + 1) {
      return false;
    }
    return rotateState[i];
  }

  Widget getBottomIndex() {
    widget.bottomHeight ??= 400.r;

    return Container(
      margin: EdgeInsets.only(top: widget.height),
      alignment: Alignment.topCenter,
      color: Colors.black26,
      height: MediaQuery.of(context).size.height - widget.height,
      width: double.infinity,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxHeight: curve.value),
        color: Colors.white,
        child: widget.listWidget[tabIndex],
      ),
    );
  }
}

class ScreenControl {
  //自动
  void autoDisplay() {
    if (_controller.isDismissed) {
      _controller.forward();
    } else {
      _controller.reverse();
      rotateState = rotateState.map((e) => false).toList();
    }
  }

  //显示
  void screenShow() {
    _controller.forward();
  }

  //隐藏
  void screenHide() {
    _controller.reverse();
    rotateState = rotateState.map((e) => false).toList();
  }
}
