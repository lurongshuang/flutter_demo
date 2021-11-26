import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter1/routes_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: () => MaterialApp(
            title: '测试',
            theme: ThemeData(primaryColor: Colors.white),
            home: const RoutesList()));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation<int> animation;
  AnimationController controller;
  CurvedAnimation curve;
  int starNum = 5;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    // curve = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    animation = IntTween(begin: 5, end: 100).animate(controller);
    animation
      ..addListener(() {
        setState(() {
          starNum = animation.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomPaint(
      painter: StarView(context, startNum: starNum),
    ));
  }
}

class StarView extends CustomPainter {
  Paint mHelpPaint;
  Paint starPaint;
  int startNum;

  BuildContext context;

  StarView(this.context, {this.startNum = 5}) {
    mHelpPaint = Paint();
    mHelpPaint.style = PaintingStyle.stroke;
    mHelpPaint.color = Colors.blue;
    mHelpPaint.isAntiAlias = true;

    starPaint = Paint();
    starPaint.style = PaintingStyle.fill;
    starPaint.color = Colors.red;
    starPaint.isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var winSize = MediaQuery.of(context).size;
    //绘制网格
    canvas.drawPath(girdPath(20, winSize), mHelpPaint);
    //绘制x 轴 y轴
    drawCoo(canvas, Size(winSize.width / 2, winSize.height / 2), winSize);
    //移动到坐标系原点
    canvas.translate(winSize.width / 2, winSize.height / 2);
    canvas.drawPath(nStarPath(startNum, 100, 40), starPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  drawCoo(Canvas canvas, Size coo, Size winSize) {
    //画笔
    Paint paint = Paint();
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;
    //绘制直线 x轴  y轴
    canvas.drawPath(cooPath(coo, winSize), paint);
    //左箭头
    canvas.drawLine(Offset(winSize.width, coo.height),
        Offset(winSize.width - 10, coo.height - 6), paint);
    canvas.drawLine(Offset(winSize.width, coo.height),
        Offset(winSize.width - 10, coo.height + 6), paint);
    //下箭头
    canvas.drawLine(Offset(coo.width, winSize.height),
        Offset(coo.width - 6, winSize.height - 10), paint);
    canvas.drawLine(Offset(coo.width, winSize.height),
        Offset(coo.width + 6, winSize.height - 10), paint);
  }

  Path cooPath(Size coo, Size winSize) {
    Path path = Path();
    path.moveTo(0, coo.height);
    path.lineTo(winSize.width, coo.height);
    path.moveTo(coo.width, 0);
    path.lineTo(coo.width, winSize.height);

    return path;
  }

  /// 绘制网格
  /// @param setp 个数
  /// @param winSize  屏幕宽高
  Path girdPath(int setp, Size winSize) {
    Path path = Path();
    double se = winSize.height / setp;
    for (int i = 0; i < (winSize.height) / se; i++) {
      //绘制横线
      path.moveTo(0, se * i.toDouble());
      path.lineTo(winSize.width, se * i.toDouble());
    }

    se = winSize.width / setp;
    for (int i = 0; i < winSize.width / se; i++) {
      //绘制竖线
      path.moveTo(se * i.toDouble(), 0);
      path.lineTo(se * i.toDouble(), winSize.height);
    }
    path.close();
    return path;
  }

  /// n角星路径
  /// @param num 几角星
  /// @param R   外接圆半径
  /// @param r   内接圆半径
  /// @return n角星路径
  Path nStarPath(int num, double R, double r) {
    Path path = Path();
    double perDeg = 360 / num; //尖角的度数
    double degA = perDeg / 2 / 2;
    double degB = 360 / (num - 1) / 2 - degA / 2 + degA;

    path.moveTo(cos(_rad(degA)) * R, (-sin(_rad(degA)) * R));
    for (int i = 0; i < num; i++) {
      path.lineTo(
          cos(_rad(degA + perDeg * i)) * R, -sin(_rad(degA + perDeg * i)) * R);
      path.lineTo(
          cos(_rad(degB + perDeg * i)) * r, -sin(_rad(degB + perDeg * i)) * r);
    }
    path.close();
    return path;
  }

  double _rad(double deg) {
    return deg * pi / 180;
  }
}
