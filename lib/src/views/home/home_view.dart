import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test_vocacional_1/src/controllers/login_controller.dart';
import 'package:flutter_test_vocacional_1/src/services/auth/auth.dart';
import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:flutter_test_vocacional_1/src/views/home/components/cbtis.dart';
import 'package:flutter_test_vocacional_1/src/views/home/components/dgti.dart';
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

  final GlobalKey listViewKeyHome = GlobalKey();

  @override
  Widget build(BuildContext context) {
    rd.initScreen(context);

    return Scaffold(
      drawer: context.watch<ViewMenu>().widgetDrawer,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colores.colorAppBar,
        title: TitleBar(),
        centerTitle: true,
        elevation: 1,
        actionsIconTheme: const IconThemeData(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        actions: [
          if (LoginController().authService.status == AuthStatus.Authenticated)
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                LoginController().signOut(context);
              },
            ),
        ],
      ),
      body: ListView(
        controller: scrollController,
        children: <Widget>[
          const Dgti(),
          const SwiperHome(),
          const SizedBox(height: 50),
          Column(
            children: [
              Cbtis(
                scrollController: scrollController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Centra los logotipos horizontalmente
                children: [
                  Image.asset(
                    'assets/images/rojo.png', // Ruta de tu primer imagen
                    height: 70, // Ajusta la altura según sea necesario
                  ),
                  const SizedBox(width: 20), // Espacio entre los logotipos
                  Image.asset(
                    'assets/images/logo2.png', // Ruta de tu segundo imagen
                    height: 50, // Ajusta la altura según sea necesario
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ), // Espacio entre la imagen del plantel y la sección de oferta
              // educativa
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ofertas Educativas',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(246, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const SizedBox(
                height: 20,
              ), // Agrega espacio entre las ingenierías y los botones
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Acción cuando se presiona el botón de "Iniciar Test"
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue, // Color del texto del botón
                      elevation: 3, // Elevación del botón
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ), // Ajusta el tamaño del botón
                    ),
                    child: const Text('Iniciar Test'),
                  ),
                  const SizedBox(width: 20), // Espacio entre los botones
                  ElevatedButton(
                    onPressed: () {
                      // Acción cuando se presiona el botón de "Registrarse"
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:
                          Colors.green, // Color del texto del botón
                      elevation: 3, // Elevación del botón
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ), // Ajusta el tamaño del botón
                    ),
                    child: const Text('Registrarse'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
