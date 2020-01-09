import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(ChangeNotifierProvider<Counter>.value(
    value: Counter(1),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Provider",
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("下一页"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondPage(),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text("${Provider.of<Counter>(context).count}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Counter>(context, listen: false).add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("第二页"),
      ),
      body: Center(
        child: Text("${Provider.of<Counter>(context).count}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Counter>(context, listen: false).add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int _count;

  Counter(this._count);

  void add() {
    _count++;
    notifyListeners();
  }

  get count => _count;
}
