import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'base/base_routes_widget.dart';
import 'widget/bottom_sheet.dart';

// @description 作用:
// @date: 2021/11/25
// @author: 卢融霜

class BottomSheetRoutes extends StatefulWidget {
  const BottomSheetRoutes({Key key}) : super(key: key);

  @override
  _BottomSheetRoutesState createState() => _BottomSheetRoutesState();
}

class _BottomSheetRoutesState extends State<BottomSheetRoutes> {
  @override
  Widget build(BuildContext context) {
    return BaseRoutesWidget(
      title: "底部弹出",
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: const [Text("底部弹出")],
            ),
            MyBottomSheet(100.r, MediaQuery.of(context).size.height - 90.r)
          ],
        ),
      ),
    );
  }
}
