import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:flutter_test_vocacional_1/src/services/auth/auth.dart';
import 'package:provider/provider.dart';

class ContinueRegisterController {
  Future<void> dataCompleteUser(BuildContext context) async {
    await context
        .read<AuthService>()
        .db
        .collection('TestUser')
        .doc(context.watch<AuthService>().firebaseUser?.uid)
        .set({
      'correo': context.watch<UserModel>().correo,
      'password': context.watch<UserModel>().password,
      'nombre': context.watch<UserModel>().nombre,
      'apellidoP': context.watch<UserModel>().apellidoP,
      'apellidoM': context.watch<UserModel>().apellidoM,
      'curp': context.watch<UserModel>().curp,
      'carreras': context.watch<UserModel>().carreras,
      'birthday': context.watch<UserModel>().birthday.millisecondsSinceEpoch,
    }).whenComplete(() {
      Navigator.pushNamed(context, '/test');
    });
  }
}
