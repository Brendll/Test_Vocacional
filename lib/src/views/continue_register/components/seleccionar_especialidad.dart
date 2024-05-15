import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';
import 'package:flutter_test_vocacional_1/src/views/util/color/colores.dart';
import 'package:provider/provider.dart';

class SeleccionarEspecialidad extends StatefulWidget {
  final List<String> especialidades;

  const SeleccionarEspecialidad({Key? key, required this.especialidades})
      : super(key: key);

  @override
  _SeleccionarEspecialidadState createState() =>
      _SeleccionarEspecialidadState();
}

class _SeleccionarEspecialidadState extends State<SeleccionarEspecialidad> {
  List<String> _especialidadesSeleccionadas = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          'Seleccionar Especialidad:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          maxFontSize: 18,
          minFontSize: 11,
          maxLines: 1,
        ),
        const SizedBox(height: 10),
        Wrap(
          runSpacing: 8,

          spacing: 10, // Espaciado entre los elementos
          children: widget.especialidades.map((especialidad) {
            final isSelected =
                _especialidadesSeleccionadas.contains(especialidad);
            final number = isSelected
                ? (_especialidadesSeleccionadas.indexOf(especialidad) + 1)
                    .toString()
                : '';
            return Padding(
              padding:
                  const EdgeInsets.all(4), // Espacio alrededor de cada elemento
              child: FilterChip(
                label: Text(especialidad),
                selected: isSelected,
                elevation: 5,
                backgroundColor:
                    isSelected ? Colors.green : Colores.colorFondoClaro,
                deleteIcon: isSelected
                    ? Text(number)
                    : null, // Reemplaza el ícono por el número
                onDeleted: () {
                  setState(() {
                    _especialidadesSeleccionadas.remove(especialidad);
                  });
                },
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      if (_especialidadesSeleccionadas.length < 3) {
                        _especialidadesSeleccionadas.add(especialidad);
                      }
                    } else {
                      _especialidadesSeleccionadas.remove(especialidad);
                    }
                    // Actualizar las carreras en UserModel
                    context.read<UserModel>().carreras =
                        _especialidadesSeleccionadas;
                  });
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
