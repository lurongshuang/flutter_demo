import 'dart:ui';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/base/base_routes_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// @description 作用:
// @date: 2021/11/29
// @author: 卢融霜

class CompanyDel extends StatefulWidget {
  const CompanyDel({Key key}) : super(key: key);

  @override
  _CompanyDelState createState() => _CompanyDelState();
}

class _CompanyDelState extends State<CompanyDel> {
  List<TreatmentBean> treatList = [
    TreatmentBean("五险一金", Icons.account_balance_outlined),
    TreatmentBean("加班补助", Icons.watch_later_outlined),
    TreatmentBean("年终奖", Icons.wallet_membership_outlined),
    TreatmentBean("带薪年假", Icons.wallet_travel),
    TreatmentBean("节日福利", Icons.wallet_giftcard_outlined)
  ];

  List<String> infoList = [
    "公司全称     北京宏宇睿晨信息技术有限公司",
    "信用代码     91110108582533228W",
    "法定代表     卢晓芳",
    "注册资本     50万人民币",
    "成立日期     2011-09-15",
    "企业类型     有限责任公司",
    "经营范围     技术开发、技术推广、技术转让、技术咨询、技术服务；计算机技术培训；计算机系统服务、数据处理、计算机维修；基础软件服务、应用软件服务。(企业依法自主选择经营项目，开展经营活动；依法须经批准的项目，经相关部门批准后依批准的内容开展经营活动；不得从事本市产业政策禁止和限制类项目的经营活动。)"
  ];

  @override
  Widget build(BuildContext context) {
    return BaseRoutesWidget(
        title: "详情",
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/ic_bgImg.png"),
                  fit: BoxFit.cover)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(102, 102, 102, 0.2)),
                padding: EdgeInsets.only(top: 10.r, left: 15.r, bottom: 15.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        padding: EdgeInsets.only(right: 15.r),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "宏宇睿晨",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.sp),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.r),
                                  child: Text(
                                    "未融资 · 0-20人 · 信息安全",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                )
                              ],
                            )),
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                              child: Image.asset(
                                "assets/images/ic_zbbanner.png",
                                width: 55.r,
                                height: 55.r,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        )),
                    Container(
                      padding: EdgeInsets.only(right: 15.r, top: 20.r),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 15.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.r, right: 15.r),
                            child: Text(
                              "上午09：00-下午06：00",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.sp),
                            ),
                          ),
                          Icon(
                            Icons.weekend_outlined,
                            color: Colors.white,
                            size: 15.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.r, right: 15.r),
                            child: Text(
                              "双休",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.sp),
                            ),
                          ),
                          Icon(
                            Icons.work_outline_rounded,
                            color: Colors.white,
                            size: 15.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.r, right: 15.r),
                            child: Text(
                              "不加班",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.sp),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 20.r),
                      height: 50.r,
                      child: ListView.builder(
                          itemCount: treatList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              width: 100.r,
                              margin: EdgeInsets.only(right: 10.r),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: 0.4.r),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.r))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    treatList[index].iconData,
                                    color: Colors.white,
                                    size: 25.sp,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.r),
                                    child: Text(
                                      treatList[index].title,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.sp),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(right: 15.r, top: 20.r),
                      child: Text(
                        "公司地址",
                        style: TextStyle(
                            fontSize: 14.r,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(right: 15.r, top: 10.r),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            "北京房山区起航国际3期16号院13号楼504室",
                            style: TextStyle(
                                fontSize: 12.r,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(5.r),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: 0.4.r),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.r))),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.map_outlined,
                                    size: 15.r,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "导航",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(right: 15.r, top: 20.r),
                      child: Text(
                        "公司介绍",
                        style: TextStyle(
                            fontSize: 14.r,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(right: 15.r, top: 20.r),
                      child: ExpandableText(
                        "         北京宏宇睿晨信息技术有限公司成立于2011年，是专注于行业信息化的IT服务提供商，是北京市软件企业、高新技术企业、科技型中小企业。\n"
                        "         根据国务院《关于社会信用体系建设规划纲要》，公司致力于为水利、建设等行业提供专业的信用体系建设信息化解决方案。经过多年的发展，公司形成了“圆环形”的发展战略，暨以行业“信用体系”建设为圆心，以“信用体系标准建设”、“行业信用评价”等以服务于信用体系建设为圆环的互联网应用服务和大数据服务为牵引，彼此依托，努力成为中国行业信用体系建设的中坚力量。\n"
                        "         公司产品围绕“信用体系建设”核心，涵盖行业“信用征集体系”、“信用评价体系”、“信用标准体系”、“行业工程项目动态管理”、“人员注册管理”等领域，为政府、行业提供整体解决方案和专业服务，目前产品已在全国所有省市广泛应用。\n"
                        "         公司拥有高素质的技术研发和服务团队，建立了领先的技术管理模式、IT服务模式，形成了一套具有自身特色的、符合现代企业发展的科学管理体系，持续为客户提供卓越的产品和服务。\n"
                        "         未来，公司继续围绕“圆环形”的发展战略，持续在行业信用体系建设领域不断创新，迎接行业变革新挑战。",
                        expandText: "展开",
                        collapseText: "收起",
                        maxLines: 5,
                        style: TextStyle(
                            fontSize: 12.r, height: 1.5.r, color: Colors.white),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(right: 15.r, top: 20.r),
                      child: Text(
                        "工商信息",
                        style: TextStyle(
                            fontSize: 14.r,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                        itemCount: infoList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(right: 15.r, top: 10.r),
                            child: Text(
                              infoList[index],
                              style: TextStyle(
                                  fontSize: 12.r,
                                  color: Colors.white,
                                  height: 1.5.r),
                            ),
                          );
                        })
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class TreatmentBean {
  String title;
  IconData iconData;

  TreatmentBean(this.title, this.iconData);
}
