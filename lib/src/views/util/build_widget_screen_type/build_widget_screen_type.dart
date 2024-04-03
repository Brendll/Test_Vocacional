import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';

class ViewMenu extends ResponsiveDesign {
  Widget? _widgetDrawer;

  Widget? _widgetBar;

  Widget? get widgetDrawer => _widgetDrawer;

  set widgetDrawer(Widget? value) {
    _widgetDrawer = value;
    notifyListeners();
  }

  Widget? get widgetBar => _widgetBar;

  set widgetBar(Widget? value) {
    _widgetBar = value;
    notifyListeners();
  }
}
