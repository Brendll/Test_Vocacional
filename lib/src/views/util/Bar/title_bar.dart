import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test_vocacional_1/src/views/util/build_widget_screen_type/build_widget_screen_type.dart';
import 'package:provider/provider.dart';

class TitleBar extends StatelessWidget {
  TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: context.watch<ViewMenu>().widgetBar,
    );
  }
}
