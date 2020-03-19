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
          child: Container(
            height: 100,
            width: 300,
            color: Colors.pink,
            child: Container(
              height: 30,
              width: 100,
              color: Colors.blue,
              constraints: BoxConstraints(
                maxWidth: 100,
                maxHeight: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
