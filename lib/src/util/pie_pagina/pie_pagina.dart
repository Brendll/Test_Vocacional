import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/views/home/layouts/home_layout.dart';

class PiePagina extends StatelessWidget {
  const PiePagina({super.key});

  @override
  Widget build(BuildContext context) {
    return // Créditos del pie de página de la aplicación
        Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: AutoSizeText.rich(
        TextSpan(
          children: [
            const TextSpan(
              text: '© 2024 Brenda Luna Luna. Todos los derechos reservados.',
              style: TextStyle(color: Colors.black, fontSize: 8),
            ),
            const TextSpan(
              text: ' Versión: 1.0.1',
              style: TextStyle(color: Colors.black, fontSize: 8),
            ),
            TextSpan(
              text: ' Ver licencias del software',
              style: TextStyle(
                  color: Colors.blue.shade900,
                  decorationStyle: TextDecorationStyle.dotted,
                  fontSize: 8),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  showDialog(
                    context: context,
                    builder: (_) => const AboutDialog(
                      applicationName: 'TEST ORIENTACIÓN VOCACIONAL',
                      applicationVersion: 'Versión: 1.0.0',
                      applicationIcon: Icon(Icons.credit_card),
                      applicationLegalese:
                          '© 2024 Brenda Luna Luna. Todos los derechos reservados.',
                      children: [
                        SizedBox(height: 100),
                        Text('Esta aplicación es de uso libre.'),
                        SizedBox(height: 10),
                        Text('El test Fue hecho por: ')
                      ],
                    ),
                  );
                },
            ),
          ],
        ),
        maxLines: 3,
      ),
    );
  }
}
