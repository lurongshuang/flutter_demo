import 'dart:math';
import 'package:flutter/material.dart';
/// @description 作用:GestureDetector 测试
/// @date: 2021/9/24
/// @author:卢融霜
class GestureDetectorTest extends StatefulWidget {
  const GestureDetectorTest({Key key}) : super(key: key);

  @override
  _GestureDetectorTestState createState() => _GestureDetectorTestState();
}

class _GestureDetectorTestState extends State<GestureDetectorTest> {
  String eventName = "事件名称";
  List<Draw> balls = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GestureDetectorTest")),
      body: Container(
        color: Colors.grey,
        child: Column(
          children: [
            Text("$eventName"),
            Container(
              margin: const EdgeInsets.all(15),
              width: double.infinity,
              height: 400,
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    eventName = '单击事件';
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    eventName = '双击事件';
                  });
                },
                onTapDown: (TapDownDetails details) {
                  balls.add(Draw(details.localPosition.dx,
                      details.localPosition.dy, randomRGB()));
                  setState(() {});
                },
                onPanUpdate: (DragUpdateDetails details) {
                  balls.add(Draw(details.localPosition.dx,
                      details.localPosition.dy, randomRGB()));
                  setState(() {});
                },
                child: CustomPaint(
                  painter: CanvasWidget(context, balls),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  balls.clear();
                  setState(() {});
                },
                child: Text("清理棋子"))
          ],
        ),
      ),
    );
  }

  //随机颜色
  Color randomRGB() {
    return Color.fromRGBO(
        Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
  }
}

//棋子
class Draw {
  double x;
  double y;
  Color color;

  Draw(this.x, this.y, this.color);
}

class CanvasWidget extends CustomPainter {
  BuildContext context;
  Paint myPaint;
  List<Draw> balls;

  CanvasWidget(this.context, this.balls) {
    myPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //绘制横纵线
    canvasLins(canvas, size);
    if (balls != null && balls.length > 0) {
      balls.forEach((element) {
        canvasBalls(canvas, element);
      });
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  //绘制横纵线
  void canvasLins(Canvas canvas, Size size) {
    Path path = Path();
    int sizeWidth = 10;
    for (int i = 0; i < sizeWidth + 1; i++) {
      //横线
      path.moveTo(0, size.height / sizeWidth.toDouble() * i);
      path.lineTo(size.width, size.height / sizeWidth.toDouble() * i);
    }
    //绘制竖线
    for (int j = 0; j < sizeWidth + 1; j++) {
      path.moveTo(size.width / sizeWidth * j, 0);
      path.lineTo(size.width / sizeWidth * j, size.height);
    }
    //绘制横纵线
    canvas.drawPath(path, myPaint);
  }

  /// 绘制棋子
  void canvasBalls(Canvas canvas, Draw element) {
    myPaint.color = element.color;
    myPaint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(element.x, element.y), 10, myPaint);
  }
}
