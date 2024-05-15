import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/form_test/form_test_model.dart';

import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:flutter_test_vocacional_1/src/views/form_test/layouts/form_test_layout.dart';
import 'package:flutter_test_vocacional_1/src/views/util/Bar/title_bar.dart';
import 'package:flutter_test_vocacional_1/src/views/util/build_widget_screen_type/build_widget_screen_type.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:provider/provider.dart';

/// ``FormTestView`` es una clase que extiende de ``StatelessWidget``.
/// En este se dibuja un widget de pantalla con el formulario del test
/// vocacional.
class FormTestView extends StatelessWidget {
  /// Constructor de la clase ``FormTestView``
  const FormTestView({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveDesign rd = ResponsiveDesign();
    rd.initScreen(context);
    return ChangeNotifierProvider(
      create: (context) => FormTestModel(), // Instancia del modelo

      child: Scaffold(
        drawer: context.watch<ViewMenu>().widgetDrawer,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colores.colorAppBar,
          title: TitleBar(),
          centerTitle: true,
          elevation: 1,
          actionsIconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              height: rd.isDesktop(context)
                  ? 700
                  : rd.isTablet(context)
                      ? rd.screenHeight(context) * 0.9
                      : rd.screenHeight(context) * 1.2,
              width: rd.isDesktop(context)
                  ? 700
                  : rd.isTablet(context)
                      ? rd.screenWidth(context) * 0.9
                      : rd.screenWidth(context) * 1,
              child: FormTestLayout(),
            ),
          ),
        ),
      ),
    );
  }
}
