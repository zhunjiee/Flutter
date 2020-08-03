import 'dart:math';

/**
 * @ClassName home_page
 * @Description TODO
 * @Author Houge
 * @Date 2020/6/12 8:56 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttershop2/pages/home/home_floor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/net_utils.dart';
import '../../model/home_model.dart';
import 'custom_swipe.dart';
import 'category_navigator.dart';
import 'home_hot_goods.dart';
import '../../widgets/custom_future_builder.dart';
import '../../widgets/widget_net_error.dart';
import 'home_recommend_goods.dart';
import 'home_floor.dart';
import '../../widgets/custom_refresh_header_footer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeModel _model = HomeModel();
  EasyRefreshController _refreshController;
  int _page = 1; // 火爆专区页码
  List<HotGoodsModel> _hotGoodsList = List(); // 火爆专区数据

  @override
  void initState() {
    super.initState();

    _refreshController = EasyRefreshController();
    _getHomePageHotGoodsContentData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("百姓生活+"),
      ),
      body: SafeArea(
        child: CustomFutureBuilder(
          builder: (context, value) {
            _model = value;
            // 分类导航不能超过10个
            if (_model.category.length > 10) {
              _model.category.removeRange(10, _model.category.length);
            }
            return Container(
              child: EasyRefresh(
                controller: _refreshController,
                child: ListView(
                  children: <Widget>[
                    // 轮播图
                    CustomSwipe(_model.slides),
                    // 分类导航
                    CategoryNavigator(
                      _model.category,
                      onTapAction: (Category category) {
                        print(category.mallCategoryName);
                      },
                    ),
                    ADBanner(_model.advertesPicture.pictureAddress),
                    LeaderPhone(
                        _model.shopInfo.leaderImage, _model.shopInfo.leaderPhone),
                    RecommendGoods(_model.recommend),
                    HomeFloor(_model.floor1Pic.pictureAddress, _model.floor1),
                    HomeFloor(_model.floor2Pic.pictureAddress, _model.floor2),
                    HomeFloor(_model.floor3Pic.pictureAddress, _model.floor3),
                    HomeHotGoods(_hotGoodsList),
                  ],
                ),
                onRefresh: () async {
                  _getNewHomePageContentData();
                },
                onLoad: () async {
                  _getHomePageHotGoodsContentData();
                },
                header: CustomRefreshHeaderFooter.getHeader(),
                footer: CustomRefreshHeaderFooter.getFooter(),
                enableControlFinishLoad: true,
                emptyWidget: _model == null ? NetErrorWidget() : null,
              ),
            );
          },
          futureFunc: getHomePageContent,
        ),
      ),
    );
  }

  /*
  * 获取首页数据方法
  * */
  Future<HomeModel> getHomePageContent() async {
    return await NetUtils().getHomePageContent("115.02932", "35.76189");
  }

  /*
  * 火爆专区下拉刷新
  * */
  void _getNewHomePageContentData() async {
    _hotGoodsList.clear();
    _page = 1;
    await NetUtils().getHomePageBelowContent(_page).then((value) {
      if (value.length != 0) {
        setState(() {
          _hotGoodsList.addAll(value);
          _page++;
        });
      }
      _refreshController.resetLoadState();
    });
  }

  /*
  * 获取更多火爆专区数据
  * */
  void _getHomePageHotGoodsContentData() async {
    await NetUtils().getHomePageBelowContent(_page).then((value) {
      if (value.length != 0) {
        setState(() {
          _hotGoodsList.addAll(value);
          _page++;
          _refreshController.finishLoad(success: true);
        });
      } else {
        // 没有更多
        _refreshController.finishLoad(noMore: true);
      }
    });
  }
}

/*
* 广告位
* */
class ADBanner extends StatelessWidget {
  ADBanner(this.adImageSrc);

  final String adImageSrc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        adImageSrc,
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setWidth(50),
        fit: BoxFit.cover,
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
              height: ScreenUtil().setWidth(50),
              fit: BoxFit.cover,
            );
          }
          return child;
        },
      ),
    );
  }
}

/*
* 店长电话
* */
class LeaderPhone extends StatelessWidget {
  LeaderPhone(this.leaderImageSrc, this.leaderPhoneNum);

  final String leaderImageSrc;
  final String leaderPhoneNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: _launchUrl,
        child: Image.network(
          leaderImageSrc,
          fit: BoxFit.cover,
          frameBuilder: (
            BuildContext context,
            Widget child,
            int frame,
            bool wasSynchronouslyLoaded,
          ) {
            if (frame == null) {
              return Image.asset(
                "assets/images/placeholder_image.png",
                fit: BoxFit.cover,
              );
            }
            return child;
          },
        ),
      ),
    );
  }

  void _launchUrl() async {
    print("店长电话 : $leaderPhoneNum");
    String url = "tel:" + leaderPhoneNum;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
