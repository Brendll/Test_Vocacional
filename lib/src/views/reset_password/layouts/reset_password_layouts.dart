import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/views/reset_password/components/reset.dart';

class ResetPasswordLayouts extends StatelessWidget {
  const ResetPasswordLayouts({required this.resetPasswordLink, super.key});
  final String resetPasswordLink;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              // TODO : HACER EL COMPONENTE PARA RESETEAR LA CONTRASEÑA
              Center(
                child: SizedBox(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Reset(
                      resetPasswordLink: resetPasswordLink,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
