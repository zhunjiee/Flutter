/**
 * @ClassName search_page
 * @Description TODO
 * @Author Houge
 * @Date 2020/3/19 4:00 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../../widgets/widget_search_bar.dart';
import '../../common/common_color.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        // padding为导航栏高度, 获取不到context用: MediaQueryData.fromWindow(window).padding.top
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 5),
        child: Column(
          children: <Widget>[
            // 搜索栏
            CustomSearchBar(type: SearchBarType.search_page),
            // 指定内容
            _buildAppointedWidget(),
          ],
        ),
      ),
    );
  }

  ///指定内容
  Widget _buildAppointedWidget() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Center(
            child: Text(
              "搜索指定内容",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  Widget _appointedContentItem() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: null)
        ],
      ),
    );
  }
}
