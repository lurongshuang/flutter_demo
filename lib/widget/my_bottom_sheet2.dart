import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/widget/sheet_icon.dart';
import 'package:flutter1/widget/sheet_title.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// @description 作用: MyBottomSheet 即兴改造
// @date: 2021/11/26
// @author: 卢融霜

class MyBottomSheet2 extends StatefulWidget {
  MyBottomSheet2({Key key}) : super(key: key);

  @override
  _MyBottomSheet2State createState() => _MyBottomSheet2State();
}

List<ItemData> itemDatas = [
  ItemData(
      "https://t12.baidu.com/it/u=2453715824,121854933&fm=173&app=25&f=JPEG?w=639&h=399&s=9CA0069D451243D21CA0B1DE030040A9",
      "大圣神威",
      "孙悟空每次释放技能后强化下次普攻，并且附带位移效果。简单来说，被动是孙悟空高伤害的基础，天生20%的暴击几率使得孙悟空注定要成为一个暴力流的英雄。另外需要注意的是孙悟空初始暴击效果只有150%，这就使得前期的孙悟空虽然可以出暴击，但伤害不是很高，因此要尽量避免与敌人正面交战，等自己核心装备无尽战刃出来再说。"),
  ItemData(
      "https://t12.baidu.com/it/u=1192333310,3230582637&fm=173&app=25&f=JPEG?w=640&h=338&s=E9D4538F784090530CB14FBF03005087",
      "护身咒法",
      "孙悟空释放该技能，可以在一秒内抵挡一次敌方技能，若抵挡成功，孙悟空将获得短暂的无敌效果以及持续4秒的护盾，该技能使得孙悟空在改版之后保命能力大大提升。从数值上可以看出，该技能加满点之后可为孙悟空获得高达1000点的护盾，大大提高了孙悟空击杀脆皮的成功率。另外，该技能前期冷却时间较长，作为辅助技能比较好，推荐为次点技能。"),
  ItemData(
      "https://t10.baidu.com/it/u=3989151291,3332133202&fm=173&app=25&f=JPEG?w=640&h=360&s=3E29A00B42030EF6F4A1FA8303007087",
      "斗战冲锋",
      "该技能为孙悟空的主要位移技能，朝指定方向位移，命中敌人后可以借力翻滚，该效果在一定程度上增加了孙悟空的位移距离，在不被控住的情况下可以灵活的的冲出包围圈，并且翻滚效果还可以在团战时跨越前排直击后排，增加了孙悟空切后排的方式，但是该方法难度较大，要多加练习方可掌握。相比一技能来说，该技能CD相对较短，推荐主点。"),
  ItemData(
      "https://t10.baidu.com/it/u=3350237058,4106918017&fm=173&app=25&f=JPEG?w=640&h=373&s=F38260A44C427AD40EB2C199030090BB",
      "如意金箍",
      "孙悟空将金箍棒插入大地，震飞范围内敌人并眩晕一秒，同时对命中敌人打上三层印记，再次攻击触发印记造成高额伤害。该技能是孙悟空主要的控制技能，命中脆皮后很容易秒杀，关键就在于是否能够命中敌人，一般来说在突进贴脸后命中率较大，这对于自己的手速也有一定的考验。该技能的三层印记是不容忽略的，因此在保证大招命中率的同时，要尽量先放大招，利用一二技能来收割。"),
  ItemData(
      "https://t11.baidu.com/it/u=1764226162,1265974581&fm=173&app=25&f=JPEG?w=640&h=360&s=9A1B6687160322F0008BA5B70300D06A",
      "大圣神威",
      "孙悟空将金箍棒插入大地，震飞范围内敌人并眩晕一秒，同时对命中敌人打上三层印记，再次攻击触发印记造成高额伤害。该技能是孙悟空主要的控制技能，命中脆皮后很容易秒杀，关键就在于是否能够命中敌人，一般来说在突进贴脸后命中率较大，这对于自己的手速也有一定的考验。该技能的三层印记是不容忽略的，因此在保证大招命中率的同时，要尽量先放大招，利用一二技能来收割。"),
];

AnimationController _controller;

//最小宽度
double iconMinWidth = 45.r;
//最大宽度
double iconMaxWidth = 100.r;

//向上最小高度
double iconMinTop = 60.r;
//向上最大高度
double iconManTop = 100.r;

