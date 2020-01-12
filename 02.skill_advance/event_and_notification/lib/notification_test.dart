import 'package:flutter/material.dart';

class NotificationTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NotificationListener"),
      ),
      body: NotificationTest(),
    );
  }
}

class NotificationTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        switch (notification.runtimeType) {
          case ScrollStartNotification:
            print("开始滚动");
            break;
          case ScrollUpdateNotification:
            print("正在滚动");
            break;
          case ScrollEndNotification:
            print("滚动停止");
            break;
          case OverscrollNotification:
            print("滚动到边界");
            break;
        }
        return true;
      },
      child: buildListView(),
    );
  }

  ListView buildListView() {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("$index"),
          );
        });
  }
}

//----------------------- 自定义通知案例 -----------------

class NotificationRoute extends StatefulWidget {
  @override
  _NotificationRouteState createState() => _NotificationRouteState();
}

class _NotificationRouteState extends State<NotificationRoute> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        setState(() {
          _msg += notification.msg + "  ";
        });
        return true;
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // 不管用,context是根的,而NotificationListener是监听的子树
//            RaisedButton(
//              child: Text("Send Notification"),
//              onPressed: (){
//                MyNotification("Hi").dispatch(context);
//              },
//            ),

            Builder(
              builder: (context) {
                return RaisedButton(
                  child: Text("Send Notification"),
                  onPressed: () => MyNotification("Hi").dispatch(context),
                );
              },
            ),
            Text(_msg),
          ],
        ),
      ),
    );
  }
}

// 自定义通知
class MyNotification extends Notification {
  MyNotification(this.msg);

  final String msg;
}
