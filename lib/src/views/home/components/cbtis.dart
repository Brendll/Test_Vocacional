import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

/// ``[Cbtis]`` - Es un widget que muestra un fondo de pantalla, el cual es de
/// CBTis No. 61. Este widget se ubica en la parte inferior del carousel del
/// imagemes.
class Cbtis extends StatefulWidget {
  /// [Cbtis] es el constructor de la clase Cbtis
  const Cbtis({required this.scrollController, super.key});

  /// ``[scrollController]`` - Es un parámetro de tipo [ScrollController]
  /// que se utiliza para controlar conocer el estado de la barra de
  /// desplazamiento y así poder aplicar una animación en el texto.
  final ScrollController scrollController;
  @override
  State<Cbtis> createState() => _CbtisState();
}

class _CbtisState extends State<Cbtis> {
  late double scaleFactor;
  late double translateFactor = 145;
  @override
  void initState() {
    super.initState();
    scaleFactor = 1.0; // Factor de escala inicial del texto
    widget.scrollController.addListener(_updateScaleFactor);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_updateScaleFactor);
    super.dispose();
  }

  void _updateScaleFactor() {
    setState(() {
      // scaleFactor = (widget.scrollController.offset >= 600)
      //     ? 1
      //     : widget.scrollController.offset * 0.02;

      // translateFactor = (widget.scrollController.offset >= 600)
      //     ? 0
      //     : widget.scrollController.offset * 0.3;
      // Cambia el valor de scaleFactor según la posición del scroll

      if (widget.scrollController.offset >= 180 &&
          widget.scrollController.offset < 600) {
        scaleFactor = 1 / 2 + (widget.scrollController.offset - 170) * 0.02;
        translateFactor = (widget.scrollController.offset - 170) * 0.3;
      } else {}
    });
  }

  // Nuevo parámetro
  @override
  Widget build(BuildContext context) {
    debugPrint(
      'El ofsset: ${widget.scrollController.offset}\n'
      'Factor de escala: $scaleFactor\n'
      'Factor de traslado: $translateFactor',
    );
    return AnimatedBuilder(
      animation: widget.scrollController,
      builder: (context, child) {
        return Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/techumbre_cbtis_61-1.webp',
                ),
                opacity: 10,
                filterQuality: FilterQuality.high,
                matchTextDirection: true,
                colorFilter: ColorFilter.linearToSrgbGamma(),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            child: Center(
              child: Transform.translate(
                offset: Offset(0, translateFactor),
                child: Transform.scale(
                  scale: scaleFactor,
                  child: SizedBox(
                    height: 450,
                    width:
                        (context.watch<ResponsiveDesign>().isDesktop(context))
                            ? context.watch<ResponsiveDesign>().desktopSmall
                            : context.watch<ResponsiveDesign>().mobileNormal,
                    child: AutoSizeText(
                      strutStyle: const StrutStyle(height: 1.2),
                      textAlign: TextAlign.center,
                      'Centro de Bachillerato Tecnológico Industrial y de'
                      ' Servicios No. 61',
                      style: TextStyle(
                        fontFamily: GoogleFonts.castoro().fontFamily,
                        fontSize: 80,
                        color: const Color.fromARGB(246, 0, 0, 0),
                      ),
                      minFontSize: 20,
                      maxFontSize: 100,
                      maxLines: 3,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
