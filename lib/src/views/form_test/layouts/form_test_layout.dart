import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/form_test/form_test_model.dart';
import 'package:flutter_test_vocacional_1/src/views/form_test/components/instructions_form_test1.dart';
import 'package:flutter_test_vocacional_1/src/views/form_test/components/instructions_form_test2.dart';
import 'package:flutter_test_vocacional_1/src/views/form_test/components/table_form_test.dart';
import 'package:flutter_test_vocacional_1/src/views/form_test/components/welcome_form_test.dart';

class FormTestLayout extends StatefulWidget {
  FormTestLayout({super.key});

  @override
  State<FormTestLayout> createState() => _FormTestLayoutState();
}

class _FormTestLayoutState extends State<FormTestLayout> {
  FormTestModel fTestModel = FormTestModel();

  late List<List<String>> form1 = fTestModel.form1;
  late List<List<String>> form2 = fTestModel.form2;
  late List<String> preguntasEncabezadoForm1 =
      fTestModel.preguntasEncabezadoForm1;
  late List<String> preguntasEncabezadoForm2 =
      fTestModel.preguntasEncabezadoForm2;

  List<Widget> pages = <Widget>[
    const WelcomeFormTest(),
    const instructions_form_test1(),
  ]; // <- Aquí cierras el paréntesis de la lista 'pages'

  late PageController _pageController;
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Card(
        elevation: 5,
        color: const Color.fromARGB(255, 222, 222, 222),
        child: Padding(
          padding: const EdgeInsets.all(10.5),
          child: Column(
            children: [
              /// Paginas
              SizedBox(
                width: double.infinity,
                height: 450,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    pages.iterator.current,

                    // Tema 1
                    ...form1.map(
                      (formContentInString) => TableFormTest(
                        posicionDelTema: 0,
                        posicionDeForm: form1.indexOf(formContentInString),
                        posicionDePregunta1: 1,
                        posicionDePregunta2: 2,
                        posicionDePregunta3: 3,
                        posicionDePregunta4: 4,
                        posicionDePregunta5: 5,
                        posicionDePregunta6: 6,
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
                        posicionDePregunta1: 1,
                        posicionDePregunta2: 2,
                        posicionDePregunta3: 3,
                        posicionDePregunta4: 4,
                        posicionDePregunta5: 5,
                        posicionDePregunta6: 6,
                        titleTable: formContentInString[0],
                        preguntaEncabezado: preguntasEncabezadoForm2[0],
                        respuesta0: preguntasEncabezadoForm2[1],
                        respuesta1: preguntasEncabezadoForm2[2],
                        respuesta2: preguntasEncabezadoForm2[3],
                        respuesta3: preguntasEncabezadoForm2[4],
                        respuesta4: preguntasEncabezadoForm2[5],
                        pregunta1: formContentInString[7],
                        pregunta2: formContentInString[8],
                        pregunta3: formContentInString[9],
                        pregunta4: formContentInString[10],
                        pregunta5: formContentInString[11],
                        pregunta6: formContentInString[12],
                      ),
                    ), // <- Aquí cierras el paréntesis del map
                  ],
                ),
              ),

              // Botón para cambiar de pagina
              SizedBox(
                height: 150,
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
                            curve: Curves.ease,
                          );
                        }
                      },
                    ),
                    const SizedBox(width: 20),
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
                        if (_currentPage < 2) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        }
                      },
                    ),
                  ],
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
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    form1 = fTestModel.form1;
    form2 = fTestModel.form2;
    _pageController = PageController(initialPage: _currentPage);
  }
}
