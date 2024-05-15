import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/controllers/login_controller.dart';
import 'package:flutter_test_vocacional_1/src/routes/router.dart';
import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:flutter_test_vocacional_1/src/views/util/drawer_menu/components/title_component.dart';

/// [DrawerMenu] es el menu en drawer de la aplicación.
///
/// Cuando la PWA esté en su versión mobile, entonces esta clase será
/// renderizada para poder visualizar un menu lateral.
///
class DrawerMenu extends StatelessWidget {
  /// [DrawerMenu] es el constructor de la clase DrawerMenu
  DrawerMenu({super.key});

  /// uno de los parametros de esta clase son ``[colores]``
  final Colores colores = Colores();

  /// ``[rd]`` es una instancia de la clase ``ResponsiveDesign``
  final ResponsiveDesign rd = ResponsiveDesign();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      elevation: 3,
      width: rd.isMobile(context)
          ? rd.mobileSmall * .74
          : rd.isTablet(context)
              ? rd.tabletExtraLarge * .4
              : 0,
      child: SingleChildScrollView(
        child: ColoredBox(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(40),
                duration: Duration(seconds: 1),
                curve: Easing.emphasizedDecelerate,
                decoration: BoxDecoration(
                  color: Colores.colorFondoDrawerHeader,
                ),
                child:
                    SizedBox(width: double.infinity, child: TitleComponent()),
              ),
              ListTile(
                title: const Text('Inicio'),
                leading: const Icon(Icons.home),
                onTap: () => Routes.showScreen(context, ''),
                style: ListTileStyle.drawer,
              ),
              ListTile(
                title: const Text('Iniciar Test'),
                leading: const Icon(Icons.text_snippet),
                onTap: () => Routes.showScreen(context, 'test'),
                style: ListTileStyle.drawer,
              ),
              ListTile(
                title: const Text('Acerca de'),
                leading: const Icon(Icons.info),
                onTap: () => Routes.showScreen(context, 'about'),
                style: ListTileStyle.drawer,
              ),
              Routes.buildAuthenticatedScreen(
                child1: ListTile(
                  title: const Text('Cerrar sesión'),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () => LoginController().signOut(context),
                  style: ListTileStyle.drawer,
                ),
                context: context,
                child2: ListTile(
                  title: const Text('Iniciar sesión'),
                  leading: const Icon(Icons.login),
                  onTap: () => Routes.showScreen(context, 'login'),
                  style: ListTileStyle.drawer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
