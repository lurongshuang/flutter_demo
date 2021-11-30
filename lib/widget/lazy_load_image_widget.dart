import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// @description 作用:图片懒加载
// @date: 2021/11/3
// @author: 卢融霜

class LazyLoadImageWidget extends StatelessWidget {
  String url;
  double width;
  double height;

  LazyLoadImageWidget(this.url, {this.width, this.height, key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );

    // return FadeInImage.assetNetwork(
    //     fadeInDuration: const Duration(milliseconds: 300),
    //     width: width,
    //     height: height,
    //     fit: BoxFit.cover,
    //     image: url,
    //     placeholder: "assets/images/ic_zbbanner.png",
    //     imageErrorBuilder: (context, child, exception) {
    //       return Image.asset("assets/images/ic_zbbanner.png",
    //           width: width, height: height, fit: BoxFit.none);
    //     });
  }
}
