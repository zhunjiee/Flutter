/**
 * @ClassName index_page
 * @Description 导航页
 * @Author Houge
 * @Date 2020/3/31 3:40 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: bottomItemList,
        currentIndex: _selectedIndex,
        onTap: (index){},
        type: BottomNavigationBarType.fixed,  // 超过3个需要设置此属性，取消点击放大效果
        fixedColor: Colors.redAccent,
        unselectedItemColor: Colors.black87,
      ),
    );
  }

  /// 创建底部导航栏单个Item
  BottomNavigationBarItem _buildBottomNavigationItemWithBadge(String title) {
    return BottomNavigationBarItem(
        icon: _bottomNavigationBarItemIcon(),
      activeIcon: _bottomNavigationBarItemIcon(),
      title: Text(title, style: TextStyle(fontSize: 14),)
    );
}

Widget _bottomNavigationBarItemIcon(int codePoint, bool showBadge) {
    return Container(
      width: 60,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Icon
        ],
      ),
    );
}
}
