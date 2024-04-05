import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/controllers/login_controller.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:flutter_test_vocacional_1/src/routes/router.dart';
import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:flutter_test_vocacional_1/src/views/continue_register/components/email_field.dart';
import 'package:flutter_test_vocacional_1/src/views/continue_register/components/password_field.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:provider/provider.dart';

class LoginCardLayout extends StatelessWidget {
  LoginCardLayout({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var countField = 2;
    var countChildAspectRatio = 2.0;
    if (ResponsiveDesign().isDesktop(context)) {
      countField = 2;
      countChildAspectRatio = 2.0;
    } else {
      countField = 1;
      countChildAspectRatio = 7.0;
    }

    return Form(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            const AutoSizeText(
              'Iniciar Sesión',
              style: TextStyle(fontSize: 50),
              maxLines: 2,
              textAlign: TextAlign.center,
              maxFontSize: 50,
              minFontSize: 20,
            ),
            const EmailField(),
            const PasswordField(),
            const SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 10,
                ),
              ),
              onPressed: () => Routes.showScreen(context, 'recoverpassword'),
              child: const AutoSizeText(
                'Recuperar Contraseña',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w100,
                  color: Colores.colorTextoFuerte,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colores.colorFondoClaro),
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  foregroundColor: const MaterialStatePropertyAll(Colors.black),
                ),
                onPressed: () async {
                  // Valida y envía el formulario
                  if (formKey.currentState!.validate()) {
                    // Si el formulario es válido, ejecuta la lógica de
                    // envío aquí Por ejemplo, puedes guardar los datos
                    // del formulario en una base de datos.
                    debugPrint('Formulario Valido: ${formKey.currentState}'
                        '\n Email: ${context.watch<UserModel>().correo}'
                        '\n Password ${context.watch<UserModel>().password}');
                    await LoginController().signInWithEmailAndPassword(
                      context: context,
                      email: context.watch<UserModel>().correo,
                      password: context.watch<UserModel>().password,
                    );
                  }
                },
                child: const Text('Enviar'),
              ),
            ),
            const SizedBox(height: 5),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 10,
                ),
              ),
              onPressed: () => Routes.showScreen(context, 'register'),
              child: const AutoSizeText(
                'Registrate',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w100,
                  color: Colores.colorTextoFuerte,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
