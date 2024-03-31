import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/controllers/base_controller.dart';

enum UserModelStatus {
  Ended,
  Loading,
  Error,
}

class UserModel with ChangeNotifier {
  UserModelStatus _status = UserModelStatus.Ended;
  String _errorCode = '';
  String _errorMessage = '';
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

  // Setters
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
    _correo = userDoc['correo'];
    _password = userDoc['password'];
    _nombre = userDoc['nombre'];
    _apellidoP = userDoc['apellidoP'];
    _apellidoM = userDoc['apellidoM'];
    _curp = userDoc['curp'];
    _carreras = userDoc['carreras'];
    _birthday = userDoc['birthday'];

    notifyListeners();
  }

  UserModel();

  UserModel.instance() {
    //TODO Add code here
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
