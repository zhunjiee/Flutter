import 'package:flutter/material.dart';

class BaseViewWidget extends StatefulWidget {
  BaseViewWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BaseViewWidgetState createState() => _BaseViewWidgetState();
}

class _BaseViewWidgetState extends State<BaseViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          widget.title,
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }
}
