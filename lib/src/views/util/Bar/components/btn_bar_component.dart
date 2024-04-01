import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/routes/router.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';

class BtnBarComponent extends StatelessWidget {
  const BtnBarComponent(
      {super.key,
      required this.routeName,
      required this.iconData,
      required this.label,
      this.onPressed});
  final IconData iconData;
  final String routeName;
  final String label;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        icon: Icon(iconData, color: Colors.blueGrey),
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(3),
            overlayColor: MaterialStateProperty.all(Colores.colorAppBar),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
            ))),
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          } else {
            Routes.showScreen(context, routeName);
          }
          // Acción cuando se presiona el botón de "Iniciar Test"
        },
        label: Text(
          label,
          style: const TextStyle(color: Colors.black),
        ));
  }
}
