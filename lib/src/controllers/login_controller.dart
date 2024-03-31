import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/controllers/base_controller.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:provider/provider.dart';

class LoginController extends BaseController {
  LoginController();

  Future<bool> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    //TODO Add code here for setter
    await authService.signInWithEmailAndPassword(email, password);
    return true;
  }

  Future<bool> signUpWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      // Creación de usuario
      User? user =
          await authService.signUpWithEmailAndPassword(email, password);

      // Verifica el correo electrónico del usuario
      await user?.sendEmailVerification().whenComplete(() => null);

      // Si todo sale bien, establece los datos del usuario en el modelo
      UserModel viewModelUser = Provider.of<UserModel>(context, listen: false);
      viewModelUser.correo = email;
      viewModelUser.password = password;

      return true;
    } catch (e) {
      // Maneja cualquier error que pueda ocurrir durante la creación del usuario
      print("Error al registrar usuario: $e");
      return false;
    }
  }

  Future<void> signOut(BuildContext context) async {
    //TODO Add code here for remove
    authService.signOut();
  }
}
