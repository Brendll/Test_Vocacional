import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/controllers/login_controller.dart';
import 'package:flutter_test_vocacional_1/src/services/auth/auth.dart';
import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:flutter_test_vocacional_1/src/views/util/Bar/title_bar.dart';
import 'package:flutter_test_vocacional_1/src/views/util/build_widget_screen_type/build_widget_screen_type.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:provider/provider.dart';

class ContinueRegisterView extends StatelessWidget {
  ContinueRegisterView({Key? key}) : super(key: key);
  final ResponsiveDesign rd = ResponsiveDesign();

  @override
  Widget build(BuildContext context) {
    rd.initScreen(context);

    return Scaffold(
      drawer: context.watch<ViewMenu>().widgetDrawer,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colores.colorAppBar,
        title: TitleBar(),
        centerTitle: true,
        elevation: 1,
        actionsIconTheme: const IconThemeData(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        actions: [
          if (context.watch<AuthService>().status == AuthStatus.Authenticated)
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                LoginController().signOut(context);
              },
            ),
        ],
      ),
      body: const Form(
        child: Text('Continue Register'),
      ),
    );
  }
}
