import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
//import 'package:flutter_test_vocacional_1/models/login/login_model.dart';
// import controller
//import 'package:flutter_test_vocacional_1/controllers/login/login_controller.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    LoginController viewController = LoginController();
    //   return ChangeNotifierProvider<LoginModel>(
    //   create: (context) => LoginModel.instance(),
    // child: Consumer<LoginModel>(
    //     builder: (context, viewModel, child) {
    return Container(
      //TODO Add layout or component here
      child: AutoSizeText(
        'data',
      ),
    );
    // },
    // ),
    // );
  }
}
