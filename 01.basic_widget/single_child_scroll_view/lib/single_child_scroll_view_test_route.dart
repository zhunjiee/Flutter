import 'package:flutter/material.dart';

class SingleChildScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    return Scrollbar(
      // 显示进度条
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: str
                .split("")
                .map((e) => Text(
                      e,
                      textScaleFactor: 2.0,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
