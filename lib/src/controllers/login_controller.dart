// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/controllers/base_controller.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:flutter_test_vocacional_1/src/routes/router.dart';
import 'package:provider/provider.dart';

class LoginController extends BaseController {
  LoginController();

  Future<bool> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      User? user =
          await authService.signInWithEmailAndPassword(email, password);

      // Verifica si el usuario existe
      if (!(await authService.checkUserExistAndRedirect(user!))) {
        /** Si el usuario no existe en la colección 'users' y no es 'TestUser',
         *  entonces cierra la sesión y muestra un mensaje de error redirigiendo
         *  a la pantalla de inicio de sesión
        */
        authService.signOut();
        context.read<UserModel>().error = true;
        context.read<UserModel>().errorCode = 'No existe el usuario';
        context.read<UserModel>().errorMessage = 'El usuario que ingresaste no ' +
            'esta registrado como usuario para aplicar el test, intenta con otro correo';
        Routes.showScreen(context, 'login');
      } else {
        // Verificar si el usuario existe en la colección 'TestUser'
        if (await authService.checkUserDataAndRedirect(user)) {
          // Si el usuario existe en la colección 'TestUser', entonces inicia la sesión
          context.read<UserModel>().error = false;
          context.read<UserModel>().errorCode = '';
          context.read<UserModel>().errorMessage = '';
        } else {
          /** Si el usuario no existe en la colección 'TestUser', entonces 
           * muestra un mensaje de error redirigiendo al formulario de llenar datos   
           * 
           */
          context.read<UserModel>().error = true;
          context.read<UserModel>().errorCode = 'No has llenado tus datos';
          context.read<UserModel>().errorMessage = '';
          Routes.showScreen(context, 'continue-register/');
        }
      }
    } catch (e) {
      // Maneja cualquier error que pueda ocurrir durante el inicio de sesión
      context.read<UserModel>().error = true;
      context.read<UserModel>().errorCode = 'Error al iniciar sesión';
      context.read<UserModel>().errorMessage = 'Error al iniciar sesión: $e';
    }
    return true;
  }

  Future<bool> signUpWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      // Creación de usuario
      User? user =
          await authService.signUpWithEmailAndPassword(email, password);

      // Si todo sale bien, establece los datos del usuario en el modelo

      context.read<UserModel>().correo = email;
      context.read<UserModel>().password = password;

      authService.db
          .collection('users')
          .doc(user!.uid)
          .set({'TypeUsers': 'TestUser'});

      return true;
    } catch (e) {
      // Maneja cualquier error que pueda ocurrir durante la creación del usuario
      debugPrint("Error al registrar usuario: $e");
      return false;
    }
  }

  Future<void> signOut(BuildContext context) async {
    //TODO Add code here for remove
    authService.signOut();
  }

  Future recoverPassword(BuildContext context, String email) async {
    await authService.recoverPassword(email);
  }
}
