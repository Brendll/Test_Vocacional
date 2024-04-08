import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/form_test/form_test_model.dart';
import 'package:provider/provider.dart';

class SubmitFormTest extends StatelessWidget {
  const SubmitFormTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const AutoSizeText('Respuetas'),
        const SizedBox(height: 10),
        Row(
          children: [
            for (int i = 0; i < 2; i++) AutoSizeText('Tema ${i + 1}'),
          ],
        ),
        resultadoDeRespuestas(context, 0),
        resultadoDeRespuestas(context, 1),
      ],
    );
  }

  Widget resultadoDeRespuestas(BuildContext context, int i) {
    final resultWidgets =
        <Widget>[]; // Lista para almacenar los widgets resultantes

    // Iterar sobre los formularios
    for (var j = 0; j < 10; j++) {
      resultWidgets
        ..add(AutoSizeText('En el form ${j + 1} las respuestas son:'))
        ..add(const SizedBox(height: 10));

      // Iterar sobre las preguntas en cada formulario
      for (var k = 0; k < 6; k++) {
        resultWidgets.add(
          AutoSizeText('Pregunta ${k + 1}: ${context.watch<FormTestModel>() //
              .respuestas[i][j][k]}'),
        );
      }
    }

    // Devolver una columna que contiene todos los widgets generados
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: resultWidgets,
    );
  }
}
