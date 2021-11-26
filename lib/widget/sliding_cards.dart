import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: PageView(
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            itemTitle: [
              "· 有良好的java语言基础，熟练掌握面向对象思想",
              "· 有良好的java语言基础，熟练掌握面向对象思想",
              "· 有良好的java语言基础，熟练掌握面向对象思想"
            ],
            assetName: 'steve-johnson.jpeg',
            offset: pageOffset,
          ),
          SlidingCard(
            itemTitle: [
              "· 有良好的java语言基础，熟练掌握面向对象思想",
              "· 有良好的java语言基础，熟练掌握面向对象思想",
              "· 有良好的java语言基础，熟练掌握面向对象思想"
            ],
            assetName: 'rodion-kutsaev.jpeg',
            offset: pageOffset - 1,
          ),
          SlidingCard(
            itemTitle: [
              "· 有良好的java语言基础，熟练掌握面向对象思想",
              "· 有良好的java语言基础，熟练掌握面向对象思想",
              "· 有良好的java语言基础，熟练掌握面向对象思想"
            ],
            assetName: 'steve-johnson.jpeg',
            offset: pageOffset - 2,
          ),
          SlidingCard(
            itemTitle: [
              "· 有良好的java语言基础，熟练掌握面向对象思想",
              "· 有良好的java语言基础，熟练掌握面向对象思想",
              "· 有良好的java语言基础，熟练掌握面向对象思想"
            ],
            assetName: 'steve-johnson.jpeg',
            offset: pageOffset - 3,
          ),
          SlidingCard(
            itemTitle: [
              "· 有良好的java语言基础，熟练掌握面向对象思想",
              "· 有良好的java语言基础，熟练掌握面向对象思想",
              "· 有良好的java语言基础，熟练掌握面向对象思想"
            ],
            assetName: 'steve-johnson.jpeg',
            offset: pageOffset - 4,
          ),
          SlidingCard(
            itemTitle: [
              "· 有良好的java语言基础，熟练掌握面向对象思想",
              "· 有良好的java语言基础，熟练掌握面向对象思想"
            ],
            assetName: 'steve-johnson.jpeg',
            offset: pageOffset - 5,
          ),
        ],
      ),
    );
  }
}

class SlidingCard extends StatelessWidget {
  final List<String> itemTitle;
  final String assetName;
  final double offset;

  const SlidingCard({
    Key key,
    @required this.itemTitle,
    @required this.assetName,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.asset(
                'assets/$assetName',
                height: 180,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.none,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: CardContent(
                itemTitle: itemTitle,
                offset: gauss,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final double offset;
  final List<String> itemTitle;

  const CardContent({Key key, @required this.itemTitle, @required this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: getContent(),
      ),
    );
  }

  List<Widget> getContent() {
    List<Widget> widgets = [];

    for (int i = 0; i < itemTitle.length; i++) {
      widgets.add(Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Transform.translate(
          offset: Offset(8 * offset, 0),
          child: Text(itemTitle[i], style: TextStyle(fontSize: 14)),
        ),
      ));
    }

    return widgets;
  }
}
