import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'base/base_routes_widget.dart';

/// @description 作用:标讯
/// @date: 2021/9/27
/// @author:卢融霜
class BidNews extends StatefulWidget {
  const BidNews({Key key}) : super(key: key);

  @override
  _BidNewsState createState() => _BidNewsState();
}

bool showSearch = false;

class _BidNewsState extends State<BidNews> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseRoutesWidget(
        appBar: AppBar(
          // backgroundColor: const Color.fromRGBO(16, 146, 250, 0.95),
          toolbarHeight: 0,
          elevation: 0,
        ),
        child: Material(
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (notification is ScrollUpdateNotification) {
                if (notification.metrics.pixels > 105.h) {
                  setState(() {
                    showSearch = true;
                  });
                } else {
                  setState(() {
                    showSearch = false;
                  });
                }
              }
              return false;
            },
            child: CustomScrollView(
              slivers: [
                SliverVisibility(
                    visible: showSearch,
                    sliver: SliverPersistentHeader(
                        floating: false,
                        pinned: true,
                        delegate: _SliverAppBarDelegaTeSearch())),
                SliverAppBar(
                  collapsedHeight: showSearch ? (160.h - 55.h) : 160.h,
                  flexibleSpace: Container(
                    height: 160.h,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage("assets/images/ic_zbbanner.png"))),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 20.h, left: 20.r, right: 20.r),
                    child: Column(
                      children: [
                        Text(
                          "水利行业招标信息实时推送",
                          style: TextStyle(fontSize: 16.sp, color: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Text(
                            "今日新增：123123条信息",
                            style: TextStyle(fontSize: 12.sp, color: Colors.white),
                          ),
                        ),
                        Visibility(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 8.h, bottom: 8.h, left: 10.r, right: 10.r),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(5.r))),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person_search_rounded,
                                    color: const Color.fromRGBO(170, 170, 170, 1),
                                    size: 20.sp,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.r),
                                    child: Text(
                                      "请输入招投标信息关键字",
                                      style: TextStyle(
                                          color: const Color.fromRGBO(170, 170, 170, 1),
                                          fontSize: 12.r),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          visible: !showSearch,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Text(
                              "热搜：招标    中标",
                              style: TextStyle(fontSize: 12.sp, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverAppBar(
                  collapsedHeight: 85.h,
                  flexibleSpace: Container(
                    color: Colors.white,
                    height: double.infinity,
                    padding: EdgeInsets.all(10.r),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _TypeItem("assets/images/ic_zbzxico.png", "招标资讯"),
                        _TypeItem("assets/images/ic_zbflico.png", "招标法律"),
                        _TypeItem("assets/images/ic_zbzcico.png", "招标政策"),
                        _TypeItem("assets/images/ic_zbgfico.png", "招标规范")
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                    floating: false,
                    pinned: true,
                    delegate: _SliverAppBarDelegateMord()),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return const ListItem();
                }))
              ],
            ),
          ),
        ));
  }
}

//列表子集
class ListItem extends StatelessWidget {
  const ListItem({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
                  width: 0.5.r,
                  color: const Color.fromRGBO(230, 230, 230, 1)))),
      child: Column(
        children: [
          Text(
            "北京市海淀区人民防空办公室2012年1月1日至2月1日政府采购意向书3",
            style: TextStyle(
                fontSize: 14.r,
                color: const Color.fromRGBO(51, 51, 51, 1),
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.r),
            child: Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    TagItem(
                        const Color(0xffe3f4fc), const Color(0xff2a96f0), "海淀"),
                    TagItem(
                        const Color(0xfffdf0e8), const Color(0xffe28703), "招标")
                  ],
                )),
                Icon(
                  Icons.access_time,
                  color: const Color.fromRGBO(
                    170,
                    170,
                    170,
                    1,
                  ),
                  size: 15.sp,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 5.r),
                    child: Text(
                      "2021-03-08",
                      style: TextStyle(
                          fontSize: 12.r,
                          color: const Color.fromRGBO(170, 170, 170, 1)),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

//列表 列表tag
class TagItem extends StatelessWidget {
  TagItem(this.bgColor, this.textColor, this.title, {key}) : super(key: key);

  Color bgColor;
  Color textColor;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.r),
      padding: EdgeInsets.only(left: 5.r, right: 5.r, top: 2.r, bottom: 2.r),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.all(Radius.circular(2.r))),
      child: Text(
        title,
        style: TextStyle(fontSize: 12.r, color: textColor),
      ),
    );
  }
}

//吸顶搜索
class _SliverAppBarDelegaTeSearch extends SliverPersistentHeaderDelegate {
  final double minHeight = 55.h;
  final double maxHeight = 55.h;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 55.h,
      color: Colors.blue,
      padding:
          EdgeInsets.only(left: 20.r, right: 20.r, top: 12.r, bottom: 12.r),
      child: Container(
        padding: EdgeInsets.only(left: 10.r, right: 10.r),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.r))),
        child: Row(
          children: [
            Icon(
              Icons.person_search_rounded,
              color: const Color.fromRGBO(170, 170, 170, 1),
              size: 20.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.r),
              child: Text(
                "请输入招投标信息关键字",
                style: TextStyle(
                    color: const Color.fromRGBO(170, 170, 170, 1),
                    fontSize: 12.r),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent;
  }
}

//吸顶最新标讯
class _SliverAppBarDelegateMord extends SliverPersistentHeaderDelegate {
  final double minHeight = 35.h;
  final double maxHeight = 35.h;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: EdgeInsets.only(left: 10.r, right: 10.r),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
                  width: 0.5.r,
                  color: const Color.fromRGBO(230, 230, 230, 1)))),
      child: Row(
        children: [
          Text(
            "最新标讯",
            style: TextStyle(
                fontSize: 12.sp,
                color: const Color.fromRGBO(51, 51, 51, 1),
                fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "更多 >",
              style: TextStyle(
                  fontSize: 12.r,
                  color: const Color.fromRGBO(170, 170, 170, 1)),
            ),
          ))
        ],
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverAppBarDelegateMord oldDelegate) {
    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent;
  }
}

//分类导航item
class _TypeItem extends StatelessWidget {
  String url;
  String title;

  _TypeItem(this.url, this.title, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(url, width: 40.r, height: 40.r, fit: BoxFit.fitWidth),
        Padding(
          padding: EdgeInsets.only(top: 5.r),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 12.r, color: const Color.fromRGBO(51, 51, 51, 1)),
          ),
        )
      ],
    );
  }
}
