import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/services/auth/auth.dart';
import 'package:flutter_test_vocacional_1/src/views/Register/register_view.dart';
import 'package:flutter_test_vocacional_1/src/views/about/about_view.dart';
import 'package:flutter_test_vocacional_1/src/views/home/home_view.dart';
import 'package:flutter_test_vocacional_1/src/views/login/login_view.dart';

import 'package:provider/provider.dart';

class Routes {
  static const String initialRoute = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/about':
        return MaterialPageRoute(builder: (_) => AboutView());
      /*case '/add_incidents':
        return _checkAuthAndNavigate(
          settings,
          AddIncidents(),
        );*/
      case '/login':
        return _checkAuthAndNavigate(settings, LoginView());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterView());
      /*case '/tutorial':
        return _checkAuthAndNavigate(
          settings,
          const Tutorial(),
        );*/

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
      Navigator.of(context).popAndPushNamed('/$routeName');
    }
  }

  static Route<dynamic> _checkAuthAndNavigate(
    RouteSettings settings,
    Widget page,
  ) {
    return MaterialPageRoute(
      builder: (context) {
        final authService = Provider.of<AuthService>(context, listen: true);
        switch (authService.status) {
          case AuthStatus.Uninitialized:
            return HomeView();
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
