import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/app.dart';

import 'package:url_strategy/url_strategy.dart'; // Importa url_strategy

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  setPathUrlStrategy(); // Establece la estrategia de URL

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
