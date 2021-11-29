import 'package:flutter/material.dart';
import 'package:flutter1/base/base_routes_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// @description 作用:
// @date: 2021/11/29
// @author: 卢融霜

class ProjectDel extends StatefulWidget {
  const ProjectDel({Key key}) : super(key: key);

  @override
  _ProjectDelState createState() => _ProjectDelState();
}

class _ProjectDelState extends State<ProjectDel> {
  @override
  Widget build(BuildContext context) {
    return BaseRoutesWidget(
        title: "辽宁水利信用",
        child: Container(
          padding: EdgeInsets.all(15.r),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.r)),
                    child: Image.asset(
                      "assets/images/ic_zbbanner.png",
                      width: 85.r,
                      height: 85.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(left: 8.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("辽宁水利信用",
                            style: TextStyle(
                                color: const Color(0xff333333),
                                fontSize: 15.r)),
                        Padding(
                          padding: EdgeInsets.only(top: 5.r),
                          child: Text("辽宁水利信用",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: const Color(0xff333333),
                                  fontSize: 12.r)),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ],
          ),
        ));
  }
}
