import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/base/base_routes_widget.dart';
import 'package:flutter1/data/data_json.dart';
import 'package:flutter1/projectList/project_del.dart';
import 'package:flutter1/widget/lazy_load_image_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

// @description 作用:
// @date: 2021/11/29
// @author: 卢融霜

class ProjectList extends StatefulWidget {
  const ProjectList({Key key}) : super(key: key);

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  @override
  Widget build(BuildContext context) {
    return BaseRoutesWidget(
        title: "项目经历",
        child: CustomScrollView(
          slivers: [for (ComPro comPro in comInfoList) sliverItem(comPro)],
        ));
  }

  Widget sliverItem(ComPro comPro) {
    int i = comInfoList.indexOf(comPro);
    return SliverStickyHeader(
      header: Container(
        color: const Color(0xfff2f2f2),
        padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 10.r),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8.r),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  border:
                      Border.all(color: const Color(0xfff2f2f2), width: 0.5.r)),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
                child: Image.asset(
                  "assets/images/ic_zbbanner.png",
                  width: 40.r,
                  height: 30.r,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              comInfoList[i].title,
              style: TextStyle(color: Color(0xff333333), fontSize: 14.sp),
            )
          ],
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => InkWell(
            onTap: () {
              Navigator.push(context, PageRouteBuilder(
                pageBuilder: (
                  BuildContext context,
                  animation,
                  secondaryAnimation,
                ) {
                  return FadeTransition(
                    opacity: animation,
                    child: ProjectDel(comInfoList[i].infoList[index]),
                  );
                },
              ));
            },
            child: ProjectWidget(comInfoList[i].infoList[index]),
          ),
          childCount: comInfoList[i].infoList.length,
        ),
      ),
    );
  }
}

class ProjectWidget extends StatefulWidget {
  ProjectBean projectInfo;

  ProjectWidget(this.projectInfo, {Key key}) : super(key: key);

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey[100], width: 0.4.r))),
      padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 20.r),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                  tag: widget.projectInfo.title,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        border: Border.all(
                            width: 0.4.r, color: const Color(0xfff2f2f2))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      child: LazyLoadImageWidget(
                        widget.projectInfo.iconUrl,
                        width: 55.r,
                        height: 55.r,
                      ),
                    ),
                  )),
              Expanded(
                  flex: 7,
                  child: Container(
                    padding: EdgeInsets.only(left: 8.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.projectInfo.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: const Color(0xff333333),
                                fontSize: 15.r)),
                        Padding(
                          padding: EdgeInsets.only(top: 3.r),
                          child: Text(widget.projectInfo.content,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: const Color(0xff333333),
                                  fontSize: 12.r)),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    height: 55.r,
                    alignment: Alignment.center,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.r, vertical: 5.r),
                      decoration: BoxDecoration(
                          color: const Color(0xfff2f2f2),
                          borderRadius: BorderRadius.all(Radius.circular(5.r))),
                      child: Text(
                        "获取",
                        style:
                            TextStyle(fontSize: 12.r, color: Colors.blueAccent),
                      ),
                    ),
                  ))
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 10.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (String url in widget.projectInfo.screenList
                    .map((e) => e.imgUrl)
                    .toList()
                    .getRange(0, 3))
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        border: Border.all(
                            width: 0.4.r, color: const Color(0xfff2f2f2))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      child: LazyLoadImageWidget(
                        url,
                        width: 90.r,
                        height: 150.r,
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
