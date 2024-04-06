import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/routes/router.dart';
import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:flutter_test_vocacional_1/src/views/form_test/layouts/form_test_layout.dart';
import 'package:flutter_test_vocacional_1/src/views/login/login_view.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            height: 400,
            width: 300,
            child: FormTestLayout(),
          ),
        ),
      ),
    );
  }
}
