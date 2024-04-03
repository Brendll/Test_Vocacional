// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/controllers/base_controller.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:flutter_test_vocacional_1/src/routes/router.dart';
import 'package:provider/provider.dart';

/// Controlador de la pantalla de inicio de sesión
/// [LoginController] es una clase que extiende de BaseController
class LoginController extends BaseController {
  /// Controlador de la pantalla de inicio de sesión
  LoginController();

  /// Servicio de autenticación
  /// Signs in the user with the provided email and password.
  ///
  /// Takes a [BuildContext] for accessing the [UserModel] and a [String] for
  /// the email and password.
  /// Returns a [Future<bool>] indicating whether the sign in was successful or
  /// not.
  Future<bool> signInWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      // Attempts to sign in the user with the provided credentials
      final user =
          await authService.signInWithEmailAndPassword(email, password);

      // Verify if the user exists
      if (!(await authService.checkUserExistAndRedirect(user!))) {
        // If the user does not exist in the 'users' collection and is not
        // 'TestUser',
        // then sign out the user and show an error message redirecting to the
        //login screen.
        await authService.signOut();
        // Update the error state in the UserModel
        context.read<UserModel>().error = true;
        context.read<UserModel>().errorCode = 'No existe el usuario';
        context.read<UserModel>().errorMessage = 'El usuario que ingresaste no '
            'esta registrado como usuario para aplicar el test, '
            'intenta con otro correo';
        // Redirect to the login screen
        Routes.showScreen(context, 'login');
      } else {
        // Verify if the user exists in the 'TestUser' collection
        if (await authService.checkUserDataAndRedirect(user)) {
          // If the user exists in the 'TestUser' collection, then start the
          // session
          // Update the error state in the UserModel
          context.read<UserModel>().error = false;
          context.read<UserModel>().errorCode = '';
          context.read<UserModel>().errorMessage = '';
          Navigator.pop(context);
        } else {
          // If the user does not exist in the 'TestUser' collection, then show
          //an error message
          // redirecting to the form to fill the data.
          context.read<UserModel>().error = true;
          context.read<UserModel>().errorCode = 'No has llenado tus datos';
          context.read<UserModel>().errorMessage = '';
          // Redirect to the form to fill the data.
          Routes.showScreen(context, 'continue-register');
        }
      }
    } catch (e) {
      // Handles any error that may occur during the sign in process
      // Update the error state in the UserModel
      context.read<UserModel>().error = true;
      context.read<UserModel>().errorCode = 'Error al iniciar sesión';
      context.read<UserModel>().errorMessage = 'Error al iniciar sesión: $e';
    }
    return true;
  }

  /// [signUpWithEmailAndPassword] crea un nuevo usuario en la base de datos y
  /// devuelve un valor booleano que indica si la operación fue exitosa o no.
  Future<bool> signUpWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      // Creación de usuario
      final user =
          await authService.signUpWithEmailAndPassword(email, password);

      // Si `todo` sale bien, establece los datos del usuario en el modelo

      context.read<UserModel>().correo = email;
      context.read<UserModel>().password = password;

      await authService.db
          .collection('users')
          .doc(user!.uid)
          .set({'TypeUsers': 'TestUser'});

      return true;
    } catch (e) {
      // Maneja cualquier error que pueda ocurrir durante la creación del
      // usuario
      debugPrint('Error al registrar usuario: $e');
      return false;
    }
  }

  /// [signOut] - Función que cierra la sesión del usuario
  Future<void> signOut(BuildContext context) async {
    await authService.signOut();
  }

  /// [recoverPassword] - Función que recupera la contraseña del usuario
  Future<void> recoverPassword(BuildContext context, String email) async {
    await authService.recoverPassword(email);
  }
}
