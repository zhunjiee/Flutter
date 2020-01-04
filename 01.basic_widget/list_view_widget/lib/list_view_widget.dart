import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemExtent: 60.0, // 强制高度为60
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
    );
  }
}

class ListView2 extends StatelessWidget {
  Widget divider1 = Divider(color: Colors.blue);
  Widget divider2 = Divider(color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
      itemCount: 100,
    );
  }
}

class ListView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(title: Text("商品列表")),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("$index"));
            },
            itemCount: 50,
          ),
        )
      ],
    );
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; // 表尾标记
  var _words = <String>[loadingTag]; // 先将表尾标记加进去,在添加生成的单词在表位标记前面

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        // 滚动到表尾
        if (_words[index] == loadingTag) {
          // 是否加载了100条数据
          if (_words.length - 1 < 100) {
            // 没有100条继续加载数据
            _retrieveData();
            // 加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          } else {
            // 到了100条不再加载数据
            return Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Text(
                "没有更多了",
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
        }
        // 显示单词列表项
        return ListTile(title: Text(_words[index]));
      },
      separatorBuilder: (BuildContext context, int index) =>
          Divider(color: Colors.grey),
      itemCount: _words.length,
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      // 每次生成20个单词,并且是在loadingTag的前面
      _words.insertAll(
        _words.length - 1,
        generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
      );
      setState(() {
        // 重新构建列表
      });
    });
  }
}
