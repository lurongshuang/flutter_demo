import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter1/base/base_routes_widget.dart';
import 'package:flutter1/widget/my_bottom_sheet2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// @description 作用:
// @date: 2021/11/26
// @author: 卢融霜

class BoottomSheetRoutes2 extends StatefulWidget {
  const BoottomSheetRoutes2({Key key}) : super(key: key);

  @override
  _BoottomSheetRoutes2State createState() => _BoottomSheetRoutes2State();
}

class _BoottomSheetRoutes2State extends State<BoottomSheetRoutes2> {
  @override
  Widget build(BuildContext context) {
    return BaseRoutesWidget(
        title: "flutter 即兴改造 MyBoottomSheet",
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                children: const [Text("改造MyBoottomSheet")],
              ),
              MyBottomSheet2()
            ],
          ),
        ));
  }
}
