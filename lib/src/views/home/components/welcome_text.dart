import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

///
class TextoCuerpo extends StatelessWidget {
  const TextoCuerpo({required this.titlee, required this.texto, super.key});
  final String titlee;
  final String texto;
  @override
  Widget build(BuildContext context) {
    ResponsiveDesign().initScreen(context);
    final rdc = context.watch<ResponsiveDesign>();
    debugPrint(
      'screenTypessss ${context.watch<ResponsiveDesign>().screenType}',
    );
    return Container(
      width: rdc.screenType == ScreenType.desktop ? 800 : 500,
      alignment: Alignment.center,
      child: Column(
        children: [
          AutoSizeText(
            textAlign: TextAlign.center,
            titlee,
            maxLines: 1,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.hindGuntur().fontFamily,
            ),
            maxFontSize: 30,
            minFontSize: 14,
          ),
          const SizedBox(height: 20),
          AutoSizeText(
            textAlign: TextAlign.center,
            texto,
            maxLines: 6,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.hindGuntur().fontFamily,
            ),
            maxFontSize: 20,
          ),
        ],
      ),
    );
  }
}
