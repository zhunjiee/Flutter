import 'package:flutter/material.dart';

class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    focusNode2.addListener((){
      print(focusNode2.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: "input1",
            ),
            autofocus: true,
            focusNode: focusNode1,  //关联focusNode1
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "input2",
            ),
            focusNode: focusNode2,  //关联focusNode2
          ),
          Builder(builder: (ctx) {
            return Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    //将焦点从第一个TextField移到第二个TextField
                    // 方式一:
//                  FocusScope.of(context).requestFocus(focusNode2);
                    // 方式二:
                    if(focusScopeNode == null) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                    print(focusScopeNode);
                  },
                  child: Text("移动焦点"),
                ),
                RaisedButton(onPressed: (){
                  // 当所有编辑框都失去焦点时键盘就会收起
                  focusNode1.unfocus();
                  focusNode2.unfocus();
                },
                child: Text("隐藏键盘"),)
              ],
            );
          }),
        ],
      ),
    );
  }
}
