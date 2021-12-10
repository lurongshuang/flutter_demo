import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ShowImageWidget extends StatefulWidget {
  ShowImageWidget(
      {Key key,
        @required this.images,
        this.currentIndex = 0,
        this.controller,
        this.onLongPressPath})
      : super(key: key);
  final List<String> images;
  final int currentIndex;
  final PageController controller;
  Function(String) onLongPressPath;

  @override
  _ShowImageWidgetState createState() => _ShowImageWidgetState();
}

class _ShowImageWidgetState extends State<ShowImageWidget> {
  int currentIndex = 0;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
    if (widget.controller != null) {
      pageController = widget.controller;
    } else {
      pageController = PageController(initialPage: currentIndex);
    }
  }

  checkImg(String url) {
    if (url.startsWith("http://") || url.startsWith("https://")) {
      return CachedNetworkImageProvider(url);
    } else if (url.startsWith("assets/")) {
      return AssetImage(url);
    } else {
      return FileImage(File(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Text("${currentIndex + 1}/${widget.images.length}",
            style: TextStyle(color: Colors.white, fontSize: 14.r)),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: widget.images.isEmpty
          ? const SizedBox()
          : GestureDetector(
        // onLongPressStart: widget.onLongPressPath == null
        //     ? null
        //     : (v) {
        //         showModalBottomSheet(
        //             context: context,
        //             builder: (ctx) {
        //               return Container(
        //                 height: 40,
        //                 child: MaterialButton(
        //                   child: const Text("保存图片"),
        //                   onPressed: () {
        //                     widget.onLongPressPath(
        //                         widget.images[currentIndex]);
        //                   },
        //                 ),
        //               );
        //             });
        //       },
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: checkImg(widget.images[index]),
              heroAttributes: PhotoViewHeroAttributes(tag: "tag$index"),
            );
          },
          itemCount: widget.images.length,
          pageController: pageController,
          enableRotation: false,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded /
                    event.expectedTotalBytes,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
