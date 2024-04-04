import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/controllers/login_controller.dart';
import 'package:flutter_test_vocacional_1/src/routes/router.dart';

class Reset extends StatefulWidget {
  final String resetPasswordLink;
  const Reset({
    Key? key,
    required this.resetPasswordLink,
  }) : super(key: key);

  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submitNewPassword() async {
    // Implementa la lógica para enviar la nueva contraseña aquí
    final newPassword = _controller.text;
    final resetPasswordLink =
        widget.resetPasswordLink; // Obtener el enlace del widget padre

    // Extraer el correo electrónico del enlace
    RegExp emailRegex = RegExp(r'resetPassword\/(.*?)\/');
    String email = emailRegex.firstMatch(resetPasswordLink)?.group(1) ?? '';

    await LoginController()
        .handleResetPasswordLink(
          resetPasswordLink: widget.resetPasswordLink,
          email: email,
          newPassword: newPassword,
        )
        .whenComplete(
          () => Routes.showScreen(
            context,
            'login',
          ),
        );

    // Ejemplo de cómo imprimir la nueva contraseña
    debugPrint('Nueva contraseña: $newPassword');
    // Puedes enviar la contraseña al servidor o realizar otras operaciones aquí
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.black,
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const AutoSizeText(
              'Restablecer Contraseña',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              maxFontSize: 30,
              minFontSize: 14,
              maxLines: 1,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Nueva Contraseña',
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                controller: _controller,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitNewPassword,
              child: const Text('Enviar'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
