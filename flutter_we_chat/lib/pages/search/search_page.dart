/**
 * @ClassName search_page
 * @Description TODO
 * @Author Houge
 * @Date 2020/3/19 4:00 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import '../../widgets/widget_search_bar.dart';
import '../../common/common_color.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List _appointedList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appointedList = ["朋友圈", "文章", "公众号", "小程序", "音乐", "表情"];
  }

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
        _buildAppointedContent(),
      ],
    );
  }

  Widget _buildAppointedContent() {
    /// 分割数组,3个一组
    int i = 0;
    List<List<String>> list = [];
    List<String> subList = [];

    _appointedList.forEach((e) {
      if (i != 0 && i % 3 == 0) {
        list.add(subList);
        // 等于0说明换行了,重新初始化subList,重新存放数据
        subList = new List()..add(e);
      } else {
        subList.add(e);
      }
      i++;
    });
    // 最后一个元素索引为5, 没有换行就结束了,所以要在外面add上subList
    list.add(subList);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
      child: _appointedColumn(list),
    );
  }

  Widget _appointedColumn(List<List<String>> list) {
    return Column(
      children: list.map((subList) {
        return _appointedRow(subList);
      }).toList(),
    );
  }

  Widget _appointedRow(List<String> subList) {
    int _idx = 0;
    return Row(
      children: subList.map((e) {
        _idx++;
        return _appointedContentItem(e, _idx == subList.length ? false : true);
      }).toList(),
    );
  }

  Widget _appointedContentItem(String name, bool showSeparator) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.only(top: ScreenUtil().setWidth(40)),
        child: GestureDetector(
          onTap: (){
            print(name);
          },
          child: Stack(
            children: <Widget>[
              Center(
                child: Text(
                  name,
                  style: TextStyle(fontSize: 15, color: Colors.blue[900]),
                ),
              ),
              showSeparator
                  ? Positioned(
                right: 0,
                child: Container(
                  width: 0.5,
                  height: 15,
                  color: Colors.grey,
                ),
              )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
