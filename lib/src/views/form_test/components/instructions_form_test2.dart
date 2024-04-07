/**
INSTRUCCIONES
 Contesta el cuestionario tomando en cuenta lo siguiente:
 El Interés es el gusto que tienes por realizar una actividad, la disposición 
y motivación que tienes hacia ella, el placer que experimentas al 
ejecutarla y el tiempo que le dedicas.
 Es importante que respondas con sinceridad y reflexiones sobre que 
tanto ¿Qué tanto me gustaría…? ó ¿Me veo realizando esta actividad?
 Dicho cuestionario debe ser realizado en un solo momento sin 
interrupciones.
 No hay respuestas correctas o incorrectas.
Lee cada pregunta y contesta con un tache en cada fila conforme a la 
siguiente escala:
4- “Me gusta mucho”
3- “Me gusta algo o en parte”
2- “Me es indiferente, ni me gusta ni me disgusta”
1- “Me desagrada algo o en parte”
0- “Me desagrada mucho o totalmente”
Cada respuesta equivale a un puntaje, siendo el mínimo 0 y el máximo 
24 puntos.
Al final de cada hoja, sumaras el puntaje de cada fila y lo anotaras para 
después compararlo en la escala de puntajes.
 * 
 * 
 */

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class instructions_form_test2 extends StatelessWidget {
  const instructions_form_test2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        AutoSizeText(
          'INSTRUCCIONES',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          textAlign: TextAlign.center,
          maxFontSize: 25,
          minFontSize: 12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              '1. Ahora realizaremos el test de aptitudes.',
              maxLines: 2,
              maxFontSize: 12,
              minFontSize: 6,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            AutoSizeText(
              '• Contesta el cuestionario tomando en cuenta lo '
              'siguiente:',
              maxLines: 2,
              maxFontSize: 12,
              minFontSize: 6,
            ),
            AutoSizeText(
              '''
¡Recuerda que una aptitud es la capacidad o habilidad que posees o puedes adquirir para desempeñarte en una determinada actividad!

Considera que no se te pregunta si la actividad te gusta o no, sino qué tan apto te consideras para desempeñar cada una de ellas.

Es importante que contestes con sinceridad y reflexiones sobre ¿Qué tan apto te consideras para…?

Dicho cuestionario debes realizarlo en un solo momento sin interrupciones.

No hay respuestas correctas o incorrectas.''',
              maxLines: 4,
              maxFontSize: 12,
              minFontSize: 6,
            ),
            AutoSizeText(
              'Lee cada pregunta y contesta con un tache en cada fila conforme '
              'a la siguiente escala:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 3,
              maxFontSize: 12,
              minFontSize: 6,
            ),
            AutoSizeText(
              '4- “Considero ser muy competente”'
              '\n3- “Considero ser competente”'
              '\n2- “Considero ser medianamente competente”'
              '\n1- “Considero ser muy poco competente”'
              '\n0- “Considero ser incompetente”',
              maxLines: 6,
              maxFontSize: 12,
              minFontSize: 6,
            ),
            AutoSizeText(
              'Cada respuesta equivale a un puntaje, siendo el mínimo 0 y el '
              'máximo 24 puntos.',
              maxLines: 3,
              maxFontSize: 12,
              minFontSize: 6,
            ),
            AutoSizeText(
              'Al final de cada hoja, sumaras el puntaje de cada fila y lo '
              'anotaras para después compararlo en la escala de puntajes.',
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontStyle: FontStyle.italic,
              ),
              maxLines: 3,
              maxFontSize: 8,
              minFontSize: 4,
            ),
          ],
        ),
      ],
    );
  }
}
