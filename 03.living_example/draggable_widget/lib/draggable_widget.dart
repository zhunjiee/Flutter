import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  final Offset offset;
  final Color widgetColor;

  DraggableWidget({Key key, this.offset, this.widgetColor}) : super(key: key);

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset offset = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        // data为要传递的参数
        data: widget.widgetColor,
        child: Container(
          width: 100.0,
          height: 100.0,
          color: widget.widgetColor,
        ),
        // 拖拽过程中
        feedback: Container(
          width: 100.0,
          height: 100.0,
          color: widget.widgetColor.withOpacity(0.5),
        ),
        // 松开拖拽控件
        onDraggableCanceled: (Velocity velocity, Offset offset) {
          setState(() {
            this.offset = offset;
          });
        },
      ),
    );
  }
}
