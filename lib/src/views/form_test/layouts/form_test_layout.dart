import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/form_test/form_test_model.dart';
import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:flutter_test_vocacional_1/src/views/form_test/components/instructions_form_test1.dart';
import 'package:flutter_test_vocacional_1/src/views/form_test/components/instructions_form_test2.dart';
import 'package:flutter_test_vocacional_1/src/views/form_test/components/table_form_test.dart';
import 'package:flutter_test_vocacional_1/src/views/form_test/components/welcome_form_test.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';

class FormTestLayout extends StatefulWidget {
  FormTestLayout({super.key});

  @override
  State<FormTestLayout> createState() => _FormTestLayoutState();
}

class _FormTestLayoutState extends State<FormTestLayout> {
  FormTestModel fTestModel = FormTestModel();
  late List<List<String>> form1;
  late List<List<String>> form2;
  late List<String> preguntasEncabezadoForm1;
  late List<String> preguntasEncabezadoForm2;
  late List<Widget> pages;
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    final fTestModel = FormTestModel();
    form1 = fTestModel.form1;
    form2 = fTestModel.form2;
    preguntasEncabezadoForm1 = fTestModel.preguntasEncabezadoForm1;
    preguntasEncabezadoForm2 = fTestModel.preguntasEncabezadoForm2;

    // Lista del pages:
    final pages = <Widget>[
      const WelcomeFormTest(),
      const instructions_form_test1(),

      // Tema 1
      ...form1.map(
        (formContentInString) => TableFormTest(
          posicionDelTema: 0,
          posicionDeForm: form1.indexOf(formContentInString),
          posicionDePregunta1: 0,
          posicionDePregunta2: 1,
          posicionDePregunta3: 2,
          posicionDePregunta4: 3,
          posicionDePregunta5: 4,
          posicionDePregunta6: 5,
          titleTable: formContentInString[0],
          preguntaEncabezado: preguntasEncabezadoForm1[0],
          respuesta0: preguntasEncabezadoForm1[1],
          respuesta1: preguntasEncabezadoForm1[2],
          respuesta2: preguntasEncabezadoForm1[3],
          respuesta3: preguntasEncabezadoForm1[4],
          respuesta4: preguntasEncabezadoForm1[5],
          pregunta1: formContentInString[1],
          pregunta2: formContentInString[2],
          pregunta3: formContentInString[3],
          pregunta4: formContentInString[4],
          pregunta5: formContentInString[5],
          pregunta6: formContentInString[6],
        ),
      ), // <- Aquí cierras el paréntesis del map

      const instructions_form_test2(),
      // Tema 2
      ...form2.map(
        (formContentInString) => TableFormTest(
          posicionDelTema: 1,
          posicionDeForm: form2.indexOf(formContentInString),
          posicionDePregunta1: 0,
          posicionDePregunta2: 1,
          posicionDePregunta3: 2,
          posicionDePregunta4: 3,
          posicionDePregunta5: 4,
          posicionDePregunta6: 5,
          titleTable: formContentInString[0],
          preguntaEncabezado: preguntasEncabezadoForm2[0],
          respuesta0: preguntasEncabezadoForm2[1],
          respuesta1: preguntasEncabezadoForm2[2],
          respuesta2: preguntasEncabezadoForm2[3],
          respuesta3: preguntasEncabezadoForm2[4],
          respuesta4: preguntasEncabezadoForm2[5],
          pregunta1: formContentInString[1],
          pregunta2: formContentInString[2],
          pregunta3: formContentInString[3],
          pregunta4: formContentInString[4],
          pregunta5: formContentInString[5],
          pregunta6: formContentInString[6],
        ),
      ), // <- Aquí cierras el paréntesis del map
    ]; // <- Aquí cierras el paréntesis de la lista 'pages'

    final ResponsiveDesign rd = ResponsiveDesign();
    //Dibujo del widget
    return SizedBox.expand(
      child: Card(
        elevation: 5,
        color: Colores.colorFondoClaro,
        child: Padding(
          padding: const EdgeInsets.all(10.5),
          child: Column(
            children: [
              /// Paginas
              Expanded(
                flex: 18,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: pages,
                ),
              ),

              // Botón para cambiar de pagina
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          if (_currentPage > 0) {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              //curve: Curves.ease,
                              curve: Curves.easeInOutQuint,
                            );
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: (_currentPage + 1) / pages.length,
                          semanticsValue: (_currentPage + 1).toString(),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _currentPage == 0
                                ? Colors.green.shade600
                                : Colors.green.shade800,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          if (_currentPage < pages.length) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              // curve: Curves.ease,
                              curve: Curves.easeInOutQuint,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
