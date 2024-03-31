import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/app/app_model.dart';
import 'package:flutter_test_vocacional_1/src/controllers/base_controller.dart'
    as controller;
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:flutter_test_vocacional_1/src/routes/routes.dart';
import 'package:flutter_test_vocacional_1/src/services/auth/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<String> images = [
    "assets/images/programacion.jpeg",
    "assets/images/electronica.jpeg",
    "assets/images/rh.jpeg",
    "assets/images/robotica.jpeg",
    "assets/images/puericultura.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppModel>(create: (context) => AppModel()),
          ChangeNotifierProvider<UserModel>(create: (context) => UserModel()),
          ChangeNotifierProvider<AuthService>(
              create: (context) => AuthService()),
        ],
        child: Builder(builder: (context) {
          controller.init(context);

          return MaterialApp(
            title: 'CBTIS No.61',
            debugShowMaterialGrid: false,
            debugShowCheckedModeBanner: false,
            showSemanticsDebugger: false,
            theme: ThemeData(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              brightness: Brightness.light,
              primaryColor: const Color.fromARGB(0, 214, 219, 137),
              colorScheme: const ColorScheme.light(
                  primary: Color.fromARGB(0, 192, 32, 32)),
            ),
            initialRoute: Routes.initialRoute,
            onGenerateRoute: Routes.generateRoute,
          );
        }));
  }
}
