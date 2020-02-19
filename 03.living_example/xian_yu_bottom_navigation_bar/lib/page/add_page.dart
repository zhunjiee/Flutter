/**
 * @ClassName add_page
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-18 16:54
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
//              left: 200,
              bottom: 30,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
