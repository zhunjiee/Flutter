/**
 * @ClassName index_page
 * @Description 导航页
 * @Author Houge
 * @Date 2020/3/31 3:40 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home/home_page.dart';
import 'app/app_page.dart';
import 'record/record_page.dart';
import 'zone/zone_page.dart';
import 'mine/mine_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _selectedIndex = 0;
  List<Widget> bodyList;
  List<BottomNavigationBarItem> bottomItemList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bodyList = [
      HomePage(),
      AppPage(),
      RecordPage(),
      ZonePage(),
      MinePage(),
    ];

    bottomItemList = [
      BottomNavigationBarItem(
        icon: Text(
          "首页",
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.redAccent),
        ),
        title: Container(
          width: 11,
          height: 2,
          decoration: BoxDecoration(
            color: Color(0xFFFF5600),
            borderRadius: BorderRadius.all(Radius.circular(1.0)),
          ),
        ),
        activeIcon:
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search),
        title: Text("应用"),
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart),
        title: Text("+"),
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: Text("社区"),
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person),
        title: Text("我的"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: bottomItemList,
        currentIndex: _selectedIndex,
        onTap: (index) {
          print(index);

          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, // 超过3个需要设置此属性，取消点击放大效果
        fixedColor: Colors.redAccent,
        unselectedItemColor: Color(0xFF9B9B9B),
//        selectedItemColor: Colors.white,
      ),
    );
  }
}
