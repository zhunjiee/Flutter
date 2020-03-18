import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Text("我"),
        ),
      ),
    );
  }
}
