import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TitleTest extends StatelessWidget {
  const TitleTest({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ResponsiveDesign>().initScreen(context);
    final rdc = context.watch<ResponsiveDesign>();

    return Stack(
      children: [
        Image.asset(
          'images/title_fondo.jpg',
          fit: BoxFit.cover,
          alignment: Alignment.center,
          height: rdc.screenType == ScreenType.desktop ? 280 : 450,
          width: double.infinity,
        ),
        SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.down,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: rdc.screenType == ScreenType.desktop ? 280 : 450,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: rdc.screenType == ScreenType.desktop ? 800 : 300,
                        child: AutoSizeText(
                          'TEST DE ORIENTACIÓN VOCACIONAL',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.hindGuntur().fontFamily,
                            color: Colors.white,
                          ),
                          maxFontSize: 60,
                          minFontSize: 25,
                        ),
                      ),
                      SizedBox(
                        width: rdc.screenType == ScreenType.desktop ? 700 : 300,
                        child: AutoSizeText(
                          'Explora tu verdadera vocación mediante un test de orientación vocacional, que te ayudará a descubrir qué especialidad estudiar.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.hindMadurai().fontFamily,
                            color: Colors.white,
                          ),
                          maxLines: 4,
                          maxFontSize: 30,
                          minFontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Agrega más widgets aquí si es necesario
            ],
          ),
        ),
      ],
    );
  }
}
