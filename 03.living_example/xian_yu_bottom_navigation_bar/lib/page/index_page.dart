/**
 * @ClassName index_page
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-18 15:39
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'add_page.dart';
import 'home_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("闲鱼"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.blur_circular),
      title: Text("鱼塘"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add),
      title: Text("卖闲置"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message),
      title: Text("消息"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text("我的"),
    ),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomItems,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.yellow,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (int index) {
          if (index != 2) {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),

      // 中间 +号 处理
      floatingActionButton: FloatingActionButton(
        onPressed: _pressAddBtn,
        child: Icon(
          Icons.add,
          size: 36,
        ),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _pressAddBtn() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return AddPage();
        },
      ),
    );
  }
}
