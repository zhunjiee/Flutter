/**
 * @ClassName common_button
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-23 23:00
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  CommonButton({
    @required this.onPressed,
    @required this.title,
    this.titleColor = Colors.white,
    this.backgroundColor = Colors.red,
    this.fontSize = 18,
    this.width = 250,
    this.height = 50,
    this.cornerRadius = 25,
  });

  final VoidCallback onPressed;
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final double fontSize;
  final double width;
  final double height;
  final double cornerRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color: titleColor, fontSize: fontSize),
        ),
        color: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius)),
      ),
    );
  }
}
