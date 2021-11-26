import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// @description 作用:底部弹出
// @date: 2021/11/25
// @author: 卢融霜

class MyBottomSheet extends StatefulWidget {
  double minHeight;
  double maxHeight;

  MyBottomSheet(this.minHeight, this.maxHeight, {Key key}) : super(key: key);

  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<MyBottomSheet>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned(
                  height: lerp(widget.minHeight, widget.maxHeight),
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onVerticalDragUpdate: _dragUpdate,
                    onVerticalDragEnd: _handleDragEnd,
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(32)),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Container(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(top: 20.r),
                          child: InkWell(
                            onTap: _toggle,
                            child: Text(
                              "切换",
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.white),
                            ),
                          ),
                        )),
                  ))
            ],
          );
        });
  }

  /// 滑动核心代码， 根据 _controller.value 的0 - 1的值，返回 minHeight - maxHeight 相对于的值，完成高度设置
  double lerp(double minHeight, double maxHeight) {
    var height = lerpDouble(minHeight, maxHeight, _controller.value);
    return height;
  }

  ///开关切换
  void _toggle() {
    //判断打开状态 进行切换
    bool isOpen = _controller.status == AnimationStatus.completed;
    //velocity  传递正数 执行到 upperBound 值  负数 执行到 lowerBound 值
    _controller.fling(velocity: isOpen ? -1 : 1);
  }

  ///滑动关键代码，监听纵向滑动阀值，设置响应高度
  void _dragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta / widget.maxHeight;
  }

  /// 开关核心代码： 根据滑动速度，滑动高度，来判断 开关
  void _handleDragEnd(DragEndDetails details) {

    //排除 动画过程中，和完成状态。
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    //获取滑动速度
    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / widget.maxHeight;


    //设置滑动执行方向
    if (flingVelocity < 0.0) {
      _controller.fling(velocity: max(1.0, -flingVelocity));
    } else if (flingVelocity > 0.0) {
      _controller.fling(velocity: min(-1.0, -flingVelocity));
    } else {
      _controller.fling(velocity: _controller.value < 0.5 ? -1.0 : 1.0);
    }
  }
}
