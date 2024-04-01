import 'package:flutter/material.dart';

import 'package:flutter_test_vocacional_1/src/services/auth/auth.dart';
import 'package:flutter_test_vocacional_1/src/views/about/about_view.dart';
import 'package:flutter_test_vocacional_1/src/views/carreras/carreras_view.dart';
import 'package:flutter_test_vocacional_1/src/views/continue_register/continue_register_view.dart';
import 'package:flutter_test_vocacional_1/src/views/form_test/form_test_view.dart';
import 'package:flutter_test_vocacional_1/src/views/home/home_view.dart';
import 'package:flutter_test_vocacional_1/src/views/login/login_view.dart';
import 'package:flutter_test_vocacional_1/src/views/util/bar/components/btn_login_and_register_component.dart';
import 'dart:js' as js;

import 'package:provider/provider.dart';

class Routes {
  var ruta = '';
  static const String initialRoute = '/';

  static Map<String, Widget Function(BuildContext)> routes = {
    initialRoute: (_) => const HomeView(),
    '/about': (_) => const AboutView(),
    '/test': (_) => const FormTestView(),
    '/login': (_) => LoginView(),
    //'/register': (_) => const RegisterView(),
    '/continue-register/': (_) => const ContinueRegisterView(),
    '/carreras': (_) => const CarrerasView(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeView());
      case '/about':
        return MaterialPageRoute(builder: (_) => const AboutView());
      case '/test':
        return _checkAuthAndNavigate(const FormTestView());
      case '/login':
        return _checkAuthAndNavigate(LoginView());
      //case '/register':
      //return MaterialPageRoute(builder: (_) => const RegisterView());
      case '/continue-register/':
        return _checkAuthAndNavigate(
          const ContinueRegisterView(),
        );
      case '/carreras':
        // Devuelve una ruta de material con CarrerasView como su constructor
        return MaterialPageRoute(
          builder: (_) => const CarrerasView(),
        );

      default:
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
    }
  }

  static void showScreen(BuildContext context, String routeName) {
    if (routeName == "/login") {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => LoginView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(31.0, -3.0);
            var end = Offset.zero;
            var curve = Curves.easeInOutCubicEmphasized;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
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
            'Error al actualizar la URL en la barra de direcciones del navegador: $e');
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
            return const HomeView();
          case AuthStatus.Authenticating:
            // Muestra un indicador de carga mientras se determina el estado de autenticación
            return _buildLoadingScreen();
          case AuthStatus.Authenticated:
            // Si el usuario está autenticado, muestra la página solicitada
            return page;
          case AuthStatus.Unauthenticated:
            // Si el usuario no está autenticado, redirige a la página de inicio de sesión
            return LoginView();
          default:
            // En caso de un estado no válido, muestra un mensaje de error
            return _buildErrorScreen();
        }
      },
    );
  }

  static Widget buildAuthenticatedScreen(Widget child, BuildContext context) {
    switch (context.watch<AuthService>().status) {
      case AuthStatus.Uninitialized:
        return const BtnLoginAndRegisterComponent();

      case AuthStatus.Authenticated:
        // Si el usuario está autenticado, muestra la página solicitada
        return child;
      case AuthStatus.Unauthenticated:
        // Si el usuario no está autenticado, redirige a la página de inicio de sesión
        return const BtnLoginAndRegisterComponent();
      default:
        return const BtnLoginAndRegisterComponent();
    }
  }

  static Widget _buildLoadingScreen() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static Widget _buildErrorScreen() {
    return const Scaffold(
      body: Center(
        child: Text('Error: Estado de autenticación no válido'),
      ),
    );
  }
}
