import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_test_vocacional_1/src/controllers/login_controller.dart';
import 'package:flutter_test_vocacional_1/src/routes/router.dart';
import 'package:flutter_test_vocacional_1/src/views/util/Bar/components/btn_login_and_register_component.dart';
import 'package:flutter_test_vocacional_1/src/views/util/bar/components/btn_bar_component.dart';

class NavigationBarMenu extends StatelessWidget {
  const NavigationBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Expanded(
          flex: 4,
          child:
              //espacio
              SizedBox(
            width: 60,
            height: 60,
          ),
        ),

        //botón de inicio
        const Expanded(
          flex: 3,
          child: BtnBarComponent(
            iconData: Icons.home,
            routeName: '',
            label: 'Inicio',
          ),
        ),

        //botón de test
        const Expanded(
          flex: 3,
          child: BtnBarComponent(
            routeName: 'test',
            iconData: Icons.text_snippet_outlined,
            label: 'Iniciar Test',
          ),
        ),

        //botón de acerca de
        const Expanded(
          flex: 3,
          child: BtnBarComponent(
            routeName: 'about',
            iconData: Icons.info,
            label: 'Acerca de',
          ),
        ),

        //Cerrar Sesión
        Expanded(
          flex: 3,
          child: Routes.buildAuthenticatedScreen(
            child1: BtnBarComponent(
              onPressed: () {
                LoginController().signOut(context);
              },
              routeName: '',
              iconData: Icons.exit_to_app,
              label: 'Cerrar Sesión',
            ),
            context: context,
            child2: const BtnLoginAndRegisterComponent(),
          ),
        ),
      ],
    );
  }
}
