import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 添加中文支持
//      localizationsDelegates: [
//        GlobalMaterialLocalizations.delegate,
//        GlobalWidgetsLocalizations.delegate,
//      ],
//      supportedLocales: [
//        const Locale("zh", "CH"),
//        const Locale("en", "US"),
//      ],
//      locale: Locale("zh"),
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
  DateTime _dateTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DatePicker"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () async {
                var result = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                );
                print(result);
              },
              child: Text("Material DatePicker"),
            ),

            RaisedButton(
              onPressed: () async {
                var result = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());
                print(result);
              },
              child: Text("Material TimePicker"),
            ),

            RaisedButton(
              onPressed: () {
                _showCupertinoDatePicker(context);
              },
              child: Text("Cupertino DatePicker"),
            ),

          ],
        ),
      ),
    );
  }

  /// iOS风格的日期选择器,不支持中文显示,localizations国际化会报错
  void _showCupertinoDatePicker(BuildContext cxt) {
    final picker = CupertinoDatePicker(
      onDateTimeChanged: (date) {
        print("the date is ${date.toString()}");
      },
      initialDateTime: DateTime.now(),
    );

    showCupertinoModalPopup(
        context: cxt,
        builder: (cxt) {
          return Container(
            height: 200,
            child: picker,
          );
        });
  }
}
