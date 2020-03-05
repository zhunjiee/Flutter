/**
 * @ClassName discover_banner
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-26 14:17
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import '../../model/banner_model.dart';
import '../../utils/net_utils.dart';
import '../../widgets/custom_future_builder.dart';
import '../../application.dart';

class DiscoverBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder<BannerModel>(
      builder: (context, data) {
        return _customSwipe(
          data.banners.map((e) => "${e.pic}?param=540y210").toList(),
        );
      },
      futureFunc: NetUtils().getBanner,
    );
  }

  Widget _customSwipe(List bannerList) {
    return Container(
      height: ScreenUtil().setHeight((750 - 30*2) / 540 * 210), // 图片高度
      child: Swiper(
        itemCount: bannerList.length,
        itemBuilder: (context, index) {
          return _swipeItem(bannerList, index);
        },
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(size: 8, activeSize: 10),
        ),
        autoplay: true,
      ),
    );
  }

  Widget _swipeItem(List bannerList, int index) {
    return GestureDetector(
      onTap: () {
        print(index);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)), // 设置图片家奴
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8), // 设置图片圆角
          child: Image.network(
            "${bannerList[index]}",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
