import 'package:flutter/material.dart';

class StackPositionedtestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //通过ConstrainedBox来确保Stack占满屏幕
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: Text("Hello world!", style: TextStyle(color: Colors.white),),
            color: Colors.red,
          ),
          Positioned(
            left: 20,
             child: Text("I'm fine"),
          ),
          Positioned(
            top: 50,
            child: Text("thank you!"),
          ),

          Positioned(
            left: 20,
            top: 20,
            child: Text("And you?"),
          ),
        ],
      ),
    );
  }
}
