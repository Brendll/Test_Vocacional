import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:provider/provider.dart';

class LastNameP extends StatelessWidget {
  const LastNameP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // Ejemplo de un campo de entrada de texto
      decoration: const InputDecoration(
        counterStyle: TextStyle(
          color: Colores.colorAcento,
        ),
        //icon: Icon(Icons.person),
        prefixIcon: Icon(Icons.person_4),
        prefixIconColor: Colores.colorTextoFuerte,
        hintText: 'Ingresa tu Apellido Paterno',
        labelText: 'Apellido Paterno',
      ),

      onChanged: (value) => context.read<UserModel>().apellidoP = value,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingresa tu Apellido Paterno';
        }
        return null;
      },
    );
  }
}
