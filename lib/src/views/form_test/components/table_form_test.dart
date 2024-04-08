import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/form_test/form_test_model.dart';
import 'package:provider/provider.dart';

/// Tabla de preguntas del formTest
class TableFormTest extends StatefulWidget {
  /// constructor de la tabla
  const TableFormTest({
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

  @override
  State<TableFormTest> createState() => _TableFormTestState();
}

class _TableFormTestState extends State<TableFormTest> {
  late List<int> _groupValues = List.generate(6, (index) => -1);
  @override
  void initState() {
    super.initState();
    // Inicializar el estado de los grupos para cada fila
  }

  @override
  Widget build(BuildContext context) {
    //Lista de respuestas
    final List<String> respuestas = [
      widget.respuesta0,
      widget.respuesta1,
      widget.respuesta2,
      widget.respuesta3,
      widget.respuesta4,
    ];

    //Lista de preguntas
    final List<String> preguntas = [
      widget.pregunta1,
      widget.pregunta2,
      widget.pregunta3,
      widget.pregunta4,
      widget.pregunta5,
      widget.pregunta6,
    ];

    // Posicion de preguntas
    final List<int> posicionesPreguntas = [
      widget.posicionDePregunta1,
      widget.posicionDePregunta2,
      widget.posicionDePregunta3,
      widget.posicionDePregunta4,
      widget.posicionDePregunta5,
      widget.posicionDePregunta6,
    ];

    // Dibujo del widget tabla
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: AutoSizeText(
            textAlign: TextAlign.center,
            widget.titleTable,
            maxLines: 4,
            maxFontSize: 20,
          ),
        ),
        Table(
          border: TableBorder.all(),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            ///Segunda fila

            // Encabezado 2
            TableRow(
              children: [
                // Encabezado ``Pregunta`` para listado de pregunta
                const TableCell(
                  child: Center(
                    child: AutoSizeText(
                      'Pregunta',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      minFontSize: 4,
                      maxLines: 1,
                      maxFontSize: 12,
                    ),
                  ),
                ),

                // Encabezado ``Pregunta``
                TableCell(
                  child: Center(
                    child: AutoSizeText(
                      widget.preguntaEncabezado,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      minFontSize: 4,
                      maxLines: 6,
                      maxFontSize: 12,
                    ),
                  ),
                ),

                // Encabezado divido den tipo de respuestas y puntaje
                for (int i = 0; i < respuestas.length; i++)
                  TableCell(
                    child: Expanded(
                      child: Table(
                        border: TableBorder.all(),
                        children: [
                          // Encabezado ``respuestas``
                          TableRow(
                            children: [
                              // Encabezado ``respuestas``
                              TableCell(
                                child: Center(
                                  child: AutoSizeText(
                                    respuestas[i],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    minFontSize: 3,
                                    maxLines: 6,
                                    maxFontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Encabezado ``puntaje``
                          TableRow(
                            children: [
                              TableCell(
                                child: Center(
                                  child: AutoSizeText(
                                    '$i Puntos',
                                    minFontSize: 3,
                                    maxLines: 2,
                                    maxFontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),

            // Preguntas y respuestas
            for (int i = 0; i < 6; i++)
              TableRow(
                children: [
                  TableCell(
                    child: Center(
                      child: AutoSizeText(
                        '${i + 1}',
                        minFontSize: 3,
                        maxFontSize: 14,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: AutoSizeText(
                        preguntas[i],
                        maxFontSize: 12,
                        minFontSize: 2,
                        maxLines: 8,
                      ),
                    ),
                  ),
                  for (int j = 0; j < respuestas.length; j++)
                    TableCell(
                      child: Column(
                        children: [
                          AutoSizeText(
                            'i:$i j:$j',
                            maxLines: 1,
                            minFontSize: 1,
                            maxFontSize: 9,
                          ),
                          Radio(
                            value: j, //Valor por columna
                            groupValue: _groupValues[i], //Grupo por fila
                            onChanged: (value) => onChangedRadio(
                              value!,
                              posicionesPreguntas,
                              i,
                              j,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
          ],
        ),
      ],
    );
  }

  void onChangedRadio(int value, List<int> posicionesPreguntas, int i, int j) {
    // Se actualiza el valor de la respuesta en el modelo
    setState(() {
      _groupValues[i] = value;
      context.read<FormTestModel>().respuestas[widget.posicionDelTema]
          [widget.posicionDeForm][posicionesPreguntas[i]] = value;

      // Se imprime la respuesta de la pregunta en la fila
      debugPrint('Respuesta: $value');

      // Se imprime la respuesta almacenada en la lista resouestas del model
      //Ejemplo: Si en la primera fila del del primer form es selecionada
      //la respuesta 4, entonces, el valor de la respuesta es:
      //
      //context.read<FormTestModel>().respuestas[0][0][0]: 4

      //Se imprime la respuesta
      debugPrint('context.read<FormTestModel>()'

          //Este puede ser  0 o 1, total temas, o sea 2
          '.respuestas[${widget.posicionDelTema}]'
          '[${widget.posicionDeForm}]'

          //Este puede ser 0 o 9, total de 10 formularios
          '[${posicionesPreguntas[i]}]: '

          //Este es el valor de la respuesta
          '${context.read<FormTestModel>() //
                          .respuestas //
                      [widget.posicionDelTema] //
                  [widget.posicionDeForm] //
              [posicionesPreguntas[i]]}');
    });
  }
}
