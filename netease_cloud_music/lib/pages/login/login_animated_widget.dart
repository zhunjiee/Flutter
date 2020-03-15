/**
 * @ClassName login_animate_widget
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-23 18:29
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../widgets/v_placeholder_view.dart';
import '../../widgets/common_button.dart';
import '../../provider/user_provider.dart';
import '../../utils/navigator_utils.dart';
import '../../provider/mine_playlist_provider.dart';

class LoginAnimatedWidget extends AnimatedWidget {
  // 构造方法一定要继承父类,不然会不错
  LoginAnimatedWidget({@required this.animation})
      : super(listenable: animation);

  final Tween<double> _opacityTween = Tween(begin: 0, end: 1);
  final Tween<double> _offsetTween = Tween(begin: 40, end: 0);
  final Animation animation;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacityTween.evaluate(animation), // 将映射函数应用于动画当前值
      child: Container(
        margin: EdgeInsets.only(top: _offsetTween.evaluate(animation)),
        child: LoginWidget(),
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.red),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // 主轴方向占尽量少的空间,默认max是占满的
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setWidth(30)),
            child: Text(
              "Welcome Back!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 34,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setWidth(4)),
            child: Text(
              "The Flutter Netease Cloud Music App",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
          VerticalPlaceholderView(50),
          TextField(
            decoration: InputDecoration(
              hintText: "Phone Number",
              prefixIcon: Icon(
                Icons.phone_iphone,
                color: Colors.grey,
              ),
//              border: InputBorder.none, // 取消下划线
            ),
            keyboardType: TextInputType.phone,
            controller: _phoneController,
          ),
          VerticalPlaceholderView(40),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.grey,
              ),
            ),
            controller: _passwordController,
          ),
          VerticalPlaceholderView(120),
          Consumer<UserProvider>(builder: (context, userProvider, child) {
            return CommonButton(
              onPressed: () {
                userProvider.getUserInfo(
                  context,
                  _phoneController.text,
                  _passwordController.text,
                ).then((user) {
                  Provider.of<MinePlaylistProvider>(context, listen: false).user = user;
                  // 跳转到首页
                  NavigatorUtils.goHomePage(context);
                });
              },
              title: "Login",
              width: double.infinity,
              cornerRadius: 25,
            );
          }),
        ],
      ),
    );
  }
}
