/**
 * @ClassName home_page
 * @Description 首页
 * @Author HouGe
 * @Date 2020-02-01 19:12
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../../config/http_request.dart';
import 'dart:convert';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = "正在获取数据";
  int page = 1; // 火爆专区页码
  List<Map> hotGoodsList = List(); // 火爆专区数据

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("百姓生活+"),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = json.decode(snapshot.data.toString())["data"];
            //cast(): 类型提升，将当前List<String> 提升为泛型的父祖类 List<Map>
            List<Map> swipeDataList = (data["slides"] as List).cast(); // 轮播图数组
            List<Map> classificationList =
                (data["category"] as List).cast(); // 分类导航数组
            String adPicture =
                data["advertesPicture"]["PICTURE_ADDRESS"]; // 广告栏
            String leaderImage = data["shopInfo"]["leaderImage"]; // 店长图片
            String leaderPhone = data["shopInfo"]["leaderPhone"]; // 店长电话
            List<Map> recommendList =
                (data["recommend"] as List).cast(); // 商品推荐
            String floor1Title =
                data['floor1Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
            String floor2Title =
                data['floor2Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
            String floor3Title =
                data['floor3Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
            List<Map> floor1 = (data['floor1'] as List).cast(); //楼层1商品和图片
            List<Map> floor2 = (data['floor2'] as List).cast(); //楼层1商品和图片
            List<Map> floor3 = (data['floor3'] as List).cast(); //楼层1商品和图片

            // 分类导航不能超过10个
            if (classificationList.length > 10) {
              classificationList.removeRange(10, classificationList.length);
            }

            return EasyRefresh(
              child: ListView(
                children: <Widget>[
                  // 轮播图
                  CustomSwipe(swipeDataList: swipeDataList),
                  // 分类导航
                  ClassificationNavigator(classList: classificationList),
                  // 广告位
                  AdBanner(adPicture: adPicture),
                  // 店长电话
                  LeaderPhone(
                    leaderImage: leaderImage,
                    leaderPhone: leaderPhone,
                  ),
                  // 商品推荐
                  RecommendGoods(recommendList: recommendList),
                  // 商品楼层
                  FloorTitle(floorPicture: floor1Title),
                  FloorContent(floorGoodsList: floor1),
                  FloorTitle(floorPicture: floor2Title),
                  FloorContent(floorGoodsList: floor2),
                  FloorTitle(floorPicture: floor3Title),
                  FloorContent(floorGoodsList: floor3),
                  // 火爆专区
                  HotGoods(
                    hotGoodsList: hotGoodsList,
                  ),
                ],
              ),
              onLoad: () async {
                getHomePageBelowContent(page: page).then((value) {
                  var data = json.decode(value.toString());
                  List<Map> newGoodsList = (data["data"] as List).cast();
                  setState(() {
                    hotGoodsList.addAll(newGoodsList);
                    page++;
                  });
                });
              },
              footer: ClassicalFooter(
                // 如何显示中文还没找到好的办法
                loadText: "上拉加载更多",
                loadReadyText: "松手加载",
                loadingText: "正在加载中...",
                loadedText: "加载完成",
                loadFailedText: "加载失败",
                noMoreText: "没有更多了",
                showInfo: false, // 不显示时间
                enableInfiniteLoad: false,  // 取消无限加载,隐藏footer
                enableHapticFeedback: false,  // 取消震动反馈
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        future: getHomePageContent(lon: "115.02932", lat: "35.76189"),
      ),
    );
  }
}

/*
* 顶部轮播图
* */
class CustomSwipe extends StatelessWidget {
  CustomSwipe({Key key, this.swipeDataList}) : super(key: key);

  final List swipeDataList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750.0),
      height: ScreenUtil().setHeight(333.0),
      child: Swiper(
        itemCount: swipeDataList.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "${swipeDataList[index]["image"]}",
            fit: BoxFit.fill,
          );
        },
        pagination: SwiperPagination(), // 页码指示器
        autoplay: true, // 自动滚动
      ),
    );
  }
}

/*
* 分类导航栏目
* */
class ClassificationNavigator extends StatelessWidget {
  ClassificationNavigator({Key key, this.classList}) : super(key: key);

  final List classList;

