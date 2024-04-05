// ignore_for_file: use_build_context_synchronously

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/controllers/base_controller.dart';
import 'package:flutter_test_vocacional_1/src/models/carreers/carreras_model.dart';
import 'package:provider/provider.dart';

/// CarrerasController es una clase que extiende de BaseController
///
class CarrerasController extends BaseController {
  Future<void> getImagenesCarreras(BuildContext context) async {
    BaseController bc = BaseController();
    List<String> listaImagenes = [];

    // Obtener la referencia al directorio en Firebase Storage

    Reference ref = bc.authService.imageRef.child('assets/images/carreras');

    // Listar todos los elementos (archivos e incluso subdirectorios) en el directorio
    try {
      ListResult result = await ref.listAll();

      // Iterar sobre los elementos y añadir las imágenes a la lista
      for (var reference in result.items) {
        String downloadURL = await reference.getDownloadURL();

        listaImagenes.add(downloadURL);
      }

      context.read<CarrerasModel>().carreras = listaImagenes;

      // Si también quieres obtener las imágenes de los subdirectorios recursivamente,
      // puedes hacerlo mediante una función recursiva.
    } catch (e) {
      // Manejar cualquier error que pueda ocurrir
      debugPrint('Error al obtener las imágenes: $e');
    }
  }
}
