import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/base/base_routes_widget.dart';
import 'package:flutter1/projectList/project_del.dart';
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
  List<ComPro> comList = [
    ComPro("北京宏宇睿晨信息技术有限公司", "", [
      ProjectInfo(
          "云水利", "assets/images/ic_zbbanner.png", "完善数据汇总，精准高效，轻松查询。", "", "", [
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png"
      ]),
      ProjectInfo("辽宁水利信用", "assets/images/ic_zbbanner.png",
          "告别打卡机，考勤信息随时掌控，让管理不在依赖说教。", "", "", [
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png"
      ]),
      ProjectInfo("水利云播-云课堂直播", "assets/images/ic_zbbanner.png", '系列"云课堂"宣贯活动',
          "", "", [
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png"
      ]),
      ProjectInfo("会员服务系统", "assets/images/ic_zbbanner.png",
          '为"中国建设工程造价管理协会"用户提供服务', "", "", [
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png"
      ]),
      ProjectInfo("中国水利水电工程网", "assets/images/ic_zbbanner.png",
          "汇集水利招投标、机械设备、商品采买一站式服务平台。", "", "", [
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png"
      ]),
      ProjectInfo("海天恒信PC官网", "assets/images/ic_zbbanner.png",
          "海纳百川恒久远，天容万物信无涯", "", "", [
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png"
      ]),
      ProjectInfo("快刷题", "assets/images/ic_zbbanner.png",
          "一款在线练习的题库，分为免费题库和付费题库，可进行在线刷题、搜索答案等。", "", "", [
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png"
      ]),
      ProjectInfo("水利职业培训", "assets/images/ic_zbbanner.png", "海川韵通", "", "", [
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png"
      ]),
      ProjectInfo("水利工程造价题集", "assets/images/ic_zbbanner.png", "水利工程专业题型，等你来练习",
          "", "", [
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png"
      ])
    ]),
    ComPro("北京世纪金政信息技术股份有限公司", "", [
      ProjectInfo(
          "北京干部教育网", "assets/images/ic_zbbanner.png", "北京干部教育网", "", "", [
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png"
      ])
    ]),
    ComPro("其他", "", [
      ProjectInfo("三峡员工商城", "assets/images/ic_zbbanner.png", "三峡员工商城", "", "", [
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png"
      ]),
      ProjectInfo("三峡员工商城", "assets/images/ic_zbbanner.png", "三峡员工商城", "", "", [
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png"
      ]),
      ProjectInfo("三峡员工商城", "assets/images/ic_zbbanner.png", "三峡员工商城", "", "", [
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png",
        "assets/images/ic_zbbanner.png"
      ])
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return BaseRoutesWidget(
        title: "项目经历",
        child: CustomScrollView(
          slivers: [for (ComPro comPro in comList) sliverItem(comPro)],
        ));
  }

  Widget sliverItem(ComPro comPro) {
    int i = comList.indexOf(comPro);
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
              comList[i].title,
              style: TextStyle(color: Color(0xff333333), fontSize: 14.sp),
            )
          ],
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => InkWell(
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => const ProjectDel()));
            },
            child: ProjectWidget(comList[i].infoList[index]),
          ),
          childCount: comList[i].infoList.length,
        ),
      ),
    );
  }
}

class ProjectWidget extends StatefulWidget {
  ProjectInfo projectInfo;

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
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
                child: Image.asset(
                  "assets/images/ic_zbbanner.png",
                  width: 55.r,
                  height: 55.r,
                  fit: BoxFit.cover,
                ),
              ),
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
                for (String url in widget.projectInfo.images)
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.r)),
                    child: Image.asset(
                      url,
                      width: 100.r,
                      height: 150.r,
                      fit: BoxFit.cover,
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

class ProjectInfo {
  String title;
  String iconUrl;
  String content;
  String androidUrl;
  String iosUrl;
  List<String> images;

  ProjectInfo(this.title, this.iconUrl, this.content, this.androidUrl,
      this.iosUrl, this.images);
}

class ComPro {
  String title;
  String iconUrl;
  List<ProjectInfo> infoList;

  ComPro(this.title, this.iconUrl, this.infoList);
}
