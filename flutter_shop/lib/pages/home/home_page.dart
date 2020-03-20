/**
 * @ClassName home_page
 * @Description 首页
 * @Author HouGe
 * @Date 2020-02-01 19:12
 * @Version 1
 */

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../config/common_api.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../../routers/application.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = "正在获取数据";
  int page = 1; // 火爆专区页码
  List<Map> hotGoodsList = new List(); // 火爆专区数据
  EasyRefreshController _refreshController = EasyRefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("百姓生活+"),
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            //cast(): 类型提升，将当前List<String> 提升为泛型的父祖类 List<Map>
            List<Map> swipeDataList = (data["slides"] as List).cast(); // 轮播图数组
            List<Map> categoryList =
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
            if (categoryList.length > 10) {
              categoryList.removeRange(10, categoryList.length);
            }

            return EasyRefresh(
              child: ListView(
                children: <Widget>[
                  // 轮播图
                  CustomSwipe(swipeDataList),
                  // 分类导航
                  CategoryNavigator(categoryList),
                  // 广告位
                  AdBanner(adPicture),
                  // 店长电话
                  LeaderPhone(
                    leaderImage: leaderImage,
                    leaderPhone: leaderPhone,
                  ),
                  // 商品推荐
                  RecommendGoods(recommendList),
                  // 商品楼层
                  FloorTitle(floor1Title),
                  FloorContent(floor1),
                  FloorTitle(floor2Title),
                  FloorContent(floor2),
                  FloorTitle(floor3Title),
                  FloorContent(floor3),
                  // 火爆专区
                  HotGoods(hotGoodsList),
                ],
              ),
              onLoad: () async {
                _getHomePageHotGoodsContentData();
              },
              footer: ClassicalFooter(
                // 如何显示中文还没找到好的办法
                loadText: "上拉加载更多",
                loadReadyText: "松手加载",
                loadingText: "正在加载中...",
                loadedText: "加载完成",
                loadFailedText: "加载失败",
                noMoreText: "已经到底了",
                showInfo: false, // 不显示时间
                enableInfiniteLoad: false, // 取消无限加载,隐藏footer
                enableHapticFeedback: false, // 取消震动反馈
              ),
              controller: _refreshController,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: getHomePageContent("115.02932", "35.76189"),
      ),
    );
  }

  // 获取火爆专区数据
  void _getHomePageHotGoodsContentData() async {
    await getHomePageBelowContent(page).then((value) {
      if (value != null) {
        List<Map> newGoodsList = (value as List).cast();
        setState(() {
          hotGoodsList.addAll(newGoodsList);
          page++;
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
* 顶部轮播图
* */
class CustomSwipe extends StatelessWidget {
  // 构造函数
  CustomSwipe(this.swipeDataList);

  final List swipeDataList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(333),
      child: Swiper(
        itemCount: swipeDataList.length,
        itemBuilder: (BuildContext context, int index) {
          return _swipeItem(context, index);
        },
        pagination: SwiperPagination(), // 页码指示器
        autoplay: true, // 自动滚动
      ),
    );
  }

  Widget _swipeItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: (){
        Application.router.navigateTo(context, "/detail?id=${swipeDataList[index]["goodsId"]}");
      },
      child: Image.network(
        "${swipeDataList[index]["image"]}",
        fit: BoxFit.fill,
      ),
    );
  }

}

/*
* 分类导航栏目
* */
class CategoryNavigator extends StatelessWidget {
  CategoryNavigator(this.classList);

  final List classList;

  @override
  Widget build(BuildContext context) {
    num height = classList.length > 5 ? 320 : 160;
    return Container(
      height: ScreenUtil().setHeight(height),
      padding: EdgeInsets.all(3),
      child: GridView.count(
        crossAxisCount: 5,
        children: classList.map((item) {
          return _categoryItem(item);
        }).toList(),
        padding: EdgeInsets.all(5),
        physics: NeverScrollableScrollPhysics(), // 禁止滚动
      ),
    );
  }

  // 单个分类item
  Widget _categoryItem(Map item) {
    return InkWell(
      onTap: () {
        print("点击了栏目分类");
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item["image"],
            width: ScreenUtil().setWidth(95),
          ),
          Text(item["mallCategoryName"]),
        ],
      ),
    );
  }
}

/*
* 广告位
* */
class AdBanner extends StatelessWidget {
  AdBanner(this.adPicture);

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
  LeaderPhone({this.leaderImage, this.leaderPhone});

  final String leaderImage; // 店长图片
  final String leaderPhone; // 店长电话

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
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
  RecommendGoods(this.recommendList);

  final List recommendList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(400),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _recommendTitle(),
          _recommendList(),
        ],
      ),
    );
  }

  // 商品推荐标题
  Widget _recommendTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 2, 0, 5),
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

  // 整个商品推荐
  Widget _recommendList() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _recommendItem(context, index);
        },
        itemCount: recommendList.length,
        scrollDirection: Axis.horizontal, // 滚动方向
      ),
    );
  }

  // 商品推荐单个item
  Widget _recommendItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        print("点击了商品推荐");
        Application.router.navigateTo(context, "/detail?id=${recommendList[index]["goodsId"]}");
      },
      child: Container(
        width: ScreenUtil().setWidth(250),
        height: ScreenUtil().setHeight(330),
        padding: EdgeInsets.all(8),
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
}

/*
* 楼层标题
*  */
class FloorTitle extends StatelessWidget {
  FloorTitle(this.floorPicture);

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
  FloorContent(this.floorGoodsList);

  final List floorGoodsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _firstRowGoods(context),
          _otherRowGoods(context),
        ],
      ),
    );
  }

  // 前三个固定商品
  Widget _firstRowGoods(BuildContext context) {
    return Row(
      children: <Widget>[
        _goodsItem(context, floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(context, floorGoodsList[1]),
            _goodsItem(context, floorGoodsList[2]),
          ],
        ),
      ],
    );
  }

  // 其他的商品
  Widget _otherRowGoods(BuildContext context) {
    return Row(
      children: <Widget>[
        _goodsItem(context, floorGoodsList[3]),
        _goodsItem(context, floorGoodsList[4]),
      ],
    );
  }

  // 单个商品
  Widget _goodsItem(BuildContext context, Map goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: GestureDetector(
        onTap: () {
          print("点击了楼层商品");
          Application.router.navigateTo(context, "/detail?id=${goods["goodsId"]}");
        },
        child: Image.network(goods["image"]),
      ),
    );
  }
}

/*
* 火爆专区
* */
class HotGoods extends StatelessWidget {
  HotGoods(this.hotGoodsList);

  final List hotGoodsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _hotTitle(),
          _wrapHotGoodsList(context),
        ],
      ),
    );
  }

  // 标题
  Widget _hotTitle() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black12),
        ),
      ),
      child: Text(
        "火爆专区",
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _wrapHotGoodsList(BuildContext context) {
    if (hotGoodsList.isNotEmpty) {
      List<Widget> listWidget = hotGoodsList.map((value) {
        return _hotItem(context, value);
      }).toList();
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text(" ");
    }
  }

  // 单个火爆商品
  Widget _hotItem(BuildContext context, Map hotData) {
    return GestureDetector(
      onTap: () {
        Application.router
            .navigateTo(context, "/detail?id=${hotData["goodsId"]}");
      },
      child: Container(
        width: ScreenUtil().setWidth(372),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(bottom: 3),
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
}
