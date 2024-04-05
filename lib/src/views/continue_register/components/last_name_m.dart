import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:provider/provider.dart';

class LastNameM extends StatelessWidget {
  const LastNameM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // Ejemplo de un campo de entrada de texto
      decoration: const InputDecoration(
        counterStyle: TextStyle(
          color: Colores.colorAcento,
        ),
        //icon: Icon(Icons.person),
        prefixIcon: Icon(Icons.person_2),
        prefixIconColor: Colores.colorTextoFuerte,
        hintText: 'Ingresa tu Apellido materno',
        labelText: 'Apellido Materno',
      ),
      onChanged: (value) => context.read<UserModel>().apellidoM = value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingresa tu Apellido Materno';
        }
        return null;
      },
    );
  }
}
