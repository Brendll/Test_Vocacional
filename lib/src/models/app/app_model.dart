import 'package:flutter/material.dart';

enum AppModelStatus {
  Ended,
  Loading,
  Error,
}

class AppModel with ChangeNotifier {
  AppModelStatus _status = AppModelStatus.Ended;
  final String _errorCode = '';
  final String _errorMessage = '';
  String _rutaCarreras = '/carreras/';

  String get rutaCarreras => _rutaCarreras;

  set rutaCarreras(String value) {
    _rutaCarreras = value;
    notifyListeners();
  }

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  AppModelStatus get status => _status;

  AppModel();

  AppModel.instance() {
    //TODO Add code here
  }

  void getter() {
    _status = AppModelStatus.Loading;
    notifyListeners();

    //TODO Add code here

    _status = AppModelStatus.Ended;
    notifyListeners();
  }

  void setter() {
    _status = AppModelStatus.Loading;
    notifyListeners();

    //TODO Add code here

    _status = AppModelStatus.Ended;
    notifyListeners();
  }

  void update() {
    _status = AppModelStatus.Loading;
    notifyListeners();

    //TODO Add code here

    _status = AppModelStatus.Ended;
    notifyListeners();
  }

  void remove() {
    _status = AppModelStatus.Loading;
    notifyListeners();

    //TODO Add code here

    _status = AppModelStatus.Ended;
    notifyListeners();
  }
}
