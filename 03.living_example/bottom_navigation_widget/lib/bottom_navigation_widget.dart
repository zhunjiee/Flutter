import 'package:bottom_navigation_widget/base_view_widget.dart';
import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/email_screen.dart';
import 'pages/pages_screen.dart';
import 'pages/airplay_screen.dart';

/*
* 普通导航栏
* */
class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    list
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(AirplayScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            title: Text("Email"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            title: Text("Pages"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplay),
            title: Text("AirPlay"),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

/*
* 不规则底部导航栏
* */
class BottomAppBarWidget extends StatefulWidget {
  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  List<Widget> _eachView;
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eachView = List();
    _eachView
      ..add(BaseViewWidget(
        title: "Home",
      ))
      ..add(BaseViewWidget(
        title: "Me",
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_index],
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.airport_shuttle),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 1;
                });
              },
            ),
          ],
        ),
      ),

      // 底部TabBar "+" 按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return BaseViewWidget(
                title: "New Page",
              );
            }),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        tooltip: "Increment",
      ),
      // 按钮位置在中间
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