  // 单个分类item
  Widget _classificationItem(BuildContext context, Map item) {
    return InkWell(
      onTap: () {
        print("点击了栏目分类");
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item["image"],
            width: ScreenUtil().setWidth(95.0),
          ),
          Text(item["mallCategoryName"]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    num height = classList.length > 5 ? 320.0 : 160.0;
    return Container(
      height: ScreenUtil().setHeight(height),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        children: classList.map((item) {
          return _classificationItem(context, item);
        }).toList(),
        padding: EdgeInsets.all(5.0),
        physics: NeverScrollableScrollPhysics(), // 禁止滚动
      ),
    );
  }
}

/*
* 广告位
* */
class AdBanner extends StatelessWidget {
  AdBanner({Key key, this.adPicture}) : super(key: key);

  final String adPicture;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(adPicture),
    );
  }
}

/*
* 店长电话
* */
class LeaderPhone extends StatelessWidget {
  LeaderPhone({Key key, this.leaderImage, this.leaderPhone}) : super(key: key);

  final String leaderImage; // 店长图片
  final String leaderPhone; // 店长电话

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launchUrl,
        child: Image.network(leaderImage),
      ),
    );
  }

  void _launchUrl() async {
    print(leaderPhone);
    String url = "tel:" + leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Coulg not launch $url";
    }
  }
}

/*
* 商品推荐
* */
class RecommendGoods extends StatelessWidget {
  RecommendGoods({Key key, this.recommendList}) : super(key: key);

  final List recommendList;

  // 商品推荐标题
  Widget _recommendTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0.0, 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 0.5,
          ),
        ),
      ),
      child: Text(
        "商品推荐",
        style: TextStyle(
          color: Colors.pink,
        ),
      ),
    );
  }

  // 商品推荐单个item
  Widget _recommendItem(int index) {
    return InkWell(
      onTap: () {
        print("点击了商品推荐");
      },
      child: Container(
        width: ScreenUtil().setWidth(250.0),
        height: ScreenUtil().setHeight(330.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(
                color: Colors.black12,
                width: 0.5,
              ),
            )),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]["image"]),
            Text("¥${recommendList[index]["mallPrice"]}"),
            Text(
              "¥${recommendList[index]["price"]}",
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 整个商品推荐
  Widget _recommendList() {
    return Container(
      height: ScreenUtil().setHeight(330.0),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _recommendItem(index);
        },
        itemCount: recommendList.length,
        scrollDirection: Axis.horizontal, // 滚动方向
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(400.0),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _recommendTitle(),
          _recommendList(),
        ],
      ),
    );
  }
}

/*
* 楼层标题
*  */
class FloorTitle extends StatelessWidget {
  FloorTitle({Key key, this.floorPicture}) : super(key: key);

  final String floorPicture;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(floorPicture),
    );
  }
}

/*
* 楼层商品列表
* */
class FloorContent extends StatelessWidget {
  FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  final List floorGoodsList;

  // 单个商品
  Widget _goodsItem(Map goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          print("点击了楼层商品");
        },
        child: Image.network(goods["image"]),
      ),
    );
  }

  // 前三个固定商品
  Widget _firstRowGoods() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[1]),
            _goodsItem(floorGoodsList[2]),
          ],
        ),
      ],
    );
  }

  // 其他的商品
  Widget _otherRowGoods() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[3]),
        _goodsItem(floorGoodsList[4]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _firstRowGoods(),
          _otherRowGoods(),
        ],
      ),
    );
  }
}

/*
* 火爆专区
* */
class HotGoods extends StatelessWidget {
  HotGoods({Key key, this.hotGoodsList}) : super(key: key);

  final List hotGoodsList;

  // 标题
  Widget _hotTitle() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(5.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black12),
        ),
      ),
      child: Text("火爆专区"),
    );
  }

  // 单个火爆商品
  Widget _hotItem(Map hotData) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: ScreenUtil().setWidth(372),
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.only(bottom: 3.0),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Image.network(
              hotData["image"],
              width: ScreenUtil().setWidth(375),
            ),
            Text(
              hotData["name"],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.pink,
                fontSize: ScreenUtil().setSp(26),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("¥${hotData["mallPrice"]}"),
                Text(
                  "¥${hotData["price"]}",
                  style: TextStyle(
                    color: Colors.black26,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _wrapHotGoodsList() {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget = hotGoodsList.map((value) {
        return _hotItem(value);
      }).toList();
      return Wrap(
        spacing: 2.0,
        children: listWidget,
      );
    } else {
      return Text(" ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _hotTitle(),
          _wrapHotGoodsList(),
        ],
      ),
    );
  }
}
