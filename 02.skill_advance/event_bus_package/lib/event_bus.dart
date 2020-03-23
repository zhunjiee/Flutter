/**
 * @ClassName event_bus
 * @Description 事件总线
 * @Author Houge
 * @Date 2020/3/23 3:53 PM
 * @Version 1.0
 */

import 'package:event_bus/event_bus.dart';

/// 创建EventBus
EventBus eventBus = EventBus();

class ThemeColorEvent {

  String colorStr;

  ThemeColorEvent(this.colorStr);
}

class DemoEvent {

}