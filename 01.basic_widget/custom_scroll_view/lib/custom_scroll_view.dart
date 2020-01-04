import 'package:flutter/material.dart';

class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用 Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.redAccent,
            pinned: true, // 标题栏是否固定
            expandedHeight: 250, // 最大高度
//            title: Text("SliverAppBar"), // 导航栏标题
//            centerTitle: true, // 标题居中
            // 左侧返回按钮
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                print("返回前一页");
              },
            ),
            // 右侧按钮
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  print("分享");
                },
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {
                  print("更多");
                },
              ),
            ],
            // 可以理解为SliverAppBar的背景内容区
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("滑动标题上移"),
              background: Image.asset(
                "images/image.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // 创建子widget
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text("grid items $index"),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50, // 设置行高
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text("List items $index"),
              ),
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
