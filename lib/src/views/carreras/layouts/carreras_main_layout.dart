import 'package:flutter/material.dart';

class CarrerasMainLayout extends StatelessWidget {
  const CarrerasMainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/techumbre_cbtis_61-1.webp'),
            ),
          ),
        ),
      ],
    );
  }
}
