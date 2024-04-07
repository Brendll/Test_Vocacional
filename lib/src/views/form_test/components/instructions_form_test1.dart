/**
 * INSTRUCCIONES
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

class instructions_form_test1 extends StatelessWidget {
  const instructions_form_test1({Key? key}) : super(key: key);

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
              '• Contesta el cuestionario tomando en cuenta lo '
              'siguiente:',
              maxLines: 2,
              maxFontSize: 12,
              minFontSize: 6,
            ),
            AutoSizeText(
              '• El Interés es el gusto que tienes por realizar una actividad, '
              'la disposición y motivación que tienes hacia ella, el placer que '
              'experimentas al ejecutarla y el tiempo que le dedicas.',
              maxLines: 4,
              maxFontSize: 12,
              minFontSize: 6,
            ),
            AutoSizeText(
              '• Es importante que respondas con sinceridad y reflexiones sobre '
              'que tanto ¿Qué tanto me gustaría…? ó ¿Me veo realizando esta '
              'actividad?',
              maxLines: 4,
              maxFontSize: 12,
              minFontSize: 6,
            ),
            AutoSizeText(
              '• Dicho cuestionario debe ser realizado en un solo momento sin '
              'interrupciones.',
              maxLines: 2,
              maxFontSize: 12,
              minFontSize: 6,
            ),
            AutoSizeText(
              '• No hay respuestas correctas o incorrectas.',
              maxLines: 2,
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
              '4- “Me gusta mucho'
              '\n3- “Me gusta algo o en parte”'
              '\n2- “Me es indiferente, ni me gusta ni me disgusta”'
              '\n1- “Me desagrada algo o en parte”'
              '\n0- “Me desagrada mucho o totalmente”',
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
