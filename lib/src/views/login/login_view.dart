import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:flutter_test_vocacional_1/src/services/auth/auth.dart';

import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:flutter_test_vocacional_1/src/views/login/layouts/login_layouts.dart';
import 'package:flutter_test_vocacional_1/src/views/util/bar/components/title_component.dart';
import 'package:flutter_test_vocacional_1/src/views/util/bar/layouts/navigation_bar_menu.dart';
import 'package:flutter_test_vocacional_1/src/views/util/build_widget_screen_type/build_widget_screen_type.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.read<ResponsiveDesign>().isMobileAndTablet(context)) {
      //Mobile & Tablet
      context.read<ViewMenu>().widgetDrawer = const Drawer();
      context.read<ViewMenu>().widgetBar = const Row(
        children: [
          Expanded(flex: 3, child: SizedBox(child: TitleComponent())),
        ],
      );
    } else {
      //Desktop
      context.read<ViewMenu>().widgetBar = const Row(
        children: [
          Expanded(flex: 3, child: SizedBox(child: TitleComponent())),
          Expanded(
            flex: 7,
            child: SizedBox(child: NavigationBarMenu()),
          )
        ],
      );
      context.read<ViewMenu>().widgetDrawer = null;
    }
    if (context.watch<UserModel>().error) {
      showError(context);
    }
    return Scaffold(
      drawer: context.watch<ViewMenu>().widgetDrawer,
      backgroundColor: Colores.colorTealFuerte,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(71, 255, 255, 255),
        centerTitle: true,
        elevation: 3,
      ),
      body: LoginLayouts(),
    );
  }

  /// Función para mostrar un diálogo
  void showError(BuildContext context) {
    // Mostrar el diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Devolver el widget del diálogo
        return AlertDialog(
          title: Text(context.watch<UserModel>().errorMessage),
          content: Text(context.watch<UserModel>().errorCode),
          elevation: 4,
          icon: const Icon(
            Icons.error_outline_sharp,
            color: Colores.colorError,
          ),
          actions: <Widget>[
            // Botón de acción
            TextButton(
              onPressed: () {
                // Cerrar el diálogo
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
