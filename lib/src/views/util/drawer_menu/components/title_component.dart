import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TitleComponent extends StatelessWidget {
  const TitleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          flex: 2,
          child: Icon(
            CupertinoIcons.doc_text_search,
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 18,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
// Agrega un espacio entre el logo y el texto
              const Expanded(
                flex: 1,
                child: SizedBox(
                  width: 10,
                ),
              ),
              Expanded(
                flex: 5,
                child: AutoSizeText(
                  'Test',
                  style: TextStyle(
                    fontFamily: GoogleFonts.castoro().fontFamily,
                    color: Colors.black,
                    // fontSize: 24,
                  ),
                  maxLines: 1,
                  maxFontSize: 30,
                  minFontSize: 3,
                ),
              ),
              Expanded(
                flex: 8,
                child: AutoSizeText(
                  'Vocacional',
                  style: TextStyle(
                    fontFamily: GoogleFonts.castoro().fontFamily,
                    color: Colors.black,

                    fontWeight: FontWeight.bold, // Agregando negrita
                  ),
                  maxLines: 1,
                  maxFontSize: 40,
                  minFontSize: 4,
                ),
              ),
              Expanded(
                flex: 3,
                child: AutoSizeText(
                  'C.B.T.I.S 61',
                  style: TextStyle(
                    fontFamily: GoogleFonts.castoro().fontFamily,
                    color: Colors.black,
                    // fontSize: 18,
                  ),
                  maxLines: 1,
                  maxFontSize: 20,
                  minFontSize: 2,
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(
                  width: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
