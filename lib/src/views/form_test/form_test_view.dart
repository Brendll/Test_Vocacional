import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/routes/router.dart';
import 'package:flutter_test_vocacional_1/src/views/login/login_view.dart';

class FormTestView extends StatelessWidget {
  const FormTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
            body: const Center(
          child: Text('Form Test'),
        ));
      },
    );
  }
}
