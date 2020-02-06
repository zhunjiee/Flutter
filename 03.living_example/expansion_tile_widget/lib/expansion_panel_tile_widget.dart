import 'package:flutter/material.dart';

class ExpansionPanelTileDemo extends StatefulWidget {
  @override
  _ExpansionPanelTileDemoState createState() => _ExpansionPanelTileDemoState();
}

class _ExpansionPanelTileDemoState extends State<ExpansionPanelTileDemo> {
  var currentPanelIndex = -1; // 当前
  List<int> mList; // 列表数据数组
  List<ExpandStateBean> expandStateList; // 展开闭合状态数组

  // 构造方法, 调用这个类的时候自动执行
  _ExpansionPanelTileDemoState() {
    mList = List();
    expandStateList = List();

    // 为两个数组赋初始值
    for (int i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  // 修改展开与闭合 状态的 内部方法
  void _setCurrentIndex(int index, bool isExpand) {
    setState(() {
      expandStateList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expansion Panel Tile Demo"),
      ),
      // 加入可滚动组件
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          // 交互回调属性, 里面是个匿名函数
          expansionCallback: (index, expand) {
            _setCurrentIndex(index, expand);
          },
          children: mList.map(
            (index) {
              return ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Text("This is No.$index"),
                    );
                  },
                  body: ListTile(
                    title: Text("expansion No.$index"),
                  ),
                  isExpanded: expandStateList[index].isOpen);
            },
          ).toList(),
        ),
      ),
    );
  }
}

// 自定义 扩展组件状态 类
class ExpandStateBean {
  var isOpen;
  var index;

  ExpandStateBean(this.index, this.isOpen);
}
