import 'package:flutter/material.dart';

class ToolTipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tool Tip Demo"),
      ),
      body: Center(
        child: Tooltip(
          message: "不要碰",
          child: Icon(Icons.all_inclusive),
        ),
      ),
    );
  }
}
