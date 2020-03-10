import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextSpan"),
      ),
      body: Container(
        color: Colors.grey[100],
        child: Center(
          child: Column(
            children: <Widget>[
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: "http://",
                        style: TextStyle(
                          color: Colors.red,
                        )),
                    TextSpan(
                        text: "www.baidu.com",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.yellow,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "hello"),
                    TextSpan(
                        text: " world", style: TextStyle(color: Colors.green)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
