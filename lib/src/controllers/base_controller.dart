import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/app/app_model.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:flutter_test_vocacional_1/src/routes/router.dart';
import 'package:flutter_test_vocacional_1/src/services/auth/auth.dart';
import 'package:provider/provider.dart';

late BuildContext _mainContext;

void init(BuildContext c) => _mainContext = c;

class BaseController {
  //models
  AppModel appModel = _mainContext.read();
  UserModel userModel = _mainContext.read();

  //services
  AuthService authService = _mainContext.read();

  //Router
  Routes routes = _mainContext.read();
}
