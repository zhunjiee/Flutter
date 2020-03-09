/**
 * @ClassName index_page
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-19 21:58
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/v_placeholder_view.dart';
import '../application.dart';
import '../utils/net_utils.dart';
import '../utils/http_request.dart';
import '../utils/common_url.dart';
import '../utils/common_color.dart';
import 'bottom_play/bottom_play_widget.dart';
import 'discover/discover_page.dart';
import 'event/event_page.dart';
import 'mine/mine_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List<Widget> tabs = [
    Tab(
      text: "我的",
    ),
    Tab(
      text: "发现",
    ),
    Tab(
      text: "动态",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller =
        TabController(length: tabs.length, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 设置高度为0的AppBar,目的是为了设置状态栏颜色
      appBar: PreferredSize(
          child: AppBar(
            elevation: 0, // 隐藏分割线
          ),
          preferredSize: Size.zero),
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Padding(
              child: Column(
                children: <Widget>[
                  _tabBarNavigator(), // 顶部TabBar导航条
                  _body(),  // 主体区域
                ],
              ),
              padding: EdgeInsets.only(
                  bottom:
                      ScreenUtil().setWidth(110) + Application.bottomBarHeight),
            ),
            BottomPlayWidget(), // 底部播放条
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  /// 顶部TabBar样式导航栏
  Widget _tabBarNavigator() {
    return Container(
      color: themeColor,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(150),
            ),
            child: TabBar(
              tabs: tabs,
              controller: _controller,
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontSize: 14),
              indicatorColor: Colors.transparent, // 指示器颜色透明
            ),
          ),
          Positioned(
            right: ScreenUtil().setWidth(20),
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                print("搜索");
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 主体区域
  Widget _body() {
    return Expanded(
      child: TabBarView(
        children: [
          MinePage(),
          DiscoverPage(),
          EventPage(),
        ],
        controller: _controller,
      ),
    );
  }
}
