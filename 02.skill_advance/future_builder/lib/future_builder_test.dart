import 'package:flutter/material.dart';

class FutureBuilderTestRoute extends StatefulWidget {
  @override
  _FutureBuilderTestRouteState createState() => _FutureBuilderTestRouteState();
}

class _FutureBuilderTestRouteState extends State<FutureBuilderTestRoute> {
  Future<String> mockNetworkData() async {
    return Future.delayed(
      Duration(seconds: 2),
      () => "我是从互联网上获取的数据",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder"),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: mockNetworkData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return Text("Contents: ${snapshot.data}");
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
