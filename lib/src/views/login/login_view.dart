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

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: context.watch<ViewMenu>().widgetDrawer,
      backgroundColor: Colores.colorTealFuerte,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(71, 255, 255, 255),
        centerTitle: true,
        elevation: 3,
      ),
      body: const LoginLayouts(),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (context.watch<UserModel>().error) {
      // Llama a showError solo si hay un error en el UserModel
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showError(context);
      });
    }
  }

  Future<void> showError(BuildContext context) async {
    // Mostrar el diálogo
    await showDialog<void>(
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
