import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/firebase_options.dart';
import 'package:flutter_test_vocacional_1/src/app.dart';
import 'package:url_strategy/url_strategy.dart'; // Importa url_strategy

/// Esta aplicación fue realizada por las siguientes personas:
///
/// Autor: Brenda Luna Luna
/// [Facebook](https://www.facebook.com/profile.php?id=100078790204631)
/// ![foto](https://scontent-qro1-1.xx.fbcdn.net/v/t39.30808-6/403716205_336865178949820_1501928742109710618_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_ohc=ls-FUjvfMbUAX9e_90D&_nc_oc=AdjKtv0xm8E_ROdI7U0BIay1b0grVZIMc-O8byZOiudggnSMK9YkmmTb6jHt6zm-p5lgu7jQCAa2lORZc_p1V14V&_nc_ht=scontent-qro1-1.xx&oh=00_AfAoDN0lFrZekckDKj5W79ros-VSiKpcP9N6b65Q4DvSzQ&oe=66119776)
/// [Ing. Brenda Luna Luna](https://github.com/Brendll)
/// Asesora: Sandra Luna Luna
/// Asesor de Empresa: Ing. Jose Alejandro Hernandez Rivera.
///
///
/// [Test_Vocacional](https://github.com/Brendll/Test_Vocacional.git)
///
///
/// [main] es la funcion principal de la aplicación
/// [MyApp] es la clase principal de la aplicación
void main() async {
  setPathUrlStrategy(); // Establece la estrategia de URL

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
