import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:flutter_test_vocacional_1/src/views/form_test/components/welcome_form_test.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:provider/provider.dart';

class FormTestLayout extends StatefulWidget {
  FormTestLayout({super.key});

  @override
  State<FormTestLayout> createState() => _FormTestLayoutState();
}

class _FormTestLayoutState extends State<FormTestLayout> {
  List<Widget> pages = const <Widget>[
    WelcomeFormTest(),
    WelcomeFormTest(),
    WelcomeFormTest(),
  ];
  late PageController _pageController;
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

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
                height: 300,
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
              SizedBox(
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
}
