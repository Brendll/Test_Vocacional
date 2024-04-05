import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class WelcomeFormTest extends StatelessWidget {
  const WelcomeFormTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        AutoSizeText(
          'BIENVENIDOS',
          style: TextStyle(
            fontSize: 50,
          ),
          maxLines: 1,
          textAlign: TextAlign.center,
          maxFontSize: 50,
          minFontSize: 20,
        ),
        AutoSizeText(
          'El siguiente test tiene la finalidad de ayudarte a '
          'identificar intereses que te apasionan, así como actividades que '
          'se te facilitan realizar y pudieras continuar haciendo; con este '
          'ejercicio se busca facilitar la planeación en la continuación de '
          'la vida académica.',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
          maxLines: 4,
          maxFontSize: 20,
          minFontSize: 10,
        ),
        AutoSizeText(
          '¡Comencemos con el test!',
        ),
      ],
    );
  }
}
