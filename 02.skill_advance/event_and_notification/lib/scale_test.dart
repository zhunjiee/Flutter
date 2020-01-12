import 'package:flutter/material.dart';

class ScaleTestRoute extends StatefulWidget {
  @override
  _ScaleTestRouteState createState() => _ScaleTestRouteState();
}

class _ScaleTestRouteState extends State<ScaleTestRoute> {
  double _width = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("缩放"),),
      body: Center(
        child: GestureDetector(
          child: Image.asset("images/image.jpg", width: _width,),
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              _width = 200 * details.scale.clamp(.5, 10.0);
            });
          },
        ),
      ),
    );
  }
}
