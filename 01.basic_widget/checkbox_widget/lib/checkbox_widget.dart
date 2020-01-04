import 'package:flutter/material.dart';

class SwitchAndCheckboxTest extends StatefulWidget {
  @override
  _SwitchAndCheckboxTestState createState() => _SwitchAndCheckboxTestState();
}

class _SwitchAndCheckboxTestState extends State<SwitchAndCheckboxTest> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Switch(
            value: _switchSelected,
            onChanged: (value) {
              setState(() {
                _switchSelected = value;
                String selected = _switchSelected ? "选中" : "未选中";
                print("switch选中状态:" + selected);
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                value: _checkboxSelected,
                onChanged: (value) {
                  setState(() {
                    _checkboxSelected = value;
                    String selected = _checkboxSelected ? "选中" : "未选中";
                    print("checkbox选中状态:" + selected);
                  });
                },
                activeColor: Colors.red,
              ),
              Text("哈哈"),
            ],
          )
        ],
      ),
    );
  }
}
