/**
 * @ClassName index_page
 * @Description 底部导航
 * @Author HouGe
 * @Date 2020-02-01 14:01
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'home/home_page.dart';
import 'category/category_page.dart';
import 'cart/cart_page.dart';
import 'member/member_page.dart';
import '../provider/current_index_provider.dart';

// provider改造后,状态保存
class IndexPageWithProvider extends StatelessWidget {
  // 底部导航栏数组
  final List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text("首页"),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text("分类"),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text("购物车"),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text("会员中心"),
    ),
  ];
  // 页面数组
  final List<Widget> bodyList = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // 屏幕适配控件初始化
    ScreenUtil.init(context, width: 750.0, height: 1334.0);

    return Consumer<CurrentIndexProvider>(builder: (context, indexProvider, _){
      int currentIndex = indexProvider.currentIndex;
      return Scaffold(
        // 保持状态,点击底部导航栏不会重新刷新
        body: IndexedStack(
          index: currentIndex,
          children: bodyList,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: bottomItems,
          currentIndex: currentIndex,  // 当前索引
          onTap: (index){
            indexProvider.changeIndex(index);
          }, // 点击事件
          type: BottomNavigationBarType.fixed,  // 大于3个按钮时 fixed类型 的按钮 未选中时 为灰色 而不是 白色
          fixedColor: Colors.pink,  // 选中颜色
          unselectedItemColor: Colors.grey, // 默认颜色
        ),
        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),  // 底部导航栏背景色
      );
    });
  }
}


// provider 改造前
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with AutomaticKeepAliveClientMixin {
  // 选中导航栏索引
  int _currentIndex = 0;

  // 底部导航栏数组
  final List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text("首页"),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text("分类"),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text("购物车"),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text("会员中心"),
    ),
  ];
  // 页面数组
  final List<Widget> bodyList = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];

  @override
  // TODO: 保持页面状态
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); /// see AutomaticKeepAliveClientMixin
    // 屏幕适配控件初始化
    ScreenUtil.init(context, width: 750.0, height: 1334.0);

    return Scaffold(
      // 保持状态,点击底部导航栏不会重新刷新
      body: IndexedStack(
        index: _currentIndex,
        children: bodyList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomItems,
        currentIndex: _currentIndex,  // 当前索引
        onTap: _onBottomItemTapped, // 点击事件
        type: BottomNavigationBarType.fixed,  // 大于3个按钮时 fixed类型 的按钮 未选中时 为灰色 而不是 白色
        fixedColor: Colors.pink,  // 选中颜色
        unselectedItemColor: Colors.grey, // 默认颜色
      ),
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),  // 底部导航栏背景色
    );
  }

  // 点击底部导航栏事件
  void _onBottomItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
