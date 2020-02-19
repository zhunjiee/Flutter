/**
 * @ClassName home_page
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-18 22:21
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  final List<Widget> tabList = [
    Tab(
      text: "推荐",
    ),
    Tab(
      text: "热门",
    ),
    Tab(
      text: "哈哈",
    ),
    Tab(
      text: "推荐",
    ),
    Tab(
      text: "推荐",
    ),
    Tab(
      text: "推荐",
    ),
    Tab(
      text: "推荐",
    ),
    Tab(
      text: "推荐",
    ),
    Tab(
      text: "推荐",
    ),
    Tab(
      text: "推荐",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabList.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        bottom: TabBar(
          tabs: tabList,
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.pink,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 4.0,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ChildPage("推荐"),
          ChildPage("热门"),
          ChildPage("哈哈"),
          ChildPage("推荐"),
          ChildPage("推荐"),
          ChildPage("推荐"),
          ChildPage("推荐"),
          ChildPage("推荐"),
          ChildPage("推荐"),
          ChildPage("推荐"),
        ],
      ),
    );
  }
}

class ChildPage extends StatelessWidget {
  ChildPage(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}
