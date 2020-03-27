import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluro/fluro.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'utils/log_utils.dart';
import 'application.dart';
import 'routes/routes.dart';
import 'routes/navigate_service.dart';
import 'pages/splash_page.dart';
import 'utils/common_color.dart';
import 'provider/user_provider.dart';
import 'provider/play_music_provider.dart';
import 'provider/mine_playlist_provider.dart';

void main() {
  // fluro全局注入
  final router = Router();
  Routes.configRoutes(router);
  Application.router = router;
  // ServiceLocator注入
  Application.setupLocator();
  // log初始化
  LogUtils.init(tag: "NETEASE_MUSIC");

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>.value(value: UserProvider()),
        ChangeNotifierProvider<PlayMusicProvider>.value(
            value: PlayMusicProvider()..init()),
        ChangeNotifierProvider<MinePlaylistProvider>.value(
            value: MinePlaylistProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final JPush jPush = JPush();
  AppLifecycleState lifecycleState = AppLifecycleState.resumed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
      child: MaterialApp(
        title: 'Netease Cloud Music',
        theme: ThemeData(
//        primarySwatch: Colors.red,
          // 自定义主体色
          primaryColor: themeColor,
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(
              title: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // 设置导航跳转样式类似iOS,并且自带向右滑返回前一页
          platform: TargetPlatform.iOS,
        ),
        debugShowCheckedModeBanner: false, // 不显示debug字样
        onGenerateRoute: Application.router.generator, // 生成路由
        navigatorKey:
            Application.getIt<NavigateService>().key, // 导航键,用于无context实现跳转
        home: SplashPage(),
      ),
    );
  }

  @override
  Future didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    lifecycleState = state;
    print("lifecycleChanged -------> $state");
  }

  /// 极光推送相关配置
  Future<void> initPlatformState() async {
    try {
      jPush.addEventHandler(
          onReceiveNotification: (Map<String, dynamic> message) async {
        try {
          var extras = message['extras'];
          var extrasMap = extras["cn.jpush.android.EXTRA"];
          var notifyId = extras["cn.jpush.android.NOTIFICATION_ID"];
          print("flutter onReceiveNotification: $message");
          var extrasJson = json.decode(extrasMap);
          if (extrasMap != null) {
            var type = extrasJson["type"].toString();
            if (type != null) {
              String title = message["title"];
              String alert = message["alert"];
              print("$title =============================== $alert");
              // App在前台
              if (lifecycleState != null &&
                  lifecycleState == AppLifecycleState.resumed) {
                print("notifyid: $notifyId, title: $title , message: $alert");
                jPush.clearNotification(notificationId: notifyId);
              }
            }
          }
        } catch (e) {
          print("flutter catch: $e");
        }
      }, onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
      }, onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
      });
    } on PlatformException catch (e) {
      print("flutter onReceiveMessage: ${e.message},${e.code},${e.details}");
    }
    // 配置必要信息
    jPush.setup(
      appKey: "98f23c8696c6207132052724", //你自己应用的 AppKey
      channel: "developer-default",
      production: false,
      debug: true,
    );
    // 监听jPush
    jPush.applyPushAuthority(
        new NotificationSettingsIOS(sound: true, alert: true, badge: true));

    // Platform messages may fail, so we use a try/catch PlatformException.
    jPush.getRegistrationID().then((rid) {
      print("flutter get registration id : $rid");
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }
}
