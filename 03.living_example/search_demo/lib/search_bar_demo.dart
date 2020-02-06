import 'package:flutter/material.dart';
import 'local_data.dart';

class SearchBarDemo extends StatefulWidget {
  @override
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SearchBarDemo"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("开始搜索了");
              showSearch(context: context, delegate: SearchBarDelegate());
            },
          ),
        ],
      ),
      body: Center(
        child: Text("Hahaha"),
      ),
    );
  }
}

class SearchBarDelegate extends SearchDelegate {
  // 设置占位文字
  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => "请输入搜索内容";

  // 设置搜索结果
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      width: 100,
      height: 100,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  // 设置搜索建议
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchList.where((data) => data.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: suggestionList.length,
    );
  }

  // 设置搜索栏右侧控件(如清空按钮)
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  // 设置搜索栏左侧控件(如返回按钮)
  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        print("关闭搜索");
        close(context, null);
      },
    );
  }
}
