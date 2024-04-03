import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

/// ``TitleTest`` - Es una clase que se encarga de renderizar el titulo del test
class TitleTest extends StatelessWidget {
  /// [TitleTest] es el constructor de la clase TitleTest
  const TitleTest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<ResponsiveDesign>().initScreen(context);

    final rdc = context.watch<ResponsiveDesign>();
    //final rd = ResponsiveDesign();
    debugPrint('screenType ${context.watch<ResponsiveDesign>().screenType}');
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/title_fondo.jpg'),
          opacity: 1.2,
          fit: BoxFit.cover,
          alignment: Alignment.center,

          // centerSlice: Rect.largest,
          // filterQuality: FilterQuality.medium,
        ),
      ),
      padding: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: rdc.screenType == ScreenType.desktop ? 280 : 450,
      child: Column(
        children: [
          SizedBox(
            width: rdc.screenType == ScreenType.desktop
                ? 800
                : rdc.screenType == ScreenType.tablet
                    ? 600
                    : 300,
            child: AutoSizeText(
              textAlign: TextAlign.center,
              'TEST DE ORIENTACIÓN VOCACIONAL',
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
            width: context.watch<ResponsiveDesign>().screenType ==
                    ScreenType.desktop
                ? 700
                : rdc.screenType == ScreenType.tablet
                    ? 500
                    : 300,
            child: AutoSizeText(
              textAlign: TextAlign.center,
              'Explora tu verdadera vocación mediante un test de '
              'orientación vocacional, que te ayudará a descubrir qué '
              'especialidad estudiar.',
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
    );
  }
}
