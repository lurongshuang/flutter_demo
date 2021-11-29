import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/base/base_routes_widget.dart';
import 'package:flutter1/companyDel/company_del.dart';
import 'package:flutter1/drop_down_page.dart';
import 'package:flutter1/widget/my_bottom_sheet2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'boottom_sheet_routes2.dart';
import 'bottom_sheet_routes.dart';
import 'custom_scrollview_sliver_test.dart';
import 'gesture_detector_test.dart';
import 'gesture_detector_test1.dart';
import 'head_twinkle.dart';

/// @description 作用:列表
/// @date: 2021/9/28
/// @author:
class RoutesList extends StatefulWidget {
  const RoutesList({Key key}) : super(key: key);

  @override
  _RoutesListState createState() => _RoutesListState();
}

class Bean {
  String title;
  Widget widgetRoutes;

  Bean(this.title, this.widgetRoutes);
}

class _RoutesListState extends State<RoutesList> {
  // home: const GestureDetectorTest(),
  // home: TolyCanvas(),
  // home: const BidNews())

  List<Bean> list = [
    Bean("学习一下：CustomScrollview、SliverPersistentHeader组件", const BidNews()),
    Bean("学习一下Paint、Canvas 、GestureDetector", const GestureDetectorTest()),
    Bean("学习一下Paint、Canvas,画笔", TolyCanvas()),
    Bean("自定义下拉筛选组件", const DropDownPage()),
    Bean("绘制一颗跳动的心", const HeadTwinkle()),
    Bean("底部弹出", const BottomSheetRoutes()),
    Bean("改造MyBottomSheet", const BoottomSheetRoutes2()),
    Bean("企业详情测试", const CompanyDel()),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseRoutesWidget(
        title: "首页",
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => list[index].widgetRoutes));
                },
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  padding: EdgeInsets.all(20.r),
                  child: Row(
                    children: [Expanded(child: Text(list[index].title))],
                  ),
                ),
              );
            }));
  }
}
