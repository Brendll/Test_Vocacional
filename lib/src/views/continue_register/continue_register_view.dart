import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/controllers/base_controller.dart'
    as controller;
import 'package:flutter_test_vocacional_1/src/controllers/login_controller.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:flutter_test_vocacional_1/src/routes/router.dart';
import 'package:flutter_test_vocacional_1/src/services/auth/auth.dart';
import 'package:flutter_test_vocacional_1/src/util/responsive/responsive_design.dart';
import 'package:flutter_test_vocacional_1/src/views/continue_register/layouts/continue_register_layout.dart';
import 'package:flutter_test_vocacional_1/src/views/login/components/show_error.dart';
import 'package:flutter_test_vocacional_1/src/views/util/Bar/title_bar.dart';
import 'package:flutter_test_vocacional_1/src/views/util/build_widget_screen_type/build_widget_screen_type.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:provider/provider.dart';

class ContinueRegisterView extends StatefulWidget {
  ContinueRegisterView({Key? key}) : super(key: key);

  @override
  State<ContinueRegisterView> createState() => _ContinueRegisterViewState();
}

class _ContinueRegisterViewState extends State<ContinueRegisterView> {
  //final ResponsiveDesign rd = ResponsiveDesign();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  // Agrega una clave de formulario
  @override
  Widget build(BuildContext context) {
    controller.init(context);

    context.read<ResponsiveDesign>().initScreen(context);
    debugPrint(
      'El estado de autenticación es ${context.watch<AuthService>().status}',
    );
    if (context.watch<AuthService>().status == AuthStatus.Unauthenticated) {
      context.read<UserModel>().errorCode = 'No se ha iniciado sesión';
      context.read<UserModel>().errorMessage =
          'No se puede ingresar a esta pagina '
          'sin iniciar sesión';

      Future(
        () => showError(
          context,
          navegar: () => Routes.showScreen(context, 'login'),
        ),
      );
    } else if (context.watch<UserModel>().status == UserModelStatus.Error) {
      Future(
        () => showError(
          context,
          navegar: () {
            context.read<UserModel>().status = UserModelStatus.Ended;
            context.read<UserModel>().error = false;
            //Navigator.canPop(context);
          },
        ),
      );
    }
    return Scaffold(
      drawer: context.watch<ViewMenu>().widgetDrawer,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colores.colorAppBar,
        title: TitleBar(),
        centerTitle: true,
        elevation: 1,
        actionsIconTheme: const IconThemeData(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      body: ContinueRegisterLayout(formKey: _formKey),
    );
  }
}
