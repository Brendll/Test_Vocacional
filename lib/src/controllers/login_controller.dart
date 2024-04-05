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
  Future<bool> signInWithEmailAndPassword({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      // Attempts to sign in the user with the provided credentials
      final user =
          await authService.signInWithEmailAndPassword(email, password);

      final userExists = await authService.checkUserExistAndRedirect(user!);
      final userData = await authService.checkUserDataAndRedirect(user);

      if (userExists && userData) {
        context.read<UserModel>().error = false;
        context.read<UserModel>().errorCode = '';
        context.read<UserModel>().errorMessage = '';
        debugPrint('Login success');
        Routes.showScreen(context, 'test');
        return true;
      } else {
        if (userExists == false) {
          context.read<UserModel>().error = true;
          context.read<UserModel>().errorCode = 'No existe el usuario';
          context.read<UserModel>().errorMessage = 'El usuario que '
              'ingresaste no esta registrado como usuario para aplicar '
              'el test, intenta con otro correo';
          debugPrint('Login error: No existe el usuario');
          return false;
        } else if (userData == false) {
          context.read<UserModel>().status = UserModelStatus.Error;
          context.read<UserModel>().errorCode = 'No existen datos del usuario';
          context.read<UserModel>().errorMessage = 'El usuario que '
              'ingresaste no tiene datos registrados.';
          debugPrint('Login error: No existen datos del usuario');
          Routes.showScreen(context, 'continue-register');
          return false;
        }
      }
    } catch (e) {
      // Handles any error that may occur during the sign in process
      // Update the error state in the UserModel
      context.read<UserModel>().error = true;
      context.read<UserModel>().errorCode = 'Error al iniciar sesión';
      context.read<UserModel>().errorMessage = 'Error al iniciar sesión: $e';
      debugPrint('Login error: $e');
      return false;
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

  /// [handleResetPasswordLink] - Método para manejar el enlace de
  /// restablecimiento de contraseña proporcionado por Firebase.
  /// Maneja el enlace de restablecimiento de contraseña proporcionado
  /// por Firebase y llama a un método para restablecer la contraseña del usuario.
  Future<void> handleResetPasswordLink({
    required String resetPasswordLink,
    required String email,
    required String newPassword,
  }) async {
    final oobCode =
        authService.getOobCodeFromResetPasswordLink(resetPasswordLink);
    if (oobCode != null) {
      // Aquí puedes llamar al método para restablecer la contraseña
      await resetPassword(email, oobCode, newPassword);
    } else {
      // Manejar el caso en el que no se pueda obtener el oobCode
      debugPrint(
        'No se pudo obtener el código de restablecimiento de contraseña.',
      );
    }
  }

  /// [resetPassword] - Método para restablecer la contraseña del usuario
  /// utilizando el enlace proporcionado por Firebase.
  Future<void> resetPassword(
    String email,
    String oobCode,
    String newPassword,
  ) async {
    try {
      // Confirmar el restablecimiento de contraseña utilizando el código de
      // restablecimiento y la nueva contraseña
      await FirebaseAuth.instance.confirmPasswordReset(
        code: oobCode,
        newPassword: newPassword,
      );
    } catch (e) {
      // Manejar cualquier error que pueda ocurrir al restablecer la contraseña
      debugPrint('Error al restablecer contraseña: $e');
      rethrow;
    }
  }
}
