/**
 * @ClassName expansion_panel_list
 * @Description TODO
 * @Author houge
 * @Date 2020/3/12 10:19 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class ExpansionPanelListDemo extends StatefulWidget {
  @override
  _ExpansionPanelListDemoState createState() => _ExpansionPanelListDemoState();
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  List<ExpandStateBean> expandStateList;

  @override
  void initState() {
    super.initState();
    expandStateList = List();
    for (int i = 0; i < 10; i++) {
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        children: expandStateList.map((bean) {
          return ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text("我是标题:${bean.index}"),
              );
            },
            body: ListTile(
              title: Text("内容--${bean.index}"),
            ),
            isExpanded: bean.isOpen,
            canTapOnHeader: true,
          );
        }).toList(),
        expansionCallback: (index, isExpanded){
          _setCurrentIndex(index, isExpanded);
        },
      ),
    );
  }

  _setCurrentIndex(int index, bool isExpand) {
    setState(() {
      expandStateList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isExpand;
        }
      });
    });
  }
}

class ExpandStateBean {
  int index;
  bool isOpen;

  ExpandStateBean(this.index, this.isOpen);
}
