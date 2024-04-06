import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/routes/router.dart';
import 'package:flutter_test_vocacional_1/src/util/pie_pagina/pie_pagina.dart';

import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:flutter_test_vocacional_1/src/views/home/components/dgti.dart';
import 'package:flutter_test_vocacional_1/src/views/home/components/title_test.dart';
import 'package:flutter_test_vocacional_1/src/views/home/components/welcome_text.dart';
import 'package:flutter_test_vocacional_1/src/views/util/Bar/title_bar.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';

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

class HomeLayout extends StatefulWidget {
  /// [HomeLayout] - Es el constructor de la clase
  HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ResponsiveDesign>().initScreen(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Dgti(),
        ),
        SliverAppBar(
          pinned: true,
          expandedHeight: 60,
          backgroundColor: Colores.colorAppBar,
          title: TitleBar(),
          centerTitle: true,
          elevation: 1,
          actionsIconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        const SliverAnimatedOpacity(
          alwaysIncludeSemantics: true,
          sliver: SliverToBoxAdapter(
            child: TitleTest(),
          ),
          opacity: .8,
          duration: Duration(seconds: 3),
          curve: Easing.legacy,
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 90),
        ),
        const SliverToBoxAdapter(
          child: Center(
            child: TextoCuerpo(
              titlee: 'Descubre tus Intereses y Facilidades con Este Test '
                  'Vocacional',
              texto: 'En este cuestionario, encontrarás la oportunidad de '
                  'explorar tus intereses y habilidades de una manera '
                  'profunda. El propósito es guiarte hacia lo que realmente '
                  'te apasiona y hacia las actividades que encuentras más '
                  'fáciles de realizar. Este ejercicio no solo busca '
                  'ayudarte en la elección de tu camino académico, sino '
                  'también en la planificación de tu futuro. ¡Descubre qué '
                  'te mueve y qué te impulsa a seguir adelante en tu vida '
                  'estudiantil!',
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 90,
          ),
        ),
        const SliverToBoxAdapter(
          child: Center(
            child: TextoCuerpo(
              titlee: 'Iniciar Test de Orientación Vocacional',
              texto: 'Haz clic en el botón de abajo para comenzar el Test de '
                  'Orientación Vocacional',
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 90),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: SizedBox(
              width: 150,
              child: TextButton(
                onPressed: () => Routes.showScreen(context, 'test'),
                child: const Text('Iniciar Test'),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Center(child: PiePagina()),
        ),
      ],
    );
  }
}