class _MyBottomSheet2State extends State<MyBottomSheet2>
    with SingleTickerProviderStateMixin {
  //最小高度
  double minHeight = 120.r;

  //最大高度
  double get maxHeight => MediaQuery.of(context).size.height - 90.r;

  //数据长度
  int get itemDatasLength => itemDatas.length;

  //垂直间距
  double get iconVerticalSpa =>
      //页面最大高
      (maxHeight -
          //头部标题高度
          (60.r) -
          //纵向数量
          (iconMaxWidth * itemDatasLength)) /
      itemDatasLength;

  //横向间距
  double get iconHorizonSpa =>
      (MediaQuery.of(context).size.width -
          //左右 两个外边距  30.r * 2
          (60.r) -
          //横向数量
          (iconMinWidth * itemDatasLength)) /
      (itemDatasLength - 1);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
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
                  height: lerp(minHeight, maxHeight),
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onVerticalDragUpdate: _dragUpdate,
                    onVerticalDragEnd: _handleDragEnd,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30.r)),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 30.r),
                        child: Stack(
                          children: [
                            Positioned(
                              height: 60.r,
                              top: 20.r,
                              left: 0,
                              child: SheetTitle(
                                fontSize: lerp(14.sp, 20.sp),
                                title: "技能点",
                              ),
                            ),
                            Positioned(
                                height: 60.r,
                                top: 20.r,
                                right: 0,
                                child: InkWell(
                                  onTap: _toggle,
                                  child: SheetIcon(
                                    fontSize: lerp(20.sp, 30.sp),
                                    showList: _controller.status ==
                                        AnimationStatus.completed,
                                  ),
                                )),
                            for (ItemData itemData in itemDatas)
                              getIconList(itemData),
                            for (ItemData itemData in itemDatas)
                              getContentList(itemData),
                          ],
                        )),
                  ))
            ],
          );
        });
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
    _controller.value -= details.primaryDelta / maxHeight;
  }

  /// 开关核心代码： 根据滑动速度，滑动高度，来判断 开关
  void _handleDragEnd(DragEndDetails details) {
    //排除 动画过程中，和完成状态。
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    //获取滑动速度
    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;

    //设置滑动执行方向
    if (flingVelocity < 0.0) {
      _controller.fling(velocity: max(1.0, -flingVelocity));
    } else if (flingVelocity > 0.0) {
      _controller.fling(velocity: min(-1.0, -flingVelocity));
    } else {
      _controller.fling(velocity: _controller.value < 0.5 ? -1.0 : 1.0);
    }
  }

  //图片距离左侧数值
  double iconItemLeft(i) {
    //min: 第i个  * （间距 + 最小宽度）   max 靠最左  0
    return lerp(i * (iconHorizonSpa + iconMinWidth), 0);
  }

  //详细信息item 距离左侧数据
  double contentItemLeft(i) {
    //min: 第i个  * （间距 + 最小宽度）   max 靠最左  0
    return iconItemLeft(i) + lerp(iconMinWidth, iconMaxWidth);
  }

  double iconItemTop(i) {
    return lerp(iconMinTop, iconMinTop + i * (iconVerticalSpa + iconManTop));
  }

  ///底部横向 图片展示
  Widget getIconList(ItemData itemData) {
    int i = itemDatas.indexOf(itemData);
    return SheetIconWidget(
        height: lerp(iconMinWidth.r, iconMaxWidth),
        width: lerp(iconMinWidth.r, iconMaxWidth),
        top: iconItemTop(i),
        left: iconItemLeft(i),
        url: itemData.url);
  }

  ///展开后，显示 右侧详细信息
  Widget getContentList(ItemData itemData) {
    int i = itemDatas.indexOf(itemData);
    return SheetContentWidget(
        height: lerp(iconMinWidth.r, iconMaxWidth),
        width: lerp(
            0,
            MediaQuery.of(context).size.width -
                60.r -
                lerp(iconMinWidth.r, iconMaxWidth)),
        top: iconItemTop(i),
        left: contentItemLeft(i),
        itemData: itemData);
  }
}

/// 滑动核心代码， 根据 _controller.value 的0 - 1的值，返回 minHeight - maxHeight 相对于的值，完成高度设置
double lerp(double minHeight, double maxHeight) {
  var height = lerpDouble(minHeight, maxHeight, _controller.value);
  return height;
}

//详细信息子item
class ContentItem extends StatelessWidget {
  ItemData itemData;

  ContentItem(this.itemData, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
                child: Text(
              itemData.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.r),
            ))
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 2.r),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                itemData.text,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12.r, color: Colors.grey),
              ))
            ],
          ),
        )
      ],
    );
  }
}

//详细信息item
class SheetContentWidget extends StatelessWidget {
  double height;
  double width;
  double top;
  double left;
  ItemData itemData;

  SheetContentWidget(
      {this.height, this.width, this.top, this.left, this.itemData, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        height: height,
        width: width,
        top: top,
        left: left,
        child: AnimatedOpacity(
            opacity: _controller.status == AnimationStatus.completed ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(lerp(5.r, 10.r))),
              ),
              height: iconMaxWidth,
              width: MediaQuery.of(context).size.width - 60.r - iconMaxWidth,
              padding: EdgeInsets.all(8.r),
              child: Visibility(
                  visible: _controller.status == AnimationStatus.completed,
                  child: ContentItem(itemData)),
            )));
  }
}

///图片
class SheetIconWidget extends StatelessWidget {
  double height;
  double width;
  double top;
  double left;
  String url;

  SheetIconWidget(
      {this.url, this.height, this.width, this.top, this.left, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        height: height,
        width: width,
        top: top,
        left: left,
        child: ClipRRect(
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(lerp(5.r, 10.r)),
              right: Radius.circular(lerp(5.r, 0))),
          child: Image.network(
            url,
            fit: BoxFit.cover,
          ),
        ));
  }
}

///实体类
class ItemData {
  String url;
  String title;
  String text;

  ItemData(this.url, this.title, this.text);
}
