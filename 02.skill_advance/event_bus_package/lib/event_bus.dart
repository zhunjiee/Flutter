/**
 * @ClassName event_bus
 * @Description 事件总线
 * @Author Houge
 * @Date 2020/3/23 3:53 PM
 * @Version 1.0
 */

import 'package:event_bus/event_bus.dart';

/// 创建全局EventBus
class GlobalEvent {
  EventBus eventBus;

  GlobalEvent._internal() {
    if (eventBus == null) {
      eventBus = EventBus();
    }
  }
  static final GlobalEvent _instance = GlobalEvent._internal();
  factory GlobalEvent() => _instance;
}

class ThemeColorEvent {

  String colorStr;

  ThemeColorEvent(this.colorStr);
}

class DemoEvent {

}