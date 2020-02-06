import 'package:flutter/material.dart';
import 'main.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> with SingleTickerProviderStateMixin {
  //为什么是SingleTickerProviderStateMixin呢，因为初始化animationController的时候需要一个TickerProvider类型的参数Vsync参数，所以我们混入了TickerProvider的子类SingleTickerProviderStateMixin

  AnimationController _controller; //该对象管理着animation对象
  Animation _animation; //该对象是当前动画的状态，例如动画是否开始，停止，前进，后退。但是绘制在屏幕上的内容不知道

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // vsync在此处时忽略不必要的情况
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    /*
    动画事件监听器，
    它可以监听到动画的执行状态，
    我们这里只监听动画是否结束，
    如果结束则执行页面跳转动作。 
    */
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
          (route) => route == null,
        );
      }
    });

    // 播放动画
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network(
        "http://b-ssl.duitang.com/uploads/item/201812/05/20181205065527_kTzf5.jpeg",
        fit: BoxFit.cover,
      ),
    );
  }
}
