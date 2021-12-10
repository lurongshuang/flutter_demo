import 'package:flutter/material.dart';
import 'package:flutter1/base/base_routes_widget.dart';
import 'package:flutter1/widget/lazy_load_image_widget.dart';
import 'package:flutter1/widget/show_image_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// @description 作用:截图列表
// @date: 2021/12/2
// @author: 卢融霜

class ScreenshootList extends StatelessWidget {
  List<String> projectBean;

  ScreenshootList(this.projectBean, {Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BaseRoutesWidget(
      title: "截图",
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10.r,
        crossAxisSpacing: 10.r,
        childAspectRatio: 0.5,
        padding: EdgeInsets.all(10.r),
        children: [
          for (int i =0;i<  projectBean.length; i++)
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowImageWidget(
                      images: projectBean,
                      currentIndex: i,
                    ),
                  ),
                );
              },
              child: Hero(
                  tag: "tag$i",
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        border: Border.all(
                            width: 0.4.r, color: const Color(0xffd6d6d6))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      child: LazyLoadImageWidget(
                        projectBean[i],
                      ),
                    ),
                  )),
            )
        ],
      ),
    );
  }
}

// class _ScreenshootListState extends State<ScreenshootList> with AutomaticKeepAliveClientMixin{
//   @override
//   Widget build(BuildContext context) {
//     return BaseRoutesWidget(
//       title: "截图",
//       child: GridView.count(
//         crossAxisCount: 3,
//         mainAxisSpacing: 10.r,
//         crossAxisSpacing: 10.r,
//         childAspectRatio: 0.5,
//         padding: EdgeInsets.all(10.r),
//         children: [
//           for (int i =0;i<  widget.projectBean.length; i++)
//             InkWell(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ShowImageWidget(
//                       images: widget.projectBean,
//                       currentIndex: i,
//                     ),
//                   ),
//                 );
//               },
//               child: Hero(
//                   tag: "tag$i",
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(5.r)),
//                         border: Border.all(
//                             width: 0.4.r, color: const Color(0xffd6d6d6))),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.all(Radius.circular(5.r)),
//                       child: LazyLoadImageWidget(
//                         widget.projectBean[i],
//                       ),
//                     ),
//                   )),
//             )
//         ],
//       ),
//     );
//   }
//
//   @override
//   bool get wantKeepAlive => true;
// }
