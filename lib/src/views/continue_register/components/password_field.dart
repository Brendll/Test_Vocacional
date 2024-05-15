import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:provider/provider.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:
          !_showPassword, // Oculta o muestra la contraseña según el estado de
      // _showPassword
      decoration: InputDecoration(
        counterStyle: const TextStyle(
          color: Colores.colorAcento,
        ),
        prefixIcon: const Icon(Icons.password),
        prefixIconColor: Colores.colorTextoFuerte,
        hintText: 'Ingresa tu contraseña',
        labelText: 'Password',

        // Utiliza un IconButton para permitir al usuario cambiar el estado
        ////de _showPassword
        suffixIcon: IconButton(
          icon: Icon(
            _showPassword ? Icons.visibility : Icons.visibility_off,
            color: Colores.colorTextoFuerte,
          ),
          onPressed: () {
            setState(() {
              _showPassword =
                  !_showPassword; // Cambia el estado de _showPassword
            });
          },
        ),
      ),
      onChanged: (value) async => context.read<UserModel>().password = value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingresa tu contraseña';
        }
        return null;
      },
    );
  }
}
