import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/form_test/form_test_model.dart';
import 'package:provider/provider.dart';

/// Tabla de preguntas del formTest
class TableFormTest extends StatelessWidget {
  /// constructor de la tabla
  TableFormTest({
    required this.posicionDelTema,
    required this.posicionDeForm,
    required this.titleTable,
    required this.posicionDePregunta1,
    required this.posicionDePregunta2,
    required this.posicionDePregunta3,
    required this.posicionDePregunta4,
    required this.posicionDePregunta5,
    required this.posicionDePregunta6,
    required this.preguntaEncabezado,
    required this.respuesta0,
    required this.respuesta1,
    required this.respuesta2,
    required this.respuesta3,
    required this.respuesta4,
    required this.pregunta1,
    required this.pregunta2,
    required this.pregunta3,
    required this.pregunta4,
    required this.pregunta5,
    required this.pregunta6,
    super.key,
  });

  ///posiciones exactas para las respuestas

  final int posicionDelTema;
  final int posicionDeForm;
  final int posicionDePregunta1; // Posición de la pregunta 1
  final int posicionDePregunta2; // Posición de la pregunta 2
  final int posicionDePregunta3; // Posición de la pregunta 3
  final int posicionDePregunta4; // Posición de la pregunta 4
  final int posicionDePregunta5; // Posición de la pregunta 5
  final int posicionDePregunta6; // Posición de la pregunta 6

  // Titulo
  /// Titulo de la tabla
  /// ``[titleTable]``
  /// ``` dart
  /// TableRow(
  ///   children: [
  ///     TableCell(
  ///       child: Center(
  ///         child: AutoSizeText(
  ///           titleTable,
  ///           maxLines: 4,
  ///           maxFontSize: 20,
  ///         ),
  ///       ),
  ///     ),
  ///   ],
  /// ),
  /// ```
  final String titleTable;

  // Encabezado
  /// Encabezado ``Pregunta``
  /// ``[preguntaEncabezado]``
  /// ``` dart
  /// TableCell(
  ///   child: Center(
  ///     child: AutoSizeText(
  ///       preguntaEncabezado,
  ///       style: const TextStyle(fontWeight: FontWeight.bold),
  ///     ),
  ///   ),
  /// ),
  /// ```

  final String preguntaEncabezado;

  // Encabezado Respuestas
  // Encabezado ``respuesta0``
  /// ``` dart
  /// TableCell(
  ///   child: Center(
  ///     child: AutoSizeText(
  ///       respuesta0,
  ///       style: const TextStyle(fontWeight: FontWeight.bold),
  ///     ),
  ///   ),
  /// ),
  /// ```
  final String respuesta0;
  final String respuesta1;
  final String respuesta2;
  final String respuesta3;
  final String respuesta4;

  // Preguntas
  final String pregunta1;
  final String pregunta2;
  final String pregunta3;
  final String pregunta4;
  final String pregunta5;
  final String pregunta6;

