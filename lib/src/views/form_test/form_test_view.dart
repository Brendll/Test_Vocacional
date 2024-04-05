import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/routes/router.dart';
import 'package:flutter_test_vocacional_1/src/views/form_test/layouts/form_test_layout.dart';
import 'package:flutter_test_vocacional_1/src/views/login/login_view.dart';

/// ``FormTestView`` es una clase que extiende de ``StatelessWidget``.
/// En este se dibuja un widget de pantalla con el formulario del test
/// vocacional.
class FormTestView extends StatelessWidget {
  /// Constructor de la clase ``FormTestView``
  const FormTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FormTestLayout(),
      ),
    );
  }
}
