import 'package:flutter/material.dart';

class CarrerasModel with ChangeNotifier {
  List<dynamic> _carreras = [];

  List<dynamic> get carreras => _carreras;

  set carreras(List<dynamic> value) {
    _carreras = value;
    notifyListeners();
  }
}
