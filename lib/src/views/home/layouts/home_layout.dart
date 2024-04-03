import 'package:flutter/material.dart';

import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:flutter_test_vocacional_1/src/views/home/components/dgti.dart';
import 'package:flutter_test_vocacional_1/src/views/home/components/title_test.dart';

import 'package:provider/provider.dart';

/// [HomeLayout] - Es el widget que renderiza el layout de la pantalla de inicio
/// Aqui agrupamos tdos los components que hicimos en otros widgets
/// el orden es:
/// ``` dart
/// ///[Dgti] - Este widget component que muestra el nombre de la DGTI con un fondo
/// Container(
///   color: Colores.colorTealDebil,
///   padding: const EdgeInsets.symmetric(
///     vertical: 30,
///   ),
///   child: const Center(
///     child: AutoSizeText(
///       'Dirección General de Educación Tecnológica Industrial y de '
///       'Servicios',
///       style: TextStyle(
///         //fontFamily: GoogleFonts.nunito().fontFamily,
///         fontSize: 31,
///       ),
///       maxLines: 1,
///       maxFontSize: 31,
///       minFontSize: 14,
///     ),
///   ),
/// ),
///
///
/// ///[SizedBox] - es el espacio entre los componentes
/// const SizedBox(height: 50),
///
///
/// ///[TitleTest] - Es el widget que renderiza el titulo del test
/// Column(
///   children: <Widget>[
///     Center(
///       child: SizedBox(
///         width: rdc.screenType == ScreenType.desktop
///             ? (rd.screenWidth(context) * 0.7)
///             : (rd.screenWidth(context) * 0.9),
///         child: const AutoSizeText(
///           textAlign: TextAlign.center,
///           'TEST DE ORIENTACIÓN VOCACIONAL',
///           maxLines: 3,
///           style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold),
///           maxFontSize: 100,
///           minFontSize: 30,
///         ),
///       ),
///     ),
///   ],
/// )
/// ```

class HomeLayout extends StatelessWidget {
  /// [HomeLayout] - Es el constructor de la clase
  HomeLayout({super.key});

  /// [rd] es una instancia de la clase ResponsiveDesign
  /// ```dart
  /// ResponsiveDesign rd  = ResponsiveDesign();
  /// ```
  final ResponsiveDesign rd = ResponsiveDesign();

  /// ``[ScrollController]`` - Es una instancia de la clase [ScrollController]
  /// que se encarga de controlar el desplazamiento de la pantalla
  final ScrollController scrollController = ScrollController();

  /// [listViewKeyHome] - Es una instancia de la clase [GlobalKey] que se
  // encarga de `TODO` el renderizado de la pantalla
  final listViewKeyHome = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: const <Widget>[
        Dgti(),
        TitleTest(),
      ],
    );
  }
}
