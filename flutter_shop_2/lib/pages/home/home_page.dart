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
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/net_utils.dart';
import '../../model/home_model.dart';
import 'custom_swipe.dart';
import 'category_navigator.dart';
import 'home_hot_goods.dart';
import '../../widgets/widget_net_error.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeModel _model = HomeModel();
  int _page = 1; // 火爆专区页码
  List<HotGoodsModel> _hotGoodsList = List(); // 火爆专区数据
  EasyRefreshController _refreshController;

  @override
  void initState() {
    super.initState();

    _refreshController = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("百姓生活+"),
      ),
      body: SafeArea(
        child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              _model = snapshot.data;
              // 分类导航不能超过10个
              if (_model.category.length > 10) {
                _model.category.removeRange(10, _model.category.length);
              }
              return NetErrorWidget(
                callback: () {
                  NetUtils().getHomePageContent("115.02932", "35.76189");
                },
              );
//              return EasyRefresh(
//                controller: _refreshController,
//                child: ListView(
//                  children: <Widget>[
//                    // 轮播图
//                    CustomSwipe(_model.slides),
//                    // 分类导航
//                    CategoryNavigator(
//                      _model.category,
//                      onTapAction: (Category category) {
//                        print(category.mallCategoryName);
//                      },
//                    ),
//                    ADBanner(_model.advertesPicture.pictureAddress),
//                    LeaderPhone(_model.shopInfo.leaderImage,
//                        _model.shopInfo.leaderPhone),
//                    HomeHotGoods(_hotGoodsList),
//                  ],
//                ),
//                onRefresh: () async {
//                  _getNewHomePageContentData();
//                },
//                onLoad: () async {
//                  _getHomePageHotGoodsContentData();
//                },
//                emptyWidget: _model == null ? NetErrorWidget() : null,
//              );
            } else if (snapshot.hasError) {
              return NetErrorWidget(
                callback: () {
                  NetUtils().getHomePageContent("115.02932", "35.76189");
                },
              );
            } else {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
          future: NetUtils().getHomePageContent("115.02932", "35.76189"),
        ),
      ),
    );
  }

  /*
  * 下拉刷新
  * */
  void _getNewHomePageContentData() async {
    _hotGoodsList.clear();
    _page = 1;
    await NetUtils().getHomePageBelowContent(_page).then((value) {
      if (value != null) {
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
      if (value != null) {
        setState(() {
          _hotGoodsList.addAll(value);
          _page++;
        });
      } else {
        // 没有更多
        _refreshController.finishLoad(noMore: true);
        Fluttertoast.showToast(msg: "全部加载完成");
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
