/**
 * @ClassName widget_corner_radius_image
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-27 20:02
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class CornerRadiusImage extends StatelessWidget {
  CornerRadiusImage(
    this.src, {
    this.width,
    this.height,
    this.radius = 4,
    this.fit = BoxFit.cover,
  });

  final String src;
  final double width;
  final double height;
  final double radius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: src.startsWith("http")
          ? FadeInImage.assetNetwork(
              // 带占位图片的网络加载图片方法
              placeholder: "images/default_nor_avatar.png",
              image: src,
              width: width,
              height: height,
              fit: fit,
            )
          : Image.asset(
              src,
              width: width ,
              height: height,
              fit: fit,
            ),
    );
  }
}
