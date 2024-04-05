import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test_vocacional_1/src/controllers/login_controller.dart';
import 'package:flutter_test_vocacional_1/src/services/auth/auth.dart';
import 'package:flutter_test_vocacional_1/src/util/pie_pagina/pie_pagina.dart';
import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:flutter_test_vocacional_1/src/views/home/components/cbtis.dart';
import 'package:flutter_test_vocacional_1/src/views/home/components/dgti.dart';
import 'package:flutter_test_vocacional_1/src/views/home/components/title_test.dart';
import 'package:flutter_test_vocacional_1/src/views/home/layouts/home_layout.dart';
import 'package:flutter_test_vocacional_1/src/views/home/layouts/swiper_home.dart';
import 'package:flutter_test_vocacional_1/src/views/util/bar/title_bar.dart';
import 'package:flutter_test_vocacional_1/src/views/util/build_widget_screen_type/build_widget_screen_type.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

/// [HomeView] es la clase que representa la pantalla principal de la aplicación
/// Esta clase es el primer Scaffoll en renderizarse.
class HomeView extends StatelessWidget {
  /// [HomeView] es el constructor de la clase HomeView
  HomeView({super.key});

  /// [rd] es una instancia de la clase ResponsiveDesign
  /// ```dart
  /// ResponsiveDesign rd  = ResponsiveDesign();
  /// ```
  final ResponsiveDesign rd = ResponsiveDesign();

  /// ``[ScrollController]`` - Es una instancia de la clase [ScrollController]
  /// que se encarga de controlar el desplazamiento de la pantalla
  final ScrollController scrollController = ScrollController();

  /// [listViewKeyHome] - Es una instancia de la clase [GlobalKey] que se
  /// encarga
  final listViewKeyHome = GlobalKey();

  @override
  Widget build(BuildContext context) {
    rd.initScreen(context);
    return Scaffold(
      drawer: context.watch<ViewMenu>().widgetDrawer,
      body: HomeLayout(),
    );
  }
}
//247 131 7301
