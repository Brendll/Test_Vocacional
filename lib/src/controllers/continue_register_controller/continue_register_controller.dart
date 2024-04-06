import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/controllers/base_controller.dart';
import 'package:flutter_test_vocacional_1/src/routes/router.dart';

class ContinueRegisterController extends BaseController {
  Future<void> dataCompleteUser(BuildContext context) async {
    await authService.db
        .collection('TestUser')
        .doc(authService.firebaseUser!.uid)
        .set({
      'correo': userModel.correo,
      'password': userModel.password,
      'nombre': userModel.nombre,
      'apellidoP': userModel.apellidoP,
      'apellidoM': userModel.apellidoM,
      'curp': userModel.curp,
      'carreras': userModel.carreras,
      'birthday': Timestamp.fromMillisecondsSinceEpoch(
          userModel.birthday.millisecondsSinceEpoch),
    }).whenComplete(() {
      Routes.showScreen(context, 'test');
    });
  }
}
