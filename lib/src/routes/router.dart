import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/services/auth/auth.dart';
import 'package:flutter_test_vocacional_1/src/views/about/about_view.dart';
import 'package:flutter_test_vocacional_1/src/views/carreras/carreras_view.dart';
import 'package:flutter_test_vocacional_1/src/views/continue_register/continue_register_view.dart';
import 'package:flutter_test_vocacional_1/src/views/form_test/form_test_view.dart';
import 'package:flutter_test_vocacional_1/src/views/home/home_view.dart';
import 'package:flutter_test_vocacional_1/src/views/login/login_view.dart';
import 'package:flutter_test_vocacional_1/src/views/util/bar/components/btn_login_and_register_component.dart';
import 'package:provider/provider.dart';

/// Esta clase es la clase encargada de manejar las rutas de la aplicación
///
/// [Routes] es una clase que extiende de BaseController
/// Uno de los parametros de la clase es la ruta inicial de la aplicación es
/// [ruta] que es una cadena de texto que representa la ruta inicial de la
/// aplicación.
class Routes {
  /// La ruta inicial de la aplicación es [ruta] que es una cadena de texto que
  /// representa la ruta inicial de la aplicación.
  String ruta = '';

  /// La ruta inicial de la aplicación es [initialRoute] que es una cadena de
  /// texto
  static const String initialRoute = '/';

  /// La ruta inicial de la aplicación es [initialRoute] que es una cadena de
  static Map<String, Widget Function(BuildContext)> routes = {
    initialRoute: (_) => HomeView(),
    '/about': (_) => const AboutView(),
    '/test': (_) => const FormTestView(),
    '/login': (_) => LoginView(),
    //'/register': (_) => const RegisterView(),
    '/continue-register/': (_) => const ContinueRegisterView(),
    '/carreras': (_) => CarrerasView(),
  };

  /// [generateRoute] es una función que se encarga de manejar las rutas de la
  /// aplicación
  /// @param RouteSettings settings es una variable que contiene la
  /// configuración de la ruta
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/about':
        return MaterialPageRoute(builder: (_) => const AboutView());
      case '/test':
        return _checkAuthAndNavigate(const FormTestView());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());
      //case '/register':
      //return MaterialPageRoute(builder: (_) => const RegisterView());
      case '/continue-register':
        return _checkAuthAndNavigate(
          const ContinueRegisterView(),
        );
      case '/carreras':
        // Devuelve una ruta de material con CarrerasView como su constructor
        return MaterialPageRoute(
          builder: (_) => CarrerasView(),
        );
      case '/error-404':
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Error 404'),
            ),
            body: Center(
              child: Text('Ruta no encontrada: ${settings.name}'),
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Error 404'),
            ),
            body: Builder(
              builder: (context) {
                Future.delayed(const Duration(seconds: 5), () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Ruta no encontrada: ${settings.name}'),
                      onVisible: () =>
                          Navigator.of(context).pushNamed('/error-404'),
                    ),
                  );
                });

                return Center(
                  child: Text('Ruta no encontrada: ${settings.name}'),
                );
              },
            ),
          ),
        );
    }
  }

  /// [showScreen] - Es la función encargada de navegar a una ruta de la
  /// aplicación.
  static void showScreen(
    BuildContext context,
    String routeName,
  ) {
    if (routeName == '/login') {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => LoginView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(31, -3);
            const end = Offset.zero;
            const curve = Curves.easeInOutCubicEmphasized;
            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
    } else {
      Navigator.of(context).pushNamed('/$routeName');
      // Actualizar la URL en la barra de direcciones del navegador
      try {
        js.context.callMethod('history.pushState', ['/$routeName']);
        js.context.callMethod('history.replaceState', ['/$routeName']);
      } catch (e) {
        throw Exception(
          'Error al actualizar la URL en la barra de direcciones del '
          'navegador: $e',
        );
      }
    }
  }

  static Route<dynamic> _checkAuthAndNavigate(
    Widget page,
  ) {
    return MaterialPageRoute(
      builder: (context) {
        switch (context.watch<AuthService>().status) {
          case AuthStatus.Uninitialized:
            return HomeView();
          case AuthStatus.Authenticating:
            // Muestra un indicador de carga mientras se determina el estado
            //de autenticación
            return _buildLoadingScreen();
          case AuthStatus.Authenticated:
            // Si el usuario está autenticado, muestra la página solicitada
            return page;
          case AuthStatus.Unauthenticated:
            // Si el usuario no está autenticado, redirige a la página de
            //inicio de sesión
            return LoginView();
        }
      },
    );
  }

  /// [buildAuthenticatedScreen] - Es la función encargada de construir el
  ///  Widget si el usuario está autenticado, sino esta autenticado, entonces
  /// construye el widget [BtnLoginAndRegisterComponent]
  static Widget buildAuthenticatedScreen(Widget child, BuildContext context) {
    switch (context.watch<AuthService>().status) {
      case AuthStatus.Uninitialized:
        return const BtnLoginAndRegisterComponent();

      // Si el usuario está autenticado, muestra la página solicitada
      case AuthStatus.Authenticated:
        return child;

      // Si el usuario no está autenticado, redirige a la página de inicio de
      // sesión
      case AuthStatus.Unauthenticated:
        return const BtnLoginAndRegisterComponent();

      case AuthStatus.Authenticating:
        return const CircularProgressIndicator.adaptive();
      // default:
      //   return const BtnLoginAndRegisterComponent();
    }
  }

  static Widget _buildLoadingScreen() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  /// [_buildErrorScreen] - Es la función encargada de construir el widget
  ///  [Scaffold] con el estado de autenticación no válido
  // ignore: unused_element
  static Widget _buildErrorScreen() {
    return const Scaffold(
      body: Center(
        child: Text('Error: Estado de autenticación no válido'),
      ),
    );
  }
}
