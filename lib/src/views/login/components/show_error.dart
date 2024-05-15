import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:provider/provider.dart';

/// Función para mostrar un diálogo
Future<void> showError(
  BuildContext context, {
  required void Function() navegar,
}) async {
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
              // Verificar si navegar es una función válida antes de llamarla
              navegar.call();
            },
            child: const Text('Cerrar'),
          ),
        ],
      );
    },
  );
}
