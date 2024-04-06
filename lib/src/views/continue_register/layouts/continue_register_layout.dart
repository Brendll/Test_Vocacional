import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_vocacional_1/src/controllers/continue_register_controller/continue_register_controller.dart';
import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:flutter_test_vocacional_1/src/views/continue_register/components/birthday.dart';
import 'package:flutter_test_vocacional_1/src/views/continue_register/components/curp.dart';
import 'package:flutter_test_vocacional_1/src/views/continue_register/components/last_name_m.dart';
import 'package:flutter_test_vocacional_1/src/views/continue_register/components/last_name_p.dart';
import 'package:flutter_test_vocacional_1/src/views/continue_register/components/name_field.dart';
import 'package:flutter_test_vocacional_1/src/views/continue_register/components/seleccionar_especialidad.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:google_fonts/google_fonts.dart';

/// Widget para el layout de continuar el registro
class ContinueRegisterLayout extends StatelessWidget {
  /// En el constructo de este widget se asigna la clave de formulario
  /// @param ``formKey`` - Clave de formulario
  ContinueRegisterLayout({required this.formKey, super.key});

  /// Clave de formulario
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double countHeight = 900;
    if (ResponsiveDesign().isDesktop(context)) {
      countHeight = 900;
    } else {
      if (ResponsiveDesign().isTablet(context)) {
        countHeight = 950;
      } else if (ResponsiveDesign().isMobile(context)) {
        countHeight = 1000;
      }
    }

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        //height: double.maxFinite,
        child: Column(
          children: <Widget>[
            // TODO : HACER EL COMPONENTE PARA CONTINUAR EL REGISTRO
            SizedBox(
              width: 600,
              height: countHeight,
              child: Center(
                child: Card(
                  color: Colores.colorFondoDrawerHeader,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        AutoSizeText(
                          textAlign: TextAlign.center,
                          'Continuar con el registro'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: GoogleFonts.oswald().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colores.colorFondoClaro,
                          ),
                          maxFontSize: 50,
                          minFontSize: 20,
                          maxLines: 2,
                        ),
                        Form(
                          key: formKey, // Asigna la clave de formulario al
                          //widget de
                          //formulario
                          child: Column(
                            children: [
                              // Agrega tus campos de entrada aquí
                              const Wrap(
                                runSpacing: 8,
                                spacing: 10,
                                //textDirection: TextDirection.ltr,
                                //clipBehavior: Clip.antiAliasWithSaveLayer,
                                // crossAxisCount: countField,
                                // //physics: const NeverScrollableScrollPhysics(),
                                // shrinkWrap: true,
                                // crossAxisSpacing: 20,
                                // primary: false,
                                // semanticChildCount: 1,
                                // mainAxisSpacing: 25,
                                // childAspectRatio: countChildAspectRatio,
                                // padding: const EdgeInsets.all(20),
                                children: [
                                  // EmailField(),
                                  Expanded(child: NameField()),
                                  Expanded(child: LastNameP()),
                                  Expanded(child: LastNameM()),
                                  Expanded(child: Curp()),
                                  Expanded(child: Birthday()),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SeleccionarEspecialidad(
                                especialidades: [
                                  'Administración de Recursos Humanos',
                                  'Electrónica',
                                  'Logística',
                                  'Mantenimiento Automotriz',
                                  'Programación',
                                  'Puericultura',
                                  'Transformación de Plásticos',
                                ],
                              ),

                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  // Valida y envía el formulario
                                  if (formKey.currentState!.validate()) {
                                    // Si el formulario es válido, ejecuta la
                                    // lógica de envío aquí Por ejemplo, puedes
                                    // guardar los datos del formulario en una
                                    // base de datos.
                                    await Future<void>.delayed(Duration.zero);

                                    await ContinueRegisterController()
                                        .dataCompleteUser(context);
                                  }
                                },
                                child: const Text('Enviar'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
