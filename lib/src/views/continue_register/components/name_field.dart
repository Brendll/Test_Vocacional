import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:provider/provider.dart';

class NameField extends StatelessWidget {
  const NameField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,

      // Ejemplo de un campo de entrada de texto
      decoration: const InputDecoration(
        counterStyle: TextStyle(
          color: Colores.colorAcento,
        ),
        //icon: Icon(Icons.person),
        prefixIcon: Icon(Icons.person),
        prefixIconColor: Colores.colorTextoFuerte,
        hintText: 'Ingresa tu nombre',
        labelText: 'Nombre',
      ),
      onChanged: (value) => context.read<UserModel>().nombre = value,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingresa tu nombre';
        }
        return null;
      },
    );
  }
}