  int selectedValue = -1; // valor seleccionado por defecto

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: [
        // Titulo de la tabla
        TableRow(
          children: [
            TableCell(
              child: Center(
                child: AutoSizeText(
                  titleTable,
                  maxLines: 4,
                  maxFontSize: 20,
                ),
              ),
            ),
          ],
        ),

        // Encabezado 2
        TableRow(
          children: [
            // Encabezado ``Pregunta`` para listado de pregunta
            const TableCell(
              child: Center(
                child: AutoSizeText(
                  'Pregunta',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Encabezado ``Pregunta``
            TableCell(
              child: Center(
                child: AutoSizeText(
                  preguntaEncabezado,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Encabezado divido den tipo de respuestas y puntaje
            Table(
              border: TableBorder.all(),
              children: [
                // Encabezado ``respuestas``
                TableRow(
                  children: [
                    // Encabezado ``respuesta0``
                    TableCell(
                      child: Center(
                        child: AutoSizeText(
                          respuesta0,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    // Encabezado ``respuesta1``
                    TableCell(
                      child: Center(
                        child: AutoSizeText(
                          respuesta1,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    // Encabezado ``respuesta2``
                    TableCell(
                      child: Center(
                        child: AutoSizeText(
                          respuesta2,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    // Encabezado ``respuesta3``
                    TableCell(
                      child: Center(
                        child: AutoSizeText(
                          respuesta3,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    // Encabezado ``respuesta4``
                    TableCell(
                      child: Center(
                        child: AutoSizeText(
                          respuesta4,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),

                // Encabezado ``puntaje``
                const TableRow(
                  children: [
                    TableCell(child: Center(child: AutoSizeText('0 Puntos'))),
                    TableCell(child: Center(child: AutoSizeText('1 puntos'))),
                    TableCell(child: Center(child: AutoSizeText('2 puntos'))),
                    TableCell(child: Center(child: AutoSizeText('3 puntos'))),
                    TableCell(child: Center(child: AutoSizeText('4 puntos'))),
                  ],
                ),
              ],
            ),
          ],
        ),

        // Pregunta1
        TableRow(
          children: [
            const TableCell(child: Center(child: AutoSizeText('1'))),
            TableCell(child: Center(child: AutoSizeText(pregunta1))),

            // Radio puntos 0
            TableCell(
              child: Center(
                child: Radio(
                  value: 0,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta1],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta1] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 1
            TableCell(
              child: Center(
                child: Radio(
                  value: 1,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta1],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta1] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 2
            TableCell(
              child: Center(
                child: Radio(
                  value: 2,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta1],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta1] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 3
            TableCell(
              child: Center(
                child: Radio(
                  value: 3,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta1],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta1] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 4
            TableCell(
              child: Center(
                child: Radio(
                  value: 4,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta1],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta1] = value!;
                  },
                ),
              ),
            ),
          ],
        ),

        // Pregunta2
        TableRow(
          children: [
            const TableCell(child: Center(child: AutoSizeText('2'))),
            TableCell(child: Center(child: AutoSizeText(pregunta2))),

            // Radio puntos 0
            TableCell(
              child: Center(
                child: Radio(
                  value: 0,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta2],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta2] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 1
            TableCell(
              child: Center(
                child: Radio(
                  value: 1,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta2],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta2] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 2
            TableCell(
              child: Center(
                child: Radio(
                  value: 2,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta2],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta2] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 3
            TableCell(
              child: Center(
                child: Radio(
                  value: 3,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta3],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta3] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 4
            TableCell(
              child: Center(
                child: Radio(
                  value: 4,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta4],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta4] = value!;
                  },
                ),
              ),
            ),
          ],
        ),

        // Pregunta3
        TableRow(
          children: [
            const TableCell(child: Center(child: AutoSizeText('3'))),
            TableCell(child: Center(child: AutoSizeText(pregunta3))),
            // Radio puntos 0
            TableCell(
              child: Center(
                child: Radio(
                  value: 0,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta3],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta3] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 1
            TableCell(
              child: Center(
                child: Radio(
                  value: 1,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta3],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta3] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 2
            TableCell(
              child: Center(
                child: Radio(
                  value: 2,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta4],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta4] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 3
            TableCell(
              child: Center(
                child: Radio(
                  value: 3,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta4],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta4] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 4
            TableCell(
              child: Center(
                child: Radio(
                  value: 4,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta4],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta4] = value!;
                  },
                ),
              ),
            ),
          ],
        ),

        // Pregunta4
        TableRow(
          children: [
            const TableCell(child: Center(child: AutoSizeText('4'))),
            TableCell(child: Center(child: AutoSizeText(pregunta4))),
            // Radio puntos 0
            TableCell(
              child: Center(
                child: Radio(
                  value: 0,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta5],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta5] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 1
            TableCell(
              child: Center(
                child: Radio(
                  value: 1,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta5],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta5] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 2
            TableCell(
              child: Center(
                child: Radio(
                  value: 2,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta5],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta5] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 3
            TableCell(
              child: Center(
                child: Radio(
                  value: 3,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta5],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta5] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 4
            TableCell(
              child: Center(
                child: Radio(
                  value: 4,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta5],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta5] = value!;
                  },
                ),
              ),
            ),
          ],
        ),

        // Pregunta5
        TableRow(
          children: [
            const TableCell(child: Center(child: AutoSizeText('5'))),
            TableCell(child: Center(child: AutoSizeText(pregunta5))),

            // Radio puntos 0
            TableCell(
              child: Center(
                child: Radio(
                  value: 0,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta5],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta5] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 1
            TableCell(
              child: Center(
                child: Radio(
                  value: 1,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta5],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta5] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 2
            TableCell(
              child: Center(
                child: Radio(
                  value: 2,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta5],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta5] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 3
            TableCell(
              child: Center(
                child: Radio(
                  value: 3,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta5],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta5] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 4
            TableCell(
              child: Center(
                child: Radio(
                  value: 4,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta5],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta5] = value!;
                  },
                ),
              ),
            ),
          ],
        ),

        // Pregunta6
        TableRow(
          children: [
            const TableCell(child: Center(child: AutoSizeText('6'))),
            TableCell(child: Center(child: AutoSizeText(pregunta6))),

            // Radio puntos 0
            TableCell(
              child: Center(
                child: Radio(
                  value: 0,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta6],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta6] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 1
            TableCell(
              child: Center(
                child: Radio(
                  value: 1,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta6],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta6] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 2
            TableCell(
              child: Center(
                child: Radio(
                  value: 2,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta6],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta6] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 3
            TableCell(
              child: Center(
                child: Radio(
                  value: 3,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta6],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta6] = value!;
                  },
                ),
              ),
            ),

            // Radio puntos 4
            TableCell(
              child: Center(
                child: Radio(
                  value: 4,
                  groupValue:
                      context.watch<FormTestModel>().respuestas[posicionDelTema]
                          [posicionDeForm][posicionDePregunta6],
                  onChanged: (value) {
                    context.watch<FormTestModel>().respuestas[posicionDelTema]
                        [posicionDeForm][posicionDePregunta6] = value!;
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
