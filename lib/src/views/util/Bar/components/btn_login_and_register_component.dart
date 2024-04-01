import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/views/util/bar/components/btn_bar_component.dart';

class BtnLoginAndRegisterComponent extends StatelessWidget {
  const BtnLoginAndRegisterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: BtnBarComponent(
                routeName: 'login',
                iconData: Icons.login_sharp,
                label: 'Iniciar Sesión')),
        Expanded(
            flex: 2,
            child: BtnBarComponent(
                routeName: 'register',
                iconData: Icons.person_add_alt_1_sharp,
                label: 'Registarme'))
      ],
    );
  }
}
