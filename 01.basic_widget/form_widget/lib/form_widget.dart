import 'package:flutter/material.dart';

class FormTest extends StatefulWidget {
  @override
  _FormTestState createState() => _FormTestState();
}

class _FormTestState extends State<FormTest> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      child: Form(
          key: _formKey, //设置globalKey，用于后面获取FormState
          autovalidate: true, //开启自动校验
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入手机号",
                  icon: Icon(Icons.person),
                ),
                autofocus: true,
                keyboardType: TextInputType.phone,
                controller: _usernameController,
                // 校验用户名
                validator: (value) {
                  return value.trim().length > 0 ? null : "用户名不能为空";
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                controller: _passwordController,
                // 验证密码
                validator: (value) {
                  return value.trim().length >= 6 ? null : "密码不能少于6位";
                },
              ),
              // 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
//                    Expanded(
//                      child: RaisedButton(
//                        padding: EdgeInsets.all(10.0),
//                        child: Text("登录"),
//                        color: Theme.of(context).primaryColor,
//                        textColor: Colors.white,
//                        onPressed: () {
//                          //在这里不能通过此方式获取FormState，context不对
////                      print(Form.of(context));
//
//                          // 通过_formKey.currentState 获取FormState后，
//                          // 调用validate()方法校验用户名密码是否合法，校验
//                          // 通过后再提交数据。
//                          if ((_formKey.currentState as FormState).validate()) {
//                            // 验证通过提交数据
//                            print(_usernameController.text +
//                                "----" +
//                                _passwordController.text);
//                          }
//                        },
//                      ),
//                    ),
                    Expanded(
                      child: Builder(builder: (context) {
                        return RaisedButton(
                          padding: EdgeInsets.all(10.0),
                          child: Text("登录"),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            if (Form.of(context).validate()) {
                              // 验证通过提交数据
                              print(_usernameController.text +
                                  "----" +
                                  _passwordController.text);
                            }
                          },
                        );
                      }),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
