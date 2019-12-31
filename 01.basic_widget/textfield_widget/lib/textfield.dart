import 'package:flutter/material.dart';

class TextFieldTest extends StatefulWidget {
  @override
  _TextFieldTestState createState() => _TextFieldTestState();
}

class _TextFieldTestState extends State<TextFieldTest> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _selectionController = TextEditingController();

  void loginBtnDidClick() {
    print(_usernameController.text + "---" + _passwordController.text);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _usernameController.addListener(() {
      print("controller方式 监听文本变化" + _usernameController.text);
    });

    _selectionController.text = "Hello World!";
    _selectionController.selection = TextSelection(baseOffset: 2, extentOffset: _selectionController.text.length);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或密码",
              prefixIcon: Icon(Icons.person)
            ),
            controller: _usernameController,
            onChanged: (v) {
              print("onChanged方式 监听文本变化" + v);
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "密码",
              hintText: "请输入密码",
              prefixIcon: Icon(Icons.lock)
            ),
            obscureText: true,
            controller: _passwordController,
          ),
          RaisedButton(
            child: Text("登录"),
            onPressed: loginBtnDidClick,
          ),

          TextField(
            decoration: InputDecoration(
              labelText: "通过controller设置更多属性",
              hintText: "placeholder text",
              prefixIcon: Icon(Icons.favorite),
            ),
            controller: _selectionController,
          ),

          TextField(
            decoration: InputDecoration(
              labelText: "自定义样式",
              prefixIcon: Icon(Icons.person),
              // 未获得焦点下划线设为绿色
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              //获得焦点下划线设为红 色
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          )
        ],
      ),
    );
  }
}
