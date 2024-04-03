import 'package:flutter/material.dart';
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
      elevation: 3,
      width: rd.isMobile(context)
          ? rd.mobileExtraLarge * .74
          : rd.isTablet(context)
              ? rd.tabletExtraLarge * .5
              : 0,
      child: SingleChildScrollView(
        child: ColoredBox(
          color: Colores.colorFondoDrawer,
          child: Column(
            children: [
              const DrawerHeader(
                margin: EdgeInsets.zero,
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
            ],
          ),
        ),
      ),
    );
  }
}
