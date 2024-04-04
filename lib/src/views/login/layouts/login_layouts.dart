//import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_test_vocacional_1/src/controllers/login_controller.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginLayouts extends StatelessWidget {
  LoginLayouts({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: FlutterLogin(
        userType: LoginUserType.email,
        onLogin: (p0) {
          LoginController().signInWithEmailAndPassword(
            context: context,
            email: p0.name,
            password: p0.password,
          );
          return null;
        },
        onSignup: (p0) {
          LoginController()
              .signUpWithEmailAndPassword(context, p0.name!, p0.password!);
          return null;
        },
        //onSubmitAnimationCompleted: () => Routes.showScreen(context, 'test'),
        onRecoverPassword: (p0) {
          LoginController().recoverPassword(context, p0);
          return null;
        },
        logoTag: 'CBTis 61',
        title: 'CBTis 61',
        initialIsoCode: 'es',

        logo: const AssetImage(
          //'https://cbtis74.edu.mx/wp-content/uploads/2024/03/DGETI-horizontal-1024x341.png',
          //'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/DGETI_logo.svg/865px-DGETI_logo.svg.png',
          //scale: 10,
          'assets/images/logo2.png',
        ),
        scrollable: true,
        titleTag: 'CBTis 61',
        theme: LoginTheme(
          logoWidth: 800,
          titleStyle: TextStyle(
            fontFamily: GoogleFonts.castoro().fontFamily,
          ),
          accentColor: Colors.black,
          pageColorDark: Colores.colorFondoFuerte,
          pageColorLight: Colores.colorFondoClaro,
          afterHeroFontSize: 25,
          primaryColor: Colores.colorPrimario,
          cardTheme: const CardTheme(
            color: Colors.white,
            elevation: 4,
            shadowColor: Colors.black,
            margin: EdgeInsets.all(10),
            surfaceTintColor: Colors.white,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          errorColor: Colores.colorError,
        ),
        //initialAuthMode: AuthMode.login,
        confirmSignupKeyboardType: TextInputType.emailAddress,

        messages: LoginMessages(
          signUpSuccess: '¡Cuenta creada exitosamente!',
          additionalSignUpFormDescription: 'Ingresa tus datos adicionales',
          additionalSignUpSubmitButton: 'Continuar',
          confirmRecoverIntro: 'Ingresa tu correo para confirmar',
          recoverPasswordIntro:
              'Ingresa tu correo para recuperar tu contraseña',
          confirmRecoverSuccess: '¡Enviado exitosamente!',
          confirmSignupButton: 'Confirmar registro',
          confirmSignupIntro:
              'Ingresa el código de confirmación enviado a tu correo',
          confirmSignupSuccess: '¡Registro confirmado exitosamente!',
          confirmationCodeHint: 'Código de confirmación',
          confirmationCodeValidationError: 'Código de confirmación inválido',
          flushbarTitleSuccess: 'Éxito',
          providersTitleFirst: 'Iniciar sesión con',
          providersTitleSecond: 'O continua con',
          recoverCodePasswordDescription:
              'Ingresa el código de recuperación y crea una nueva contraseña',
          recoveryCodeHint: 'Código de recuperación',
          recoveryCodeValidationError: 'Código de recuperación inválido',
          resendCodeButton: 'Reenviar código',
          resendCodeSuccess: 'Código reenviado exitosamente',
          setPasswordButton: 'Establecer contraseña',
          userHint: 'Correo electrónico',
          passwordHint: 'Contraseña',
          confirmPasswordHint: 'Confirmar contraseña',
          loginButton: 'Iniciar Sesión',
          signupButton: 'Registrar',
          forgotPasswordButton: '¿Olvidaste tu contraseña?',
          recoverPasswordButton: 'Recuperar Contraseña',
          goBackButton: 'Regresar',
          confirmPasswordError: '¡Las contraseñas no coinciden!',
          recoverPasswordDescription:
              'Para recuperar tu contraseña, ingresa tu correo electrónico y te enviaremos un enlace para cambiarla',
          recoverPasswordSuccess: 'Contraseña recuperada exitosamente',
        ),
      ),
    );
  }
}
