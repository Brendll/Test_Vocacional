import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleComponent extends StatelessWidget {
  const TitleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(children: [
        const Icon(
          CupertinoIcons.doc_text_search,
          color: Colors.black,
        ),
        const SizedBox(width: 10), // Agrega un espacio entre el logo y el texto
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "Test",
              style: TextStyle(
                fontFamily: GoogleFonts.castoro().fontFamily,
                color: Colors.black,
                fontSize: 24,
              ),
              maxLines: 1,
              maxFontSize: 24,
              minFontSize: 14,
            ),
            const SizedBox(
              width: 3,
            ),
            AutoSizeText(
              "Vocacional",
              style: TextStyle(
                fontFamily: GoogleFonts.castoro().fontFamily,
                color: Colors.black,

                fontSize: 30,
                // fontWeight: FontWeight.bold, // Agregando negrita
              ),
              maxLines: 1,
              maxFontSize: 30,
              minFontSize: 20,
            ),
            const SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AutoSizeText(
                  "C.B.T.I.S 61",
                  style: TextStyle(
                    fontFamily: GoogleFonts.castoro().fontFamily,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  maxLines: 1,
                  maxFontSize: 18,
                  minFontSize: 8,
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
