import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/controllers/login_controller.dart';
import 'package:flutter_test_vocacional_1/src/services/auth/auth.dart';
import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:flutter_test_vocacional_1/src/views/carreras/layouts/carreras_main_layout.dart';
import 'package:flutter_test_vocacional_1/src/views/util/Bar/title_bar.dart';
import 'package:flutter_test_vocacional_1/src/views/util/build_widget_screen_type/build_widget_screen_type.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:provider/provider.dart';

/// ``[CarrerasView]`` - En este Widget se muestra una pantalla con todas las
/// carreras que hay en la base de datos
class CarrerasView extends StatelessWidget {
  /// [CarrerasView] es el constructor de la clase CarrerasView
  CarrerasView({super.key});

  /// ``[rd]`` - Es una instancia de la clase [ResponsiveDesign]
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
          if (LoginController().authService.status == AuthStatus.Authenticated)
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                LoginController().signOut(context);
              },
            ),
        ],
      ),
      body: const CarrerasMainLayout(),
    );
  }
}
