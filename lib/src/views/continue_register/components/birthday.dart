import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:provider/provider.dart';

class Birthday extends StatefulWidget {
  const Birthday({Key? key}) : super(key: key);

  @override
  _BirthdayState createState() => _BirthdayState();
}

class _BirthdayState extends State<Birthday> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    // Inicializa la fecha seleccionada con la fecha actual
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: InputDecorator(
        decoration: const InputDecoration(
          labelText: 'Fecha de nacimiento',
          hintText: 'Selecciona tu fecha de nacimiento',
          // Muestra un icono de calendario como sufijo
          suffixIcon: Icon(
            Icons.calendar_today,
            color: Colores.colorTextoFuerte,
          ),
        ),
        child: Text(
          // Muestra la fecha seleccionada en el campo de texto
          '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  // Método para mostrar el selector de fecha
  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 110)),
      lastDate: DateTime.now(),
      helpText: 'Selecciona tu fecha de nacimiento',
      cancelText: 'Cancelar',
      confirmText: 'Confirmar',
      fieldLabelText: 'Fecha de nacimiento',
      fieldHintText: 'Selecciona tu fecha de nacimiento',
      errorFormatText: 'Ingresa una fecha válida',
      errorInvalidText: 'La fecha seleccionada no es válida',
      barrierColor: Colors.black54,
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // Actualiza el valor en el modelo de usuario
        context.read<UserModel>().birthday = _selectedDate;
      });
    }
  }
}
