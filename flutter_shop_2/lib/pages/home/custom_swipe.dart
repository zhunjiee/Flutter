/**
 * @ClassName custom_swipe
 * @Description 轮播图
 * @Author Houge
 * @Date 2020/7/16 9:22 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/home_model.dart';

class CustomSwipe extends StatelessWidget {
  // 构造方法
  CustomSwipe(this.swipeDataList);

  // 参数
  final List swipeDataList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setWidth(333),
      child: Swiper(
        itemCount: swipeDataList.length,
        itemBuilder: (BuildContext context, int index) {
          return _swipeItem(context, index);
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }

  Widget _swipeItem(BuildContext context, int index) {
    Slides slide = swipeDataList[index];

    return GestureDetector(
      onTap: () {
        print(index);
      },
      child: Image.network(
        "${slide.image}",
        fit: BoxFit.fill,
        frameBuilder: (
          BuildContext context,
          Widget child,
          int frame,
          bool wasSynchronouslyLoaded,
        ) {
          if (frame == null) {
            // 占位图片
            return Image.asset(
              "assets/images/placeholder_image.png",
              width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setWidth(333),
              fit: BoxFit.cover,
            );
          }
          return child;
        },
      ),
    );
  }
}
