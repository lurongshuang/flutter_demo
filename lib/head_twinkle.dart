import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter1/base/base_routes_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// @description 作用:绘制一颗跳动的心
// @date: 2021/11/18
// @author: 卢融霜

class HeadTwinkle extends StatefulWidget {
  const HeadTwinkle({Key key}) : super(key: key);

  @override
  _HeadTwinkleState createState() => _HeadTwinkleState();
}

//边框层宽度
List<double> borderSize;
//边框透明度
List<double> opa;
List<MaterialAccentColor> opaColor;

class _HeadTwinkleState extends State<HeadTwinkle>
    with SingleTickerProviderStateMixin {
  //声明
  AnimationController _controller;
  //计时器
  Timer _timer;

  @override
  void initState() {
    borderSize = [20, 40, 60, 80, 100];
    opa = [1, 0.8, 0.6, 0.4, 0.2];
    //初始化
    _controller = AnimationController(
        vsync: this,
        //循环周期
        duration: const Duration(seconds: 1),
        //起始值
        lowerBound: 60.r,
        //结束值
        upperBound: 100.r)
        //重复循环
      ..repeat(reverse: true)
      //添加监听
      ..addListener(() {
        //更新视图
        setState(() {});
      });

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      //更新边框宽度，透明色
      ref();
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseRoutesWidget(
        title: "跳动的心",
        child: Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Center(
                child: CustomPaint(
                  size: Size(150.r, 150.r),
                  foregroundPainter: PaintBorder(),
                ),
              ),
              Center(
                child: Image.asset(
                  "assets/images/ic_love.png",
                  width: _controller.value,
                  height: _controller.value,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ));
  }

  void ref() {
    for (int i = 0; i < borderSize.length; i++) {
      if (borderSize[i] < 120) {
        borderSize[i] += 1;
        opa[i] = double.parse((opa[i] - 0.01).toStringAsFixed(2));
      } else {
        opa[i] = 1.0;
        borderSize[i] = 20;
      }
    }
    print("borderSize:----------$borderSize");
    print("borderSize:----------$borderSize");
    print("opa:----------$opa");
    print("");
    print("");
    print("");

  }
}

class PaintBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < borderSize.length; i++) {
      var bodyColor = Color.fromRGBO(
        255,
        131,
        115,
        //透明色
        double.parse(opa[i].toDouble().toStringAsFixed(2)),
      );
      final Paint body = Paint();
      body
        ..color = bodyColor
        ..style = PaintingStyle.fill
        ..strokeWidth = 0;

      final Paint border = Paint();

      border
        ..color = bodyColor
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        //宽度
        ..strokeWidth = borderSize[i] * 2;

      //绘制心形状
      final double width = size.width;
      final double height = size.height;
      final Path path = Path();
      path.moveTo(0.5 * width, height * 0.5);
      path.cubicTo(0.2 * width, -0.2 * height, -0.2 * width, height * 0.4,
          0.5 * width, height * 0.8);
      path.moveTo(0.5 * width, height * 0.5);
      path.cubicTo(0.8 * width, -0.2 * height, 1.2 * width, height * 0.4,
          0.5 * width, height * 0.8);
      canvas.drawPath(path, body);
      canvas.drawPath(path, border);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
