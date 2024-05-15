// ignore_for_file: public_member_api_docs

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum UserModelStatus {
  Ended,
  Loading,
  Error,
}

class UserModel with ChangeNotifier {
  UserModel();
  UserModel.instance() {
    //TODO Add code here
  }
  UserModelStatus _status = UserModelStatus.Ended;
  String _errorCode = '';
  String _errorMessage = '';
  bool _error = false;

  String _correo = '';
  String _password = '';
  String _nombre = '';
  String _apellidoP = '';
  String _apellidoM = '';
  String _curp = '';
  List<String> _carreras = [];
  DateTime _birthday = DateTime.now();

  // Getters
  String get correo => _correo;
  String get password => _password;
  String get nombre => _nombre;
  String get apellidoP => _apellidoP;
  String get apellidoM => _apellidoM;
  String get curp => _curp;
  List<String> get carreras => _carreras;
  DateTime get birthday => _birthday;
  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  UserModelStatus get status => _status;

  bool get error => _error;
  // Setters

  set status(UserModelStatus value) {
    _status = value;
    notifyListeners();
  }

  set error(bool value) {
    _error = value;
    notifyListeners();
  }

  set errorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  set errorCode(String value) {
    _errorCode = value;
    notifyListeners();
  }

  set correo(String value) {
    _correo = value;
    notifyListeners();
  }

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  set nombre(String value) {
    _nombre = value;
    notifyListeners();
  }

  set apellidoP(String value) {
    _apellidoP = value;
    notifyListeners();
  }

  set apellidoM(String value) {
    _apellidoM = value;
    notifyListeners();
  }

  set curp(String value) {
    _curp = value;
    notifyListeners();
  }

  set carreras(List<String> value) {
    _carreras = value;
    notifyListeners();
  }

  set birthday(DateTime value) {
    _birthday = value;
    notifyListeners();
  }

  // Método para establecer todos los datos del usuario
  void setter(DocumentSnapshot userDoc) {
    _correo = userDoc['correo'].toString();
    _password = userDoc['password'].toString();
    _nombre = userDoc['nombre'].toString();
    _apellidoP = userDoc['apellidoP'].toString();
    _apellidoM = userDoc['apellidoM'].toString();
    _curp = userDoc['curp'].toString();
    _carreras = (userDoc['carreras'] as List<dynamic>)
        .map((carrera) => carrera.toString())
        .toList();
    final dynamic birthdayData = userDoc['birthday'];
    if (birthdayData is int) {
      // Si el valor es un timestamp de tipo int
      _birthday = DateTime.fromMillisecondsSinceEpoch(birthdayData);
    } else if (birthdayData is Timestamp) {
      // Si el valor es un Timestamp de Firestore
      _birthday = birthdayData.toDate();
    } else {
      // Manejar otro tipo de valores o lanzar un error si es necesario
      throw ArgumentError(
          'El valor del campo birthday no es un timestamp válido.');
    }

    notifyListeners();
  }

  Future<bool> getter(String uid) async {
    _status = UserModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    //AuthService authService = Provider.of<AuthService>(context, listen: false);

    _status = UserModelStatus.Ended;

    notifyListeners();
    return true;
  }

  void update() {
    _status = UserModelStatus.Loading;
    notifyListeners();

    //TODO Add code here

    _status = UserModelStatus.Ended;
    notifyListeners();
  }

  void remove() {
    _status = UserModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    _correo = '';
    _password = '';
    _nombre = '';
    _apellidoP = '';
    _apellidoM = '';
    _curp = '';
    _carreras = [];
    _birthday = DateTime.now();

    _status = UserModelStatus.Ended;
    notifyListeners();
  }
}
