import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @description 作用:二维数组组件
/// @date: 2021/10/20
/// @author:卢融霜
class LevelWidget extends StatefulWidget {
  List<ProvinceBean> levelList;
  Function(int, String) provinceClickAction;
  Function(int, String, int, String) cityClickAction;
  int provinceIndex;
  int cityIndex;

  LevelWidget(this.levelList,
      {this.provinceClickAction,
      this.cityClickAction,
      this.provinceIndex,
      this.cityIndex,
      Key key})
      : super(key: key);

  @override
  _LevelWidgetState createState() => _LevelWidgetState();
}

class _LevelWidgetState extends State<LevelWidget> {
  int pIndex = 0;
  int cIndex = 0;

  @override
  void initState() {
    pIndex = widget.provinceIndex;
    cIndex = widget.cityIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: ListView.builder(
                itemCount: widget.levelList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        pIndex = index;
                        if (widget.provinceClickAction != null) {
                          widget.provinceClickAction(
                              pIndex, widget.levelList[index].pTitle);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: getPAction(index),
                          border: Border(
                              bottom: BorderSide(
                                  color: const Color(0xffdddddd),
                                  width: 0.4.r))),
                      padding: EdgeInsets.all(10.r),
                      child: Text(widget.levelList[index].pTitle,
                          style: TextStyle(fontSize: 14.sp)),
                    ),
                  );
                })),
        Expanded(
            flex: 1,
            child: ListView.builder(
                itemCount: widget.levelList[pIndex].cList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        cIndex = index;
                        widget.cityIndex = index;
                        widget.provinceIndex = pIndex;
                        if (widget.cityClickAction != null) {
                          widget.cityClickAction(
                              pIndex,
                              widget.levelList[pIndex].pTitle,
                              cIndex,
                              widget.levelList[pIndex].cList[index].cTitle);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffdddddd),
                          border: Border(
                              bottom: BorderSide(
                                  color: const Color(0xffffffff),
                                  width: 0.4.r))),
                      padding: EdgeInsets.all(10.r),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                                  widget.levelList[pIndex].cList[index].cTitle,
                                  style: TextStyle(fontSize: 14.sp))),
                          getCWidget(
                            index,
                          )
                        ],
                      ),
                    ),
                  );
                }))
      ],
    );
  }

  Color getPAction(index) {
    return (pIndex == index)
        ? const Color(0xffdddddd)
        : const Color(0xffffffff);
  }

  Widget getCWidget(index) {
    return cIndex == index && pIndex == widget.provinceIndex
        ? Icon(Icons.adjust_rounded, size: 18.sp, color: Colors.blue)
        : const Text("");
  }
}

class ProvinceBean {
  String pTitle;
  List<CityBean> cList;

  ProvinceBean(this.pTitle, this.cList);
}

class CityBean {
  String cTitle;

  CityBean(this.cTitle);
}
