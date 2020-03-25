/**
 * @ClassName widget_circular_image
 * @Description 剪裁圆形图片
 * @Author HouGe
 * @Date 2020-02-27 15:11
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  CircularImage(
    this.src, {
    this.width,
    this.fit = BoxFit.cover,
  });

  final String src;
  final double width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: src.startsWith("http")
          ? Image.network(
              src,
              width: width,
              height: width,
              fit: fit,
            )
          : Image.asset(
              src,
              width: width,
              height: width,
              fit: fit,
            ),
    );
  }
}
