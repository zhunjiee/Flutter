/**
 * @ClassName splash_page
 * @Description 启动页
 * @Author HouGe
 * @Date 2020-02-22 13:05
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/user_model.dart';
import 'package:provider/provider.dart';
import '../application.dart';
import '../utils/navigator_utils.dart';
import '../provider/user_provider.dart';
import '../utils/net_utils.dart';
import '../provider/mine_playlist_provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController _logoController;
  CurvedAnimation _logoAnimation;

  @override
  void initState() {
    super.initState();
    // 初始化AnimationController
    _logoController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    // 使用弹性曲线
    _logoAnimation =
        CurvedAnimation(parent: _logoController, curve: Curves.easeOutQuart);
    Future.delayed(Duration(milliseconds: 500), () {
      // 启动动画
      _logoController.forward();
    });
    // 监听动画状态的改变
    _logoController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        _globalConfig();
      } else if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 200), () {
          _goPage();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ScaleTransition(
          // 动画缩放
          scale: _logoAnimation,
          child: Hero(
            tag: "logo",
            child: Image.asset("images/icon_logo.png"),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _logoController.dispose();
  }

  /// 各种初始化配置
  void _globalConfig() async {
    // 屏幕适配
    ScreenUtil.init(context, width: 750, height: 1334);
    // 各种尺寸
    final size = MediaQuery.of(context).size;
    Application.screenWidth = size.width;
    Application.screenHeight = size.height;
    Application.statusBarHeight = MediaQuery.of(context).padding.top;
    Application.bottomBarHeight = MediaQuery.of(context).padding.bottom;  // 系统自带: kBottomNavigationBarHeight

    // sharedPreferences
    await Application.initSharedPreferences();
    // 初始化本地存储用户信息
    Provider.of<UserProvider>(context, listen: false).initUserInfo();
    // 网络请求类初始化
    NetUtils();
  }

  /// 跳转到新页面
  void _goPage() async {
    // 获取用户信息
    UserModel userModel =
        Provider.of<UserProvider>(context, listen: false).user;
    Provider.of<MinePlaylistProvider>(context, listen: false).user = userModel;

    if (userModel != null) {
      await NetUtils().refreshLogin().then((value){
        if (value.data != -1) {
          // 跳转到主页
          NavigatorUtils.goHomePage(context);
        }
      });
    } else {
      // 跳转到登录页
      NavigatorUtils.goLoginPage(context);
    }
  }
}
