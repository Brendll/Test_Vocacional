import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:flutter_test_vocacional_1/src/views/form_test/components/welcome_form_test.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';

class FormTestLayout extends StatelessWidget {
  const FormTestLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const cardHeight = 600.0;
    var cardWidth = MediaQuery.of(context).size.width;
    if (ResponsiveDesign().isDesktop(context)) {
      cardWidth = MediaQuery.of(context).size.width * 0.75;
    } else if (ResponsiveDesign().isTablet(context)) {
      cardWidth = MediaQuery.of(context).size.width * 0.85;
    } else if (ResponsiveDesign().isMobile(context)) {
      cardWidth = MediaQuery.of(context).size.width * 0.95;
    }

    return Center(
      child: SizedBox(
        width: cardWidth,
        height: cardHeight,
        child: Card(
          elevation: 5,
          color: const Color.fromARGB(255, 222, 222, 222),
          child: PageView(
            controller: PageController(
              viewportFraction: 0.8,
            ),
            children: const <Widget>[
              WelcomeFormTest(),
            ],
          ),
        ),
      ),
    );
  }
}
