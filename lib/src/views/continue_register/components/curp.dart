import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:provider/provider.dart';

class Curp extends StatelessWidget {
  const Curp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      decoration: const InputDecoration(
        counterStyle: TextStyle(
          color: Colores.colorAcento,
        ),
        prefixIcon: Icon(Icons.person),
        prefixIconColor: Colores.colorTextoFuerte,
        hintText: 'Ingresa tu CURP',
        labelText: 'CURP',
      ),
      onChanged: (value) =>
          context.read<UserModel>().curp = value.toUpperCase(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingresa tu CURP';
        }

        final curpRegExp = RegExp(
          // La CURP comienza con una letra mayúscula del primer apellido.
          '^[A-Z]{1}'

          // La segunda letra es la primera vocal interna del primer apellido.
          '[AEIOU]{1}'

          // La tercera letra es la primera letra del segundo apellido.
          '[A-Z]{1}'

          // La cuarta letra es la primera letra del nombre.
          '[A-Z]{1}'

          // Los próximos seis caracteres son los dígitos del año, mes y día de nacimiento.
          '[0-9]{2}' // Los dígitos del año de nacimiento.
          '[0-9]{2}' // Los dígitos del mes de nacimiento.
          '[0-9]{2}' // Los dígitos del día de nacimiento.

          // Sexo: H para hombre y M para mujer.
          '[HM]{1}'

          // Luego vienen dos letras que representan el lugar de nacimiento codificado.
          '[A-Z]{2}'

          // Las siguientes tres letras son las primeras consonantes internas del primer apellido,
          // segundo apellido y nombre.
          '[A-Z]{1}' // Primera consonante interna del primer apellido.
          '[A-Z]{1}' // Primera consonante interna del segundo apellido.
          '[A-Z]{1}' // Primera consonante interna del nombre.

          // El último carácter es un carácter diferenciador de homonimia y siglo.
          //r'[0-9A-Z]{2}$',
          r'[A-Z0-9]{2}$',
          caseSensitive: false,
        );

        // // Validar CURP con expresión regular
        // final curpRegExp = RegExp(
        //   //VAMOS A COLOCAR UN EJEMPLO

        //   // G DE GOCE021029HTLNRRA3
        //   // La CURP comienza con una letra mayúscula del primer apellido.
        //   '^[A-Z]{1}'

        //   // O DE GOCE021029HTLNRRA3
        //   // La segunda letra es la primera vocal interna del primer apellido.
        //   '[AEIOU]{1}'

        //   // C DE GOCE021029HTLNRRA3
        //   // La tercera letra es la primera letra del segundo apellido.
        //   '[A-Z]{1}'

        //   // E DE GOCE021029HTLNRRA3
        //   // La cuarta letra es la primera letra del nombre.
        //   '[A-Z]{1}'

        //   // Los próximos seis caracteres son los dígitos del año, mes y día de
        //   // nacimiento.

        //   // 02 DE GOCE021029HTLNRRA3
        //   '[0-9]{2}' // Los dígitos del año de nacimiento.

        //   // 10 DE GOCE021029HTLNRRA3
        //   '[0-9]{2}' // Los dígitos del mes de nacimiento.
        //   //'[0-3]{1}' // El primer dígito del día de nacimiento.

        //   // 29 DE GOCE021029HTLNRRA3
        //   '[0-9]{2}' // El segundo dígito del día de nacimiento.

        //   // H DE GOCE021029HTLNRRA3
        //   // Sexo: H para hombre y M para mujer.
        //   '[HM]{1}'

        //   // TL DE GOCE021029HTLNRRA3
        //   // Luego vienen dos letras que representan el lugar de nacimiento
        //   // codificado.
        //   '[A-Z]{2}'

        //   // Los siguientes tres caracteres son las primeras consonantes
        //   // internas del primer apellido, segundo apellido y nombre.

        //   // N DE GOCE021029HTLNRRA3
        //   '[A-Z0-9]{1}' // Primera consonante interna del primer apellido.

        //   // R DE GOCE021029HTLNRRA3
        //   '[A-Z0-9]{1}' // Primera consonante interna del segundo apellido.

        //   // R DE GOCE021029HTLNRRA3
        //   '[A-Z0-9]{1}' // Primera consonante interna del nombre.
        //   // El penúltimo carácter es un carácter diferenciador de homonimia y siglo.

        //   // A3 DE GOCE021029HTLNRRA3
        //   r'[0-9A-Z]{1}$',
        //   caseSensitive: false,
        // );
        if (!curpRegExp.hasMatch(value)) {
          return 'El CURP no tiene un formato válido';
        }
        return null;
      },
    );
  }
}
