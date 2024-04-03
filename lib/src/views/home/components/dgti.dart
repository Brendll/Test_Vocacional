import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/views/home/home_view.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';

/// [Dgti] es un StatelessWidget que muestra el nombre de la DGTI como un bar
/// header. Este se ubica por debajo del AppBar de la pantalla [HomeView]
class Dgti extends StatelessWidget {
  /// [Dgti] es el constructor de la clase Dgti
  const Dgti({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colores.colorTealDebil,
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: const Center(
        child: AutoSizeText(
          'Dirección General de Educación Tecnológica Industrial y de '
          'Servicios',
          style: TextStyle(
            //fontFamily: GoogleFonts.nunito().fontFamily,
            fontSize: 31,
          ),
          maxLines: 1,
          maxFontSize: 31,
          minFontSize: 14,
        ),
      ),
    );
  }
}
