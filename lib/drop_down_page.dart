import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter1/widget/drop_down_widget.dart';
import 'package:flutter1/widget/level_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'base/base_routes_widget.dart';

/// @description 作用:筛选组件
/// @date: 2021/10/14
/// @author:
class DropDownPage extends StatefulWidget {
  const DropDownPage({Key key}) : super(key: key);

  @override
  _DropDownPageState createState() => _DropDownPageState();
}

class _DropDownPageState extends State<DropDownPage> {
  List<String> titles = ["北京", "招标类型", "更多筛选"];
  List<Widget> listWidget = [];
  ScreenControl screenControl = ScreenControl();
  List<String> types = ["全部", "招标", "中标", "公示"];
  int provinceIndex = 0;
  int cityIndex = 0;
  List<ProvinceBean> defaultList = [
    ProvinceBean('北京', [CityBean('北京')]),
    ProvinceBean('广东', [
      CityBean('广州'),
      CityBean('深圳'),
      CityBean('珠海'),
      CityBean('汕头'),
      CityBean('韶关'),
      CityBean('佛山'),
      CityBean('江门'),
      CityBean('湛江'),
      CityBean('茂名'),
      CityBean('肇庆'),
      CityBean('惠州'),
      CityBean('梅州'),
      CityBean('汕尾'),
      CityBean('河源'),
      CityBean('阳江'),
      CityBean('清远'),
      CityBean('东莞'),
      CityBean('中山'),
      CityBean('潮州'),
      CityBean('揭阳'),
      CityBean('云浮')
    ]),
    ProvinceBean('上海', [CityBean('上海')]),
    ProvinceBean('天津', [CityBean('天津')]),
    ProvinceBean('重庆', [CityBean('重庆')]),
    ProvinceBean('辽宁', [
      CityBean('沈阳'),
      CityBean('大连'),
      CityBean('鞍山'),
      CityBean('抚顺'),
      CityBean('本溪'),
      CityBean('丹东'),
      CityBean('锦州'),
      CityBean('营口'),
      CityBean('阜新'),
      CityBean('辽阳'),
      CityBean('盘锦'),
      CityBean('铁岭'),
      CityBean('朝阳'),
      CityBean('葫芦岛')
    ]),
    ProvinceBean('江苏', [
      CityBean('南京'),
      CityBean('苏州'),
      CityBean('无锡'),
      CityBean('常州'),
      CityBean('镇江'),
      CityBean('南通'),
      CityBean('泰州'),
      CityBean('扬州'),
      CityBean('盐城'),
      CityBean('连云港'),
      CityBean('徐州'),
      CityBean('淮安'),
      CityBean('宿迁')
    ]),
    ProvinceBean('上海', [CityBean('上海')]),
    ProvinceBean('湖北', [
      CityBean('武汉'),
      CityBean('黄石'),
      CityBean('十堰'),
      CityBean('荆州'),
      CityBean('宜昌'),
      CityBean('襄樊'),
      CityBean('鄂州'),
      CityBean('荆门'),
      CityBean('孝感'),
      CityBean('黄冈'),
      CityBean('咸宁'),
      CityBean('随州'),
      CityBean('恩施'),
      CityBean('仙桃'),
      CityBean('天门'),
      CityBean('潜江'),
      CityBean('神农架林区')
    ]),
    ProvinceBean('四川', [
      CityBean('成都'),
      CityBean('自贡'),
      CityBean('攀枝花'),
      CityBean('泸州'),
      CityBean('德阳'),
      CityBean('绵阳'),
      CityBean('广元'),
      CityBean('遂宁'),
      CityBean('内江'),
      CityBean('乐山'),
      CityBean('南充'),
      CityBean('眉山'),
      CityBean('宜宾'),
      CityBean('广安'),
      CityBean('达州'),
      CityBean('雅安'),
      CityBean('巴中'),
      CityBean('资阳'),
      CityBean('阿坝藏族羌族自治州'),
      CityBean('甘孜藏族自治州'),
      CityBean('凉山彝族自治州')
    ]),
    ProvinceBean('陕西', [
      CityBean('西安'),
      CityBean('铜川'),
      CityBean('宝鸡'),
      CityBean('咸阳'),
      CityBean('渭南'),
      CityBean('延安'),
      CityBean('汉中'),
      CityBean('榆林'),
      CityBean('安康'),
      CityBean('商洛')
    ]),
    ProvinceBean('河北', [
      CityBean('石家庄'),
      CityBean('唐山'),
      CityBean('秦皇岛'),
      CityBean('邯郸'),
      CityBean('邢台'),
      CityBean('保定'),
      CityBean('张家口'),
      CityBean('大同'),
      CityBean('阳泉'),
      CityBean('长治'),
      CityBean('晋城'),
      CityBean('朔州'),
      CityBean('晋中'),
      CityBean('运城'),
      CityBean('忻州'),
      CityBean('临汾'),
      CityBean('吕梁')
    ]),
  ];

  @override
  void initState() {
    listWidget = [
      LevelWidget(
        defaultList,
        provinceIndex: provinceIndex,
        cityIndex: cityIndex,
        provinceClickAction: (pIndex, pTitle) {},
        cityClickAction: (pIndex, pTitle, cIndex, cTitle) {
          setState(() {
            provinceIndex = pIndex;
            cityIndex = cIndex;
            titles[0] = cTitle;
            screenControl.screenHide();
          });
        },
      ),
      ListView.builder(
          shrinkWrap: true,
          itemCount: types.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xffdddddd)))),
              padding: EdgeInsets.all(10.r),
              child: InkWell(
                  onTap: () {
                    titles[1] = types[index];
                    screenControl.screenHide();
                  },
                  child: Text(
                    types[index],
                    style: TextStyle(fontSize: 14.sp),
                  )),
            );
          }),
      ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 15.r, top: 10.r, right: 15.r, bottom: 10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("检索内容",
                    style:
                        TextStyle(fontSize: 14.r, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        "全部",
                        style: TextStyle(fontSize: 14.r),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        "标题",
                        style: TextStyle(fontSize: 14.r),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        "内容",
                        style: TextStyle(fontSize: 14.r),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15.r, right: 15.r, bottom: 10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("匹配方式",
                    style:
                        TextStyle(fontSize: 14.r, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        "全部",
                        style: TextStyle(fontSize: 14.r),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        "模糊",
                        style: TextStyle(fontSize: 14.r),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        "精准",
                        style: TextStyle(fontSize: 14.r),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseRoutesWidget(
        title: '筛选组件',
        child: DropDownWidget(
          titles,
          listWidget,
          height: 40.r,
          bottomHeight: 400.r,
          screenControl: screenControl,
          child: Container(
            margin: EdgeInsets.only(top: 40.4.r),
            child: ListView.builder(itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(15.r),
                child: Text("item $index"),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: const Color(0xffeeeeee), width: 0.4.r))),
              );
            }),
          ),
        ));
  }
}
