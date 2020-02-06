import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class FutureBuilderRoute extends StatefulWidget {
  @override
  _FutureBuilderRouteState createState() => _FutureBuilderRouteState();
}

class _FutureBuilderRouteState extends State<FutureBuilderRoute> {
  Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder(
        future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // 请求完成
          if (snapshot.connectionState == ConnectionState.done) {
            Response response = snapshot.data;
            // 发生错误
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            // 请求成功
            return Scrollbar(
              child: ListView(
                children: response.data
                    .map<Widget>(
                      (e) => ListTile(
                        title: Text(e["full_name"]),
                      ),
                    )
                    .toList(),
              ),
            );
          }
          // 请求未完成时弹出loading
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
