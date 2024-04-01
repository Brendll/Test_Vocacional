import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/app/app_model.dart';
import 'package:flutter_test_vocacional_1/src/controllers/base_controller.dart'
    as controller;
import 'package:flutter_test_vocacional_1/src/models/carreers/carreras_model.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:flutter_test_vocacional_1/src/routes/router.dart';
import 'package:flutter_test_vocacional_1/src/services/auth/auth.dart';
import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:flutter_test_vocacional_1/src/views/util/build_widget_screen_type/build_widget_screen_type.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
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
    //controller.init(context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppModel>(create: (context) => AppModel()),
          ChangeNotifierProvider<UserModel>(create: (context) => UserModel()),
          ChangeNotifierProvider<AuthService>(
              create: (context) => AuthService()),
          ChangeNotifierProvider<ResponsiveDesign>(
            create: (context) => ResponsiveDesign(),
          ),
          ChangeNotifierProvider<ViewMenu>(
            create: (context) => ViewMenu(),
          ),
          ChangeNotifierProvider<CarrerasModel>(
            create: (context) => CarrerasModel(),
          ),
          Provider<Routes>(
              create: (_) => Routes()), // Asegúrate de proporcionar Routes aquí
        ],
        child: Builder(builder: (context) {
          controller.init(context);

          return MaterialApp(
            title: 'CBTIS No.61',
            debugShowMaterialGrid: false,
            debugShowCheckedModeBanner: false,
            showSemanticsDebugger: false,
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: Colores.colorPrimario,
              scaffoldBackgroundColor: Colores.colorFondoClaro,
              primarySwatch: Colors.teal,
              fontFamily: GoogleFonts.nunito().fontFamily,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              colorScheme: const ColorScheme.light(
                primary: Colores.colorPrimario,
              ),
              appBarTheme: AppBarTheme(
                titleTextStyle: GoogleFonts.castoro(),
              ),
              textTheme: TextTheme(
                bodySmall: GoogleFonts.oswald(),
              ),
            ),
            initialRoute: Routes.initialRoute,
            onGenerateRoute: Routes.generateRoute,
            //routes: Routes.routes,
          );
        }));
  }
}
