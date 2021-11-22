
import 'package:flutter/material.dart';
import 'package:riot_disaster_recovery_app/widgets/home_widget.dart';


class WidgetSwitcher extends ChangeNotifier {
  static Widget currentWidget = const HomeWidget();

  static final WidgetSwitcher _widgetSwitcher = WidgetSwitcher._internal();
  factory WidgetSwitcher() {
    return _widgetSwitcher;
  }
  WidgetSwitcher._internal();

  void updateWidget(Widget widget) {
    currentWidget = widget;
    notifyListeners();
  }
}