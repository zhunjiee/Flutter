import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'chat_list/chat_list_page.dart';
import 'contacts/contacts_page.dart';
import 'discover/discover_page.dart';
import 'mine/mine_page.dart';
import '../common/common_constant.dart';
import '../common/common_color.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _selectedIndex = 0;
  DateTime _lastExitTime;
  List<BottomNavigationBarItem> bottomItems;
  List<Widget> bodyList;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    bottomItems = [
      _buildBottomNavigationItemWithBadge(0xe608, 0xe603, "微信",
          showBadge: true),
      _buildBottomNavigationItemWithBadge(0xe601, 0xe656, "通讯录",
          showBadge: false),
      _buildBottomNavigationItemWithBadge(0xe600, 0xe671, "发现",
          showBadge: true),
      _buildBottomNavigationItemWithBadge(0xe6c0, 0xe626, "我", showBadge: false),
    ];
    bodyList = [
      ChatListPage(),
      ContactsPage(),
      DiscoverPage(),
      MinePage(),
    ];

    _pageController = PageController();
  }

  /// 各种第三方库初始化配置
  _globalConfig(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
  }

  @override
  Widget build(BuildContext context) {
    _globalConfig(context);
    return Scaffold(
      // 拦截返回功能,1秒内连点2次退出APP,避免误触
      body: WillPopScope(
        // 可以横向分页滑动
        child: PageView(
          children: bodyList,
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          physics: Platform.isIOS ? ClampingScrollPhysics() : AlwaysScrollableScrollPhysics(),
          onPageChanged: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        onWillPop: () {
          // 一秒钟内连点2次退出应用
          if (_lastExitTime == null ||
              DateTime.now().difference(_lastExitTime) > Duration(seconds: 1)) {
            _lastExitTime = DateTime.now();
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomItems,
        currentIndex: _selectedIndex,
        onTap: _onBottomItemTapped,
        type: BottomNavigationBarType.fixed,
        fixedColor: themeColor,
        unselectedItemColor: Colors.black87,
      ),
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onBottomItemTapped(int index) {
    setState(() {
      _pageController.jumpToPage(index);
      _selectedIndex = index;
    });
  }

  // ------------ Widgets ------------

  /// 自定义带有红色角标的底部导航按钮
  _buildBottomNavigationItemWithBadge(
      int onCodePoint, int offCodePoint, String title,
      {bool showBadge}) {
    return BottomNavigationBarItem(
      icon: _bottomNavigationBarItemIcon(onCodePoint, showBadge),
      activeIcon: _bottomNavigationBarItemIcon(offCodePoint, showBadge),
      title: Text(
        title,
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  _bottomNavigationBarItemIcon(int codePoint, bool showBadge) {
    return Container(
      width: 60,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Icon(IconData(codePoint, fontFamily: CommonConstant.ICON_FONT)),
          showBadge
              ? Positioned(
                  top: 0,
                  right: 19,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      width: 8,
                      height: 8,
                      color: Colors.red[600],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
