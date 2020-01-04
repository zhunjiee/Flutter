import 'package:flutter/material.dart';

class ColumnTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("hi"),
            Text("world"),
          ],
        ));
  }
}
