import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/views/reset_password/layouts/reset_password_layouts.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({required this.resetPasswordLink, super.key});
  final String resetPasswordLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.lerp(Colores.colorTealFuerte, Colors.white, 0.5),
      body: ResetPasswordLayouts(
        resetPasswordLink: resetPasswordLink,
      ),
    );
  }
}
