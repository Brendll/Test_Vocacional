import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/controllers/login_controller.dart';
import 'package:flutter_test_vocacional_1/src/routes/router.dart';
import 'package:flutter_test_vocacional_1/src/views/util/bar/components/btn_bar_component.dart';

class NavigationBarMenu extends StatelessWidget {
  const NavigationBarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //espacio
        const SizedBox(
          width: 30,
        ),

        //botón de inicio
        Expanded(
          flex: 2,
          child: BtnBarComponent(
            iconData: Icons.home,
            routeName: '',
            label: 'Inicio',
          ),
        ),

        //botón de test
        Expanded(
          flex: 2,
          child: BtnBarComponent(
            routeName: 'test',
            iconData: Icons.text_snippet_outlined,
            label: 'Iniciar Test',
          ),
        ),

        //botón de acerca de
        Expanded(
          flex: 2,
          child: BtnBarComponent(
            routeName: 'about',
            iconData: Icons.info,
            label: 'Acerca de',
          ),
        ),

        //Cerrar Sesión
        Expanded(
          flex: 4,
          child: Routes.buildAuthenticatedScreen(
            BtnBarComponent(
              onPressed: () {
                LoginController().signOut(context);
              },
              routeName: '',
              iconData: Icons.exit_to_app,
              label: 'Cerrar Sesión',
            ),
            context,
          ),
        ),
      ],
    );
  }
}
