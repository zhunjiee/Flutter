import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatefulWidget {
  @override
  _ExpansionTileDemoState createState() => _ExpansionTileDemoState();
}

class _ExpansionTileDemoState extends State<ExpansionTileDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expansion Tile")),
      body: Center(
        child: ExpansionTile(
          title: Text("Expansion Tile"),
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.white12,
          children: <Widget>[
            ListTile(
              title: Text("List Tile"),
              subtitle: Text("subtitle"),
            ),
          ],
          initiallyExpanded: true,
        ),

      ),
    );
  }
}
