import 'package:flutter/material.dart';

class ProgressIndicatorTest extends StatefulWidget {
  @override
  _ProgressIndicatorTestState createState() => _ProgressIndicatorTestState();
}

class _ProgressIndicatorTestState extends State<ProgressIndicatorTest>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: LinearProgressIndicator(
              // 不设置value会一直带动画
              value: 0.6,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.redAccent),
            ),
          ),
          Stack(
            children: <Widget>[
              SizedBox(
                // 设置宽高
                width: 200,
                height: 20,
                child: ClipRRect(
                  // 设置圆角
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: LinearProgressIndicator(
                    value: 0.6,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation(Colors.redAccent),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 20,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  "已抢60%",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.redAccent),
              value: 0.6,
              strokeWidth: 10, // 线条宽度
            ),
          ),
        ],
      ),
    );
  }
}
