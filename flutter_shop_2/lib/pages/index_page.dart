import 'package:flutter/cupertino.dart';
/**
 * @ClassName index_page
 * @Description 索引页
 * @Author Houge
 * @Date 2020/6/8 8:49 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'home/home_page.dart';
import 'category/category_page.dart';
import 'cart/cart_page.dart';
import 'member/member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  // 选中索引
  int _selectedIndex = 0;
  // 底部导航栏数组
  final List<BottomNavigationBarItem> bottomItemList = [
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
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: bodyList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomItemList,
        currentIndex: _selectedIndex,
        onTap: _bottomItemTapped,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.pink,
        unselectedItemColor: Colors.grey,
      ),
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
    );
  }

  /*
  * 点击底部导航栏事件
  * */
  void _bottomItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
