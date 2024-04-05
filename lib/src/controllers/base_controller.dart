// ignore_for_file: comment_references

import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/app/app_model.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:flutter_test_vocacional_1/src/routes/router.dart';
import 'package:flutter_test_vocacional_1/src/services/auth/auth.dart';
import 'package:provider/provider.dart';

late BuildContext _mainContext;

/// el método [init] se encarga de inicializar el contexto de la aplicación
/// pasandoselo a la clase BaseController con los demas modelos
void init(BuildContext c) => _mainContext = c;

/// La clase [BaseController] es la clase base de controladora de la aplicación.
/// Esta clase tiene la responsabilidad de inicializar y proporcionar acceso a
/// los modelos y servicios necesarios para la funcionamiento de la aplicación.
/// Esta clase se utiliza como una clase base para otras clases de
/// controladoras.
class BaseController {
  /// El constructor de la clase [BaseController] no recibe parámetros.

  /// El campo [appModel] es una instancia de la clase [AppModel].
  /// Se utiliza para proporcionar acceso a la configuración de la aplicación.
  /// Se obtiene mediante el metodo [read] del [BuildContext] pasado como
  /// parametro a la función [init].
  AppModel appModel = _mainContext.read();

  /// El campo [userModel] es una instancia de la clase [UserModel].
  /// Se utiliza para proporcionar acceso a los datos del usuario.
  /// Se obtiene mediante el metodo [read] del [BuildContext] pasado como
  /// parametro a la función [init].
  UserModel userModel = _mainContext.read();

  /// El campo [authService] es una instancia de la clase [AuthService].
  /// Se utiliza para manejar la autenticación del usuario.
  /// Se obtiene mediante el metodo [read] del [BuildContext] pasado como
  /// parametro a la función [init].
  AuthService authService = _mainContext.read();

  /// El campo [routes] es una instancia de la clase [Routes].
  /// Se utiliza para manejar las rutas de la aplicación.
  /// Se obtiene mediante el metodo [read] del [BuildContext] pasado como
  /// parametro a la función [init].
  Routes routes = _mainContext.read();
}
